package com.swdo.test.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.BoardDAO;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.MemberVO;


@Service
public class BoardService {

private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	private BoardDAO dao;
	
	
	@Autowired
	private HttpSession session;
	
	public ArrayList<HashMap<String, Object>> boardSelectALL(){
		
		ArrayList<HashMap<String, Object>> list = dao.boardSelectALL();
		logger.info("받아온 회원 정보 리스트 : {} ", list);
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> boardList(BoardVO board) {
		
		ArrayList<HashMap<String, Object>> result = null;
		if(board.getId() != null)
			result = dao.boardList(board);
		else
			board.setId(((MemberVO)session.getAttribute("loginVO")).getId()); result = dao.boardList(board);
		
		logger.info("개인 회원 정보 : {}", result);
		
		return result;
	}
	
	public String boardInsert(BoardVO board) {
		String path = "";
		
		board.setId(((MemberVO)session.getAttribute("loginVO")).getId());
		
		int cnt = dao.boardInsert(board);
		
		if(cnt != 0) {
			logger.info("게시물 등록 성공");
			path = "redirect:/board/boardList";
		}else {
			logger.info("게시물 등록 실패");
			path = "redirect:/board/boardWriteForm";
		}
		
		return path;
	}
	
	public BoardVO boardSelectOne(BoardVO board) {
		
		BoardVO result = dao.boardSelectOne(board);
		
		return result;
	}
	
	public String boardUpdate(BoardVO board) {
		
		String path = "";
		
		board.setId(((MemberVO)session.getAttribute("loginVO")).getId());
		
		int cnt = dao.boardUpdate(board);
		
		if( cnt != 0) {
			logger.info("업데이트 성공");
			path = "redirect:/board/boardList";
		} else {
			logger.info("업데이트 실패");
			path = "redirect:/board/boardList";
		}
		
		return path;
		
	}
	
	public void boardUpdateCnt(BoardVO board) {
		
		int cnt = 0;
		
		cnt = dao.boardUpdateCnt(board);
		
		if(cnt != 0)
			logger.info("추천수 업데이트 성공");
		else
			logger.info("추천수 업데이트 실패");
		
	}
	
	public void boardDelete(BoardVO board) {
		int cnt = dao.boardDelete(board);
		
		if(cnt != 0)
			logger.info("삭제 성공");
		else
			logger.info("삭제 실패");
	}
}
