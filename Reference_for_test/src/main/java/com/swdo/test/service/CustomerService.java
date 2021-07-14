package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.CustomerDAO;
import com.swdo.test.vo.CustomerVO;

@Service
public class CustomerService {

	private static final Logger logger = LoggerFactory.getLogger(CustomerService.class);
	
	@Autowired
	private CustomerDAO dao;
	
	@Autowired
	private HttpSession session;
	
	
	public String customerInsert(CustomerVO customer) {
		
		int cnt = dao.customerInsert(customer);
		String path = "";
		
		if(cnt == 0) {
			
			logger.info("회원가입 실패");
			path = "redirect:/customer/joinForm";
			
		}else {
			logger.info("회원 가입 성공");
			path = "redirect:/";
		}
		
		return path;
	}
	
	public String login(CustomerVO customer) {
		
		CustomerVO result = dao.customerSelectOne(customer);
		String path = "";
		
		if(result != null) {
			
			if(result.getCustomer_pw().equals(customer.getCustomer_pw())) {
				logger.info("로그인 성공");
				logger.info("로그인 한 사용자 정보 : {}",result);
				
				session.setAttribute("loginVO", result);
				path = "redirect:/";
			}else {
				logger.info("비밀번호를 다시 입력해주세요");
				path = "redirect:/customer/loginForm";
			}
		}else {
			path = "redirect:/customer/loginForm";
		}
		
		return path;
		
	}
	
	public void logout() {
		session.removeAttribute("loginVO");
		logger.info("로그아웃 성공");
	}
	
}
