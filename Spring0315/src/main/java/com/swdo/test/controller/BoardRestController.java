package com.swdo.test.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swdo.test.service.BoardService;
import com.swdo.test.vo.ReplyVO;

@Controller
public class BoardRestController {
	
	@Autowired
	private BoardService service;

	@ResponseBody
	@RequestMapping(value="/board/replyInsert", method = RequestMethod.POST)
	public ArrayList<ReplyVO> replyInsert(ReplyVO reply) {
		service.replyInsert(reply);
		
		//해당 글에 작성된 전체 리플정보가 필요하다.
		ArrayList<ReplyVO> list = service.replySelectList(reply.getBoard_no());
		return list;
	}
	
	
	
	
	
	
	
	
	
}
