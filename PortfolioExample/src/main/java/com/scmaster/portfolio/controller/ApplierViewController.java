package com.scmaster.portfolio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.portfolio.service.ApplierService;
import com.scmaster.portfolio.vo.ApplierVO;

@Controller
@RequestMapping(value="/applier")
public class ApplierViewController {

	@Autowired
	private ApplierService service;
	
	@RequestMapping(value="/joinForm" , method = RequestMethod.GET)
	public String joinForm() {
		return "applier/joinForm";
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(ApplierVO applier) {
		return service.applierInsert(applier);
	}
	
	@RequestMapping(value="/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "applier/loginForm";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(ApplierVO applier) {
		return service.applierLogin(applier);
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout() {
		service.applierLogout();
		return "redirect:/";
	}
}
