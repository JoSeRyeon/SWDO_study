package com.swdo.test.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swdo.test.service.MemberService;
import com.swdo.test.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberViewController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberViewController.class);
	
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		
		return "member/joinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberVO member) {
		
		logger.info("회원 가입 시 고객 정보 : {}", member);
		String path = service.memberInsert(member);
		
		
		return path;
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO member) {
		
		String path = service.login(member);
		
		logger.info("로그인 성공 - 컨트롤러");
		
		return path;
	}
	
	@RequestMapping(value = "/collback", method = RequestMethod.GET)
	public String collback(String request) throws IOException, ParseException {
	
		logger.info("ddd");
		
		return "home";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		
		service.logout();
		
		return "home";
	}
	
}
