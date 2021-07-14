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
	
	public String customerLogin(CustomerVO customer) {
		
		CustomerVO result = dao.customerLogin(customer);
		String path = "";
		
		if(result == null) {
			logger.info("잘못된 ID 입력");
			path = "redirect:/customer/loginForm";

		} else {
			logger.info("올바른 ID 입력");
			if(customer.getCustomer_pw().equals(result.getCustomer_pw())) {
				logger.info("로그인 정보가 올바릅니다.");
				// 세션 스코프에 검증이 되었다는 data를 넣어준다.
				session.setAttribute("loginVO", result);
				path = "redirect:/";
				
			}else {
				logger.info("비밀번호가 틀렸습니다.");
				path = "redirect:/customer/loginForm";
			}
		}
		
		return path;
	}
	
	public void customerLogout() {
		
		logger.info("로그아웃 기능");
		session.removeAttribute("loginVO");
	}
}
