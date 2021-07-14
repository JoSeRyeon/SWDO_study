package com.nineseven.lamp.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nineseven.lamp.service.BoardService;
import com.nineseven.lamp.vo.BoardVO;

@Controller
public class BoardConrtoller {
	
	private static final Logger logger = LoggerFactory.getLogger(memberViewController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String Board(Model model) {
		logger.info("글 목록 페이지");
		ArrayList<BoardVO> list = service.boardSelectAll();
		model.addAttribute("boardList", list);
		return "board/board";
	}
	
	@RequestMapping(value = "/board/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		logger.info("글 등록 페이지 이동");
		return "board/writeForm";
	}
	
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public String write(BoardVO board) {
		logger.info("전달된 글 등록 데이터 {}", board);
		// 글 등록 기능
		service.boardInsert(board);
		return "board/success";
	}
	
}
