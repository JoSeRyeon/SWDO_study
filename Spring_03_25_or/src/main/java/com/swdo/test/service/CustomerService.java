package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.swdo.test.controller.CustomerViewController;
import com.swdo.test.dao.CustomerDAO;
import com.swdo.test.vo.CustomerVO;
import com.swdo.test.vo.ProfileVO;

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
		} else {
			path = "redirect:/";
		}
		
		return path;
	}

	public String login(CustomerVO customer) {
		
		CustomerVO result = dao.customerSelectOne(customer.getCustomer_id());
		String path = "";
		
		if(result != null) {
			if(result.getCustomer_pw().equals(customer.getCustomer_pw())) {
				//로그인 성공
				session.setAttribute("loginId", result.getCustomer_id());
				session.setAttribute("loginName", result.getCustomer_nm());
				logger.info("로그인 성공");
				path = "redirect:/";
				logger.info("로그인 정보 : {}", result);
			}else {
				//비밀번호 오류
				logger.info("비밀번호가 일치하지 않습니다.");
				path = "redirect:/customer/loginForm";
			}
			
		}else {
			//아이디 오류
			path = "redirect:/customer/loginForm";
		}
		
		return path;
	}
	
	public void logout() {
		session.removeAttribute("loginId");
		session.removeAttribute("loginName");
	}
	
	public ModelAndView profile() {
		// 로그인한 사용자의 아이디를 가지고 프로필 테이블에서 조회를 한다.
		String customer_id = (String)session.getAttribute("loginId");
		ProfileVO profile = dao.profileSelect(customer_id);
		
		//Model 객체처럼 데이터를 담는 기능 + 요청 경로도 지정 같이 해줌
		ModelAndView mv = new ModelAndView();

		//지금 로그인 한 사용자가 프로필을 등록하지 않은 경우 - 프로필 등록화면
		if(profile == null) {
			mv.setViewName("customer/profileInsertForm");
		}
		//지금 로그인 한 사용자가 프로피을 등록한 경우 - 프로필 확인하면
		else {
			//데이터를 넣고 -model 객체 기능
			mv.addObject("profile", profile);
			// 해당 경로로 가겠다
			mv.setViewName("customer/profileInfo");
		}
		
		return mv;
	}
	
	public void profileInsert(ProfileVO profile) {
		//로그인 아이디 셋팅
		String customer_id = (String)session.getAttribute("loginId");
		profile.setCustomer_id(customer_id);
		
		int cnt = dao.profileInsert(profile);
		
		if(cnt == 0) {
			logger.info("등록 실패");
		}else {
			logger.info("등록 성공");
		}
		
		
	}
	
	public boolean idCheck(String customer_id) {
		CustomerVO result = dao.customerSelectOne(customer_id);
		boolean flag = false;
		
		//사용 가능한 아이디 
		if(result == null) {
			flag = true;
		}
		//사용 불가능 아이디
		else {
			flag = false;
		}
		
		return flag;
	}
	
	
	
	
	
}

