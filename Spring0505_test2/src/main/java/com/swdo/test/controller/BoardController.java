package com.swdo.test.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.BoardService;
import com.swdo.test.vo.BoardVO;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/board/listForm", method = RequestMethod.GET)
	public String listForm(Model model, BoardVO board) {
		logger.info("글 목록 페이지 이동 : {}", board);
		ArrayList<BoardVO> list = service.boardSelectAll(board);
		BoardVO board_id = board;
		model.addAttribute("boardList", list);
		model.addAttribute("board_id", board_id);
		return "board/listForm";
	}
	
	@RequestMapping(value="/board/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		logger.info("글 등록 페이지 이동");
		return "board/writeForm";
	}
	
	@RequestMapping(value="/board/write", method = RequestMethod.POST)
	public String write(BoardVO board) {
		logger.info("등록된 글 {}", board);
		service.boardInsert(board);
		return "redirect:/board/listForm";
	}
	
	@RequestMapping(value = "/board/detail", method=RequestMethod.GET)
	public String detail(int boardnum, Model model) {
		logger.info("전달된 글 번호 : {}", boardnum);
		BoardVO board = service.boardSelectOne(boardnum);
		model.addAttribute("detail", board);
		return "board/detail";
	}
	
	@RequestMapping(value = "/board/delete", method=RequestMethod.GET)
	public String delete(BoardVO board) {
		logger.info("삭제할 글 번호 : {}", board);
		service.boardDelete(board);
		return "redirect:/board/listForm";
	}
	
	@RequestMapping(value = "/board/updateForm", method=RequestMethod.GET)
	public String updateForm(int boardnum, Model model) {
		logger.info("수정할 글 번호 : {}", boardnum);
		BoardVO board = service.boardSelectOne(boardnum);
		model.addAttribute("detail", board);
		return "board/updateForm";
	}
	
	@RequestMapping(value = "/board/update", method=RequestMethod.POST)
	public String update(BoardVO board) {
		logger.info("선택한 글 수정", board);
		service.boardUpdate(board);
		return "redirect:/board/listForm";
	}
}
