package com.swdo.test.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.swdo.test.service.BoardService;
import com.swdo.test.vo.ReplyVO;

@RestController
public class BoardRestController {
	
	@Autowired
	private BoardService service;

	@RequestMapping(value = "/board/replyInsert", method = RequestMethod.POST)
	public HashMap<String, Object> replyInsert(ReplyVO reply) {
		System.out.println("전달받은 데이터 : " + reply);
		service.replyInsert(reply);
		
		HashMap<String, Object> map = service.replySelectList(reply.getBoard_no());
		
		//ArrayList<ReplyVO> replyList = (ArrayList<ReplyVO>) list.get("replyList");
		
		return map;
	}
	
	@RequestMapping(value = "/board/replyDelete", method = RequestMethod.POST)
	public HashMap<String, Object> replyDelete(ReplyVO reply) {
		System.out.println("전달받은 데이터 : " + reply);
		//service.replyDelete(reply.getReply_no());
		
		HashMap<String, Object> map = service.replySelectList(reply.getBoard_no());
		
		return map;
	}
	
	
	
	
	
	
	
	
}
