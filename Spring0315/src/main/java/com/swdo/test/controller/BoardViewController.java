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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.swdo.test.service.BoardService;
import com.swdo.test.util.PageNavigator;
import com.swdo.test.vo.BoardVO;

@Controller
public class BoardViewController {

	private static final Logger logger = LoggerFactory.getLogger(BoardViewController.class);
	
	private static final int COUNT_PER_PAGE = 2;
	private static final int PAGE_PER_GROUP = 3;
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/board/listForm" , method=RequestMethod.GET)
	public String listForm(Model model
			,@RequestParam(name="searchText", defaultValue = "") String searchText
			,@RequestParam(name="page",defaultValue = "1") int page) {
		logger.info("글 목록 페이지 이동 : {}" , searchText);
		//전체 글의 개수
		int totalRecord = service.boardTotalRecord(searchText);
		//PageNavigator 객체를 생성한다.
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, PAGE_PER_GROUP, page, totalRecord);
		
		//DB에 가서 글 전체 목록을 조회한 후에 그 데이터를 가지고 이동한다.
		ArrayList<HashMap<String, Object>> list = service.boardSelectAll(searchText,navi.getStartRecord(),navi.getCountPerPage());
		model.addAttribute("boardList", list);
		model.addAttribute("boardNavi", navi);
		model.addAttribute("searchText", searchText);
		return "board/listForm";
	}
	
	@RequestMapping(value="/board/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		logger.info("글 등록 페이지 이동");
		return "board/writeForm";
	}
	
	@RequestMapping(value="/board/write" , method = RequestMethod.POST)
	public String write(BoardVO board, MultipartFile upload) {
		logger.info("전달된 글 등록 데이터 {}",board);
		//글 등록 기능
		service.boardInsert(board,upload);
		return "redirect:/board/listForm";
	}
	
	
	@RequestMapping(value="/board/detail" , method = RequestMethod.GET)
	public String detail(int board_no, Model model) {
		logger.info("전달받은 글번호 : {}" ,board_no);
		//
		
		// 해당 글번호의 상세 내용을 조회 한 후에 jsp로 전달한다.
		HashMap<String, Object> board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		
		return "board/detail";
	}
	
	@RequestMapping(value="/board/delete", method = RequestMethod.GET)
	public String delete(BoardVO board) {
		logger.info("특정 글 삭제 기능 : {}" , board);
		service.boardDelete(board);
		return "redirect:/board/listForm";
	}
	
	@RequestMapping(value="/board/updateForm", method = RequestMethod.GET)
	public String updateForm(int board_no, Model model) {
		logger.info("특정 글 수정 폼 이동 : {}",board_no);
		HashMap<String, Object> board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		return "board/updateForm";
	}
	
	@RequestMapping(value="/board/update", method = RequestMethod.POST)
	public String update(BoardVO board, MultipartFile upload) {
		logger.info("특정 글 수정 기능 : {}",board);
		service.boardUpdate(board,upload);
		return "redirect:/board/listForm";
	}
	
	@RequestMapping(value="/board/download", method = RequestMethod.GET)
	public void download(int board_no) {
		service.download(board_no);
	}
	
	
	
	
	
	
	
	
	
}
