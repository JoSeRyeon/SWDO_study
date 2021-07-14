package com.swdo.test.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.ApplierDAO;
import com.swdo.test.vo.ApplierVO;



@Service
public class ApplierService {

private static final Logger logger = LoggerFactory.getLogger(ApplierService.class);
	
	@Autowired
	private ApplierDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String applierInsert(ApplierVO applier) {
		int cnt = dao.applierInsert(applier);
		String path = "";
		
		if(cnt == 0) {
			
			logger.info("회원가입 실패");
			path = "redirect:/applier/joinForm";
			
		}else {
			logger.info("회원 가입 성공");
			path = "redirect:/";
		}
		
		return path;
	}
	
	public String login(ApplierVO applier) {
		
		ApplierVO result = dao.applierSelectOne(applier);
		String path = "";
		
		if(result != null) {
			
			if(result.getApplier_pw().equals(applier.getApplier_pw())) {
				logger.info("로그인 성공");
				logger.info("로그인 한 사용자 정보 : {}",result);
				
				session.setAttribute("loginVO", result);
				path = "redirect:/";
			}else {
				logger.info("비밀번호를 다시 입력해주세요");
				path = "redirect:/applier/loginForm";
			}
		}else {
			path = "redirect:/applier/loginForm";
		}
		
		return path;
		
	}
	
	public void logout() {
		session.removeAttribute("loginVO");
		logger.info("로그아웃 성공");
	}
}
