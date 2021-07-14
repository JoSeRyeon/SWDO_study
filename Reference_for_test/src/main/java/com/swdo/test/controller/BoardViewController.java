package com.swdo.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.BoardService;
import com.swdo.test.vo.BoardVO;

@Controller
@RequestMapping(value = "/board")
public class BoardViewController {

	private static final Logger logger = LoggerFactory.getLogger(BoardViewController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm() {
		
		logger.info("게시판 메인 페이지 이동");
		return "board/listForm";
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		
		logger.info("글 등록 페이지 이동");
		return "board/writeForm";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO board) {
		
		logger.info("새로운 게시글 등록");
		logger.info("게시글 정보 : {}", board);
		
		service.boardInsert(board);
		
		return "redirect:/board/listForm";
	}
	
}
