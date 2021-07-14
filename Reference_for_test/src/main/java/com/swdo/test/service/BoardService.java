package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.BoardDAO;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.CustomerVO;

@Service
public class BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public void boardInsert(BoardVO board) {
		
		CustomerVO customer = (CustomerVO)session.getAttribute("loginVO");
		board.setCustomer_id(customer.getCustomer_id());
		
		logger.info(board.getCustomer_id());
		
		int cnt = 0;
		
		cnt = dao.boardInsert(board);
		
		if(cnt == 0) {
			logger.info("게시 실패 : {}", board);
		}else {
			logger.info("게시 성공 : {} ", board);
		}
	}
}
