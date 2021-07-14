package com.swdo.test.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.MemberService;
import com.swdo.test.vo.MemberVO;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/member/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping(value="/member/join", method = RequestMethod.POST)
	public String join(MemberVO member) {
		logger.info("회원가입 정보 : {}", member);
		String path = service.memberInsert(member);
		service.memberInsert(member);
		return path;
	}
	
	@RequestMapping(value="/member/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	public String login(MemberVO member) {
		String path = service.memberLogin(member);
		return path;
	}
	
	@RequestMapping(value="/member/logout", method = RequestMethod.GET)
	public String logout() {
		service.logout();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/memberlist", method = RequestMethod.GET)
	public String memberlist(Model model) {
		
		ArrayList<MemberVO> memberlist = service.memberSelectAll();
		model.addAttribute("memberlist", memberlist);
		
		return "member/memberlist";
	}
	
}
