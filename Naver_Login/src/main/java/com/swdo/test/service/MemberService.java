package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.MemberDAO;
import com.swdo.test.vo.MemberVO;

@Service
public class MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	private MemberDAO dao;
	
	
	@Autowired
	private HttpSession session;
	
	public String memberInsert(MemberVO member) {
		
		int cnt = dao.memberInsert(member);
		String path = "";
		
		if(cnt==0) {
			logger.info("회원가입 실패");
			path = "redirect:/customer/joinForm";
		}else {
			logger.info("회원 가입 성공");
			path = "redirect:/";
		}
		
		return path;
	}
	
	public String login(MemberVO member) {
		
		MemberVO result = dao.customerSelectOne(member);
		String path = "";
		
		
		 if(result != null && result.getPassword().equals(member.getPassword())) {
		 logger.info("로그인 성공");
		 
		 session.setAttribute("loginVO", result);
		 
		 path = "redirect:/";
		  
		 }else { 
			 logger.info("로그인 실패"); 
			 path = "redirect:/member/loginForm"; 
		 }
		 
		
		return path;
		
	}
	
	public String naver_login(MemberVO member) {
		
		
		
		 session.setAttribute("loginVO", member);
		 
		 
		
		return "redirect:/";
		
	}
	
	public void logout() {
		
		session.removeAttribute("loginVO");
		
		logger.info("로그아웃 성공");
		
	}
	
}
