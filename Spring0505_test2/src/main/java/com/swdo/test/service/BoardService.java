package com.swdo.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.controller.MemberController;
import com.swdo.test.dao.BoardDAO;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.MemberVO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private HttpSession session;
	

	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	

	public void boardInsert(BoardVO board) {
		MemberVO member = (MemberVO)session.getAttribute("loginVO");
		board.setId(member.getId());
		
		int cnt = dao.boardInsert(board);
		
		if(cnt == 0) {
			logger.info("글 등록 실패 : {}", board);
		} else {
			logger.info("글 등록 성공 : {}", board);
		}
	}
	
	public ArrayList<BoardVO> boardSelectAll(BoardVO board){
		ArrayList<BoardVO> list = dao.boardSelectAll(board);
		logger.info("글 전체 목록 조회 : {}", list);
		return list;
	}
	
	public BoardVO boardSelectOne(int boardnum) {
		BoardVO board = dao.boardSelectOne(boardnum);
		logger.info("특정 글 조회 : {}", board);
		return board;
	}
	
	public void boardDelete(BoardVO board) {
		MemberVO member = (MemberVO)session.getAttribute("loginVO");
		board.setId(member.getId());
		
		int cnt = dao.boardDelete(board);
		
		if(cnt == 0) {
			logger.info("글 삭제 실패 : {}", board);
		}else {
			logger.info("글 삭제 성공 : {}", board);
		}
	}
	
	public void boardUpdate(BoardVO board) {
		MemberVO member = (MemberVO)session.getAttribute("loginVO");
		board.setId(member.getId());
		
		int cnt = dao.boardUpdate(board);
		
		if(cnt == 0){
			logger.info("글 수정 실패 : {}", board);
		}else {
			logger.info("글 수정 성공 : {}", board);
		}
	}
}
