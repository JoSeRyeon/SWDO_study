package com.scmaster.portfolio.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scmaster.portfolio.dao.ApplierDAO;
import com.scmaster.portfolio.vo.ApplierVO;

@Service
public class ApplierService {

	@Autowired
	private ApplierDAO dao;
	@Autowired
	private HttpSession session;
	
	public String applierInsert(ApplierVO applier) {
		return dao.applierInsert(applier) > 0 ? "redirect:/" : "redirect:/applier/joinForm" ; 
	}
	
	public String applierLogin(ApplierVO applier) {
		ApplierVO vo = dao.applierSelectOne(applier.getApplier_id());
		String path = "";
		if(vo != null && applier.getApplier_pw().equals(vo.getApplier_pw())) {
			session.setAttribute("loginId", vo.getApplier_id());
			path = "redirect:/";
		} else {
			path = "redirect:/applier/loginForm";
		}
		return path;
	}
	
	public void applierLogout() {
		session.removeAttribute("loginId");
	}
}
