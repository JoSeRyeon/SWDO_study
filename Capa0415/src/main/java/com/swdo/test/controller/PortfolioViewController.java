package com.swdo.test.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swdo.test.dao.PortfolioDAO;
import com.swdo.test.service.ApplierService;
import com.swdo.test.service.PortfolioService;
import com.swdo.test.vo.PortfolioVO;

@Controller
@RequestMapping(value = "/portfolio")
public class PortfolioViewController {
	
private static final Logger logger = LoggerFactory.getLogger(PortfolioViewController.class);
	
	@Autowired
	private PortfolioService service;
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(Model model) {
		
		
		ArrayList<HashMap<String, Object>> list = service.portfolioSelectALL(); 
		
		model.addAttribute("prPortfolioList", list);
		
		logger.info("개인 포토폴리오 페이지로 이동");
		
		
		return "portfolio/listForm";
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		
		logger.info("포토폴리오 작성 페이지로 이동");
		
		
		return "portfolio/writeForm";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(PortfolioVO portfolio) {
		
		logger.info("포토폴리오 작성 값을 db에 전달");
		
		String path = "";
		
		path = service.portfolioInsert(portfolio);
		
		return path;
	}

}
