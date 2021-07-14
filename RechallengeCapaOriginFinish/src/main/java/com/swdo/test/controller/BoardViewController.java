package com.swdo.test.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
@RequestMapping(value = "/board")
public class BoardViewController {

	private static final Logger logger = LoggerFactory.getLogger(BoardViewController.class);
	
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		ArrayList<HashMap<String, Object>> list = service.boardSelectALL();
		model.addAttribute("list", list);
		logger.info("회원 정보 받아오기 성공");
		
		return "board/list";
		
	}
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList(BoardVO board, Model model) {
		
		logger.info("받아온 사용자 정보 : {} ", board);
		
		ArrayList<HashMap<String, Object>> result = service.boardList(board);
		
		model.addAttribute("list", result);
		model.addAttribute("id", board);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm(BoardVO board, Model model) {
		
		
		return "board/boardWriteForm";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO board) {
		
		String path = service.boardInsert(board);
		
		return path;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(BoardVO board, Model model) {
		
		logger.info("보여줘야 할 게시물 정보 : {}", board);
		
		BoardVO result = service.boardSelectOne(board);
		
		model.addAttribute("list", result);
		
		return "board/detail";
	}
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(BoardVO board, Model model) {
		
		BoardVO result = service.boardSelectOne(board);
		model.addAttribute("list", result);
		
		return "board/updateForm";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO board) {
		
		String path = service.boardUpdate(board);
		return path;
	}
	
	@RequestMapping(value = "/updateCnt", method = RequestMethod.GET)
	public String updateCnt(BoardVO board) {
		
		board.setLikecnt(board.getLikecnt() + 1);
		
		service.boardUpdateCnt(board);
		
		String board_id = board.getId();
		int board_no = board.getBoardnum();
		
		
		return "redirect:/board/detail?id=" + board_id + "&boardnum="+board_no;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(BoardVO board) {
		
		service.boardDelete(board);
		
		String member_id = board.getId();
		
		return "redirect:/board/boardList?id=" + member_id;
	}
}
