package com.scmaster.portfolio.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.portfolio.service.PortfolioService;

@Controller
public class HomeController {
	
	@Autowired
	private PortfolioService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("프로그램 시작");
		ArrayList<HashMap<String, Object>> list = service.portfolioSelectPublicList();
		model.addAttribute("list", list);
		
		return "home";
	}
	
}
