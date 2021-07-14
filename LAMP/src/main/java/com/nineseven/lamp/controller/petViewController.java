package com.nineseven.lamp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nineseven.lamp.service.petService;
import com.nineseven.lamp.vo.memberVO;
import com.nineseven.lamp.vo.petVO;

@Controller
public class petViewController {
	
	private static final Logger logger = LoggerFactory.getLogger(memberViewController.class);

		
	@Autowired
	private petService service;
	
	@RequestMapping(value="/pet/join", method = RequestMethod.GET)
	public String join(petVO pet) {
		
		logger.info("{}", pet);
		service.petInsert(pet);
		logger.info("{}", pet);
		return "member/joinSuccess";
	}

}
