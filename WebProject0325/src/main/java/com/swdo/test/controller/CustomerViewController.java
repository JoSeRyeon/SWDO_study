package com.swdo.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerViewController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerViewController.class);

	@RequestMapping(value = "/customer/joinForm" , method = RequestMethod.GET)
	public String joinForm() {
	
		return "/customer/joinForm";
	}
	
}
