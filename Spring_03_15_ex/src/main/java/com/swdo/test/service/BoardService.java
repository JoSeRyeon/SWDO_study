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

	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletResponse response;
	
	private static final String UPLOAD_PATH = "/uploadfiles";
	
	public void boardInsert(BoardVO board, MultipartFile upload) {
		
		CustomerVO customer = (CustomerVO)session.getAttribute("loginVO");
		board.setCustomer_id(customer.getCustomer_id());
		
		if(!upload.isEmpty()) {
		
			logger.info("전달된 파일 정보 : {}", upload);
			// 실제로 업로드 된 파일을 서버에 저장하고 저장된 파일명칭과 원본 파일을 보드 객체에 셋팅
			String savedfile =  FileService.saveFile(upload, UPLOAD_PATH);
			board.setBoard_saved(savedfile);
			board.setBoard_original(upload.getOriginalFilename());
		}
		
		
		
		int cnt = dao.boardInsert(board);
		
		if(cnt == 0) {
			logger.info("글 동록 실패 {}", board);
		} else {
			logger.info("글 등록 성공 : {}", board);
		}
	}
	
	public ArrayList<HashMap<String, Object>> boardSelectALL(String searchText, int startRecord, int countPerPage){
		
		ArrayList<HashMap<String, Object>> list = dao.boardSelectALL(searchText, startRecord, countPerPage);
		logger.info("hashMap 알아보기 : {}", list.get(0));
		logger.info("hashMap 세부 알아보기 : {}" , list.get(0).get("BOARD_NO"));
		logger.info("글 전체 목록 조회 : {}", list);
		
		return list;
	}
	
	public HashMap<String, Object> boardSelectOne(int board_no) {
		
		HashMap<String, Object>  board = dao.boardSelectOne(board_no);
		logger.info("특정 글 조회 {}", board);
		
		return board;
	}
	
	public void boardDelete(BoardVO board) {
		//로그인 한 사람의 정보를 가져와서 그 아이디를 setting 해준다. 
		CustomerVO customer = (CustomerVO)session.getAttribute("loginVO");
		board.setCustomer_id(customer.getCustomer_id());
		
		//조회
		HashMap<String, Object> result = dao.boardSelectOne(board.getBoard_no());
		
		//DB에서 삭제
		
		
		int cnt = dao.boardDelete(board);
		
		if(cnt == 0) {
		logger.info("글 삭제 실패 : {}", board);
		} else {
			
			logger.info("글 삭제 성공 : {}", board);
			
			// 첨부파일이 있을 때만 해야 한다.
			
			if(result.get("BOARD_ORIGINAL") != null) {
			
				String fullPath = UPLOAD_PATH + "/" +(String)result.get("BOARD_SAVED");
				boolean flag = FileService.deleteFile(fullPath);
				
				if(flag) {
					logger.info("첨부파일 삭제 성공");
				}else {
					logger.info("첨부파일 삭제 실패");
				}
			}
		}
	}
	
	public void boardUpdate(BoardVO board, MultipartFile upload) {
		
		CustomerVO customer = (CustomerVO)session.getAttribute("loginVO");
		board.setCustomer_id(customer.getCustomer_id());
		
		//조회
		HashMap<String, Object> result = dao.boardSelectOne(board.getBoard_no());
		
		
		String savedFileName = null;
		String originalFileName = null;
		//수정
		
		
		if(!upload.isEmpty()) {
			
			
			
			// 원본 파일이 있는 경우
			if(result.get("BOARD_SAVED") != null) {
				//파일 삭제하기
				String fullPath = UPLOAD_PATH + "/" + (String)result.get("BOARD_SAVED");
				FileService.deleteFile(fullPath);
			}
			
			//파일 등록해주기
			savedFileName = FileService.saveFile(upload, UPLOAD_PATH);
			originalFileName = upload.getOriginalFilename();
			
			logger.info(originalFileName);

			
		}
		
		board.setBoard_original(originalFileName);
		board.setBoard_saved(savedFileName);
		
		int cnt = dao.boardUpdate(board);
		
		if(cnt == 0) {
		logger.info("글 수정 실패 : {}", board);
		} else {
			logger.info("글 수정 성공 : {}", board);
		}
		
	}
	
	public void download(int board_no) {
		//전달받은 pk로 글 정보 조회
		HashMap<String, Object> board= dao.boardSelectOne(board_no);
		
		//원본 파일명을 구히기
		String originalFileName = (String)(board.get("BOARD_ORIGINAL"));
		// 서버에서 클라이언트에게 무언가를 주고 싶을 때는 HttpServletResponse 객체 사용하기!
		
		// 다운로드 따로 설정을 해야 다운로드를 할 수 있고 그렇지 않으면 그냥 브라우저가 파일을 읽기만 함
		// 헤더에 이름을 설정 즉, 사용자가 다운로드 받는 파일의 명칭으로 로드된다.
		// URLEncoder까지 써준 이유 : 사용자가 올려준 파일이 영문이나 숫자로만 써져있을 확률이 굉장히 적다
		// 즉 어떤 언어로 써져있을지 모르는 것이기 때문에, 파일명칭이 깨지치 않도록 표시가 되도록 
		//파일의 이름을 인코딩을 해서 출력해준다. 
		
		try {
			response.setHeader("Content-Disposition", "attachment;filename="+ URLEncoder.encode(originalFileName,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		String fullPath = UPLOAD_PATH + "/" + board.get("BOARD_SAVED");
		
		FileInputStream fis = null; //물리적인 파일을 서버에 입력하기 위한 통로
		ServletOutputStream sos = null; // 응답 객체를 출력하는 통로
		
		try {
			fis = new FileInputStream(fullPath); //파일과 서버의 연결
			sos = response.getOutputStream(); //응답 객체가 stream을 열 수 있는 메소드를 지님
			
			// 다운로드 한다고 해서 서버에 있는 파일도 없어져서는 
			// 안 되기 때문에 복사를 해서 보내줘야 한다. 
			FileCopyUtils.copy(fis, sos);
			
			// 보내기 위해 만들었던 통로가 다 사용이 되면
			// 없애주는 것까지 무조건 해주어야 한다! 
			// 닫아주는 순서도 중요하다!
			// fis 부터 먼저 열었다면, fis 부터 닫아줘야 한다.
			// 먼저 연 건 먼저 닫기
			fis.close();
			sos.close();
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public int boardTotalRecord(String searchText) {
		
		int totalRecord = dao.boardTotalRecord(searchText);
		
		logger.info("전체 글 개수 : {}", totalRecord);
		
		return totalRecord;
		
		
	}
	
	public void replyInsert(ReplyVO reply) {
		
		CustomerVO loginVO = (CustomerVO) session.getAttribute("loginVO");
		reply.setCustomer_id(loginVO.getCustomer_id());
		
		int cnt = dao.replyInsert(reply);
		
		if(cnt == 0) {
			
			System.out.println("댓글 등록 실패");
			
		}else {
			System.out.println("댓글 등록 성공");
		}
	}
	
	
	public HashMap<String, Object> replySelectList(int board_no){
		
		ArrayList<ReplyVO> replyList = dao.replySelectList(board_no);
		
		CustomerVO loginVO = (CustomerVO) session.getAttribute("loginVO");
		String customer_id = loginVO.getCustomer_id();
		
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("replyList", replyList);
		map.put("customer_id", customer_id);
		
		return map;
		
		
	}
}
