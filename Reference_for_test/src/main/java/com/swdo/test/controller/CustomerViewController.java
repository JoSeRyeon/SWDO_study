package com.swdo.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.CustomerService;
import com.swdo.test.vo.CustomerVO;

@Controller
@RequestMapping(value = "/customer")
public class CustomerViewController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerViewController.class);
	
	@Autowired
	private CustomerService service;
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		
		logger.info("로그인 폼 jsp 파일로 이동");
		
		return "customer/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(CustomerVO customer) {
		
		logger.info("로그인 정보 서버에 전달");
		logger.info("전달 받은 사용자 로그인 데이터 : {}", customer);
		String path = service.login(customer);
		
		return path;
	}
	
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		
		logger.info("회원 가입 폼으로 이동");
		
		return "customer/joinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(CustomerVO customer) {
		
		String path = "";
		
		logger.info("사용자 정보 데이터베이스에 저장");
		logger.info("회원가입 폼에서 받은 데이터 : {}", customer);
		path = service.customerInsert(customer);
		
		return path;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		
		service.logout();
		
		return "redirect:/";
	}
}
