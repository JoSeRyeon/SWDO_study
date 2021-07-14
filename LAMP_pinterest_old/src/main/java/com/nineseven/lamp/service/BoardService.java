package com.nineseven.lamp.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nineseven.lamp.dao.BoardDAO;
import com.nineseven.lamp.vo.BoardVO;
import com.nineseven.lamp.vo.memberVO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	public void boardInsert(BoardVO board) {
		memberVO customer = (memberVO)session.getAttribute("loginVO");
		board.setId(customer.getId());
		
		int cnt = dao.boardInsert(board);
		
		if(cnt == 0) {
			logger.info("글 등록 실패 : {}", board);
		} else {
			logger.info("글 등록 성공 : {}", board);
		}
	}
	
	public ArrayList<BoardVO> boardSelectAll() {
		ArrayList<BoardVO> list = dao.boardSelectAll();
		logger.info("글 전체 목록 조회 : {}", list);
		return list;
	}
	
}


















