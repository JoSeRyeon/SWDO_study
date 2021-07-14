package com.swdo.test.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.swdo.test.dao.BoardDAO;
import com.swdo.test.util.FileService;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.CustomerVO;
import com.swdo.test.vo.ReplyVO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletResponse response;
	
	private static final String UPLOAD_PATH = "/uploadfiles";
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	public void boardInsert(BoardVO board, MultipartFile upload) {
		CustomerVO customer = (CustomerVO)session.getAttribute("loginVO");
		board.setCustomer_id(customer.getCustomer_id());
		
		//첨부파일이 있을때
		if(!upload.isEmpty()) {
			logger.info("전송된 파일 정보 : {}",upload);
			//실제로 업로드 된 파일을 서버에 저장하고 저장된 파일명칭과 원본 파일명칭을 board객체에 셋팅
			String savedfile = FileService.saveFile(upload, UPLOAD_PATH);
			board.setBoard_saved(savedfile);
			board.setBoard_original(upload.getOriginalFilename());
		}
		
		int cnt = dao.boardInsert(board);
		
		if(cnt == 0) {
			logger.info("글 등록 실패 : {}",board);
		} else {
			logger.info("글 등록 성공 : {}",board);
		}
		
	}
	
	
	public ArrayList<HashMap<String, Object>> boardSelectAll(String searchText,int startRecord , int countPerPage){
		ArrayList<HashMap<String, Object>> list = dao.boardSelectAll(searchText,startRecord, countPerPage);
		logger.info("글 전체 목록 조회 : {}",list);
		return list;
	}
	
	public HashMap<String, Object> boardSelectOne(int board_no) {
		HashMap<String, Object> board = dao.boardSelectOne(board_no);
		logger.info("특정 글 조회 : {}",board);
		return board;
	}
	
	public void boardDelete(BoardVO board) {
		//로그인한 사람의 정보를 가져와서 그 아이디를 setting 해준다.
		CustomerVO customer = (CustomerVO)session.getAttribute("loginVO");
		board.setCustomer_id(customer.getCustomer_id());

		//조회
		HashMap<String, Object> result = dao.boardSelectOne(board.getBoard_no());
		//DB에서 삭제
		int cnt = dao.boardDelete(board);
		
		if(cnt == 0) {
			logger.info("글 삭제 실패 : {}",board);
		} else {
			logger.info("글 삭제 성공 : {}",board);
			//첨부파일이 있을때만 해야한다.
			if(result.get("BOARD_ORIGINAL") != null) {
				String fullPath = UPLOAD_PATH +"/"+((String)result.get("BOARD_SAVED"));
				boolean flag = FileService.deleteFile(fullPath);
				
				if(flag) {
					logger.info("첨부파일 삭제 성공");
				} else {
					logger.info("첨부파일 삭제 실패");
				}
			}
		}
	}
	
	public void boardUpdate(BoardVO board, MultipartFile upload) {
		//로그인한 사람의 정보를 가져와서 그 아이디를 setting 해준다.
		CustomerVO customer = (CustomerVO)session.getAttribute("loginVO");
		board.setCustomer_id(customer.getCustomer_id());
		//조회
		HashMap<String, Object> result = dao.boardSelectOne(board.getBoard_no());
		
		String savedFileName = null;
		String originalFileName = null;
		if(!upload.isEmpty()) {
			
			//원본에 파일이 있는경우
			if(result.get("BOARD_SAVED") != null) {
				//파일 삭제
				String fullPath = UPLOAD_PATH +"/"+((String)result.get("BOARD_SAVED"));
				FileService.deleteFile(fullPath);
			}
			//파일 등록
			savedFileName = FileService.saveFile(upload, UPLOAD_PATH);
			originalFileName = upload.getOriginalFilename();
		}
		
		board.setBoard_original(originalFileName);
		board.setBoard_saved(savedFileName);
		
		//수정
		int cnt = dao.boardUpdate(board);
		
		if(cnt == 0) {
			logger.info("글 수정 실패 : {}",board);
		} else {
			logger.info("글 수정 성공 : {}",board);
		}
	}
	
	
	public void download(int board_no) {
		//전달받은 pk로 글 정보 조회
		HashMap<String, Object> board = dao.boardSelectOne(board_no);
		
		//원본 파일명
		String originalFileName = (String)board.get("BOARD_ORIGINAL");
		
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(originalFileName,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//저장된 파일의 전체 경로
		String fullPath = UPLOAD_PATH +"/"+((String)board.get("BOARD_SAVED"));
		
		FileInputStream fis = null;			//물리적인 파일을 서버로 입력하기 위한 통로
		ServletOutputStream sos = null;		//응답객체를 출력하는 통로
		
		try {
			fis = new FileInputStream(fullPath);
			sos = response.getOutputStream();
			
			FileCopyUtils.copy(fis, sos);
			fis.close();
			sos.close();
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int boardTotalRecord(String searchText) {
		int totalRecord = dao.boardTotalRecord(searchText);
		logger.info("전체 글 개수 : {}",totalRecord);
		return totalRecord;
	}
	
	
	public void replyInsert(ReplyVO reply) {
		//실행전에 해야할 셋팅이 있다.
		CustomerVO loginVO = (CustomerVO)session.getAttribute("loginVO");
		reply.setCustomer_id(loginVO.getCustomer_id());
		int cnt = dao.replyInsert(reply);
		
		if(cnt == 0) {
			System.out.println("댓글 등록 실패");
		}else {
			System.out.println("댓글 등록 성공");
		}
		
	}
	
	
	public ArrayList<ReplyVO> replySelectList(int board_no){
		return dao.replySelectList(board_no);
	}
	
	
	
	
	
	
	
	
	
	
	
}
