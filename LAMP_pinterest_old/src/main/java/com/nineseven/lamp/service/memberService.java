package com.nineseven.lamp.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nineseven.lamp.controller.memberViewController;
import com.nineseven.lamp.dao.memberDAO;
import com.nineseven.lamp.vo.memberVO;

@Service
public class memberService {
	
	private static final Logger logger = LoggerFactory.getLogger(memberService.class);
	
	@Autowired
	private memberDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public void memberInsert(memberVO member) {
		dao.memberInsert(member);
	}
	
	public int idcheck(memberVO member) {
		int result = dao.idcheck(member);
		return result;
	}
	
	public String memberLogin(memberVO member) {
		memberVO result = dao.memberLogin(member);
		String path = null;
		
		if(result == null) {
			logger.info("ID가 존재하지 않습니다.");
			path = "redirect:/";
		}else {
			logger.info("ID가 존재합니다.");
			
			if(result.getPw().equals(member.getPw())) {
				logger.info("로그인 성공");
				session.setAttribute("loginVO", result);
				path = "redirect:/home";
			}else {
				logger.info("로그인 실패");
				path = "redirect:/";
			}
		}
		return path;
	}
	
	public void logout() {
		session.removeAttribute("loginVO");
	}
}


















