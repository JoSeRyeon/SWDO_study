package com.scmaster.portfolio.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.portfolio.service.PortfolioService;
import com.scmaster.portfolio.vo.PortfolioVO;

@Controller
@RequestMapping(value="/portfolio")
public class PortfolioViewController {
	
	@Autowired
	private PortfolioService service;
	
	@RequestMapping(value="/list" , method = RequestMethod.GET)
	public String list(Model model) {
		ArrayList<PortfolioVO> list = service.portfolioSelectAllList();
		model.addAttribute("list", list);
		return "portfolio/list";
	}
	
	@RequestMapping(value="/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "portfolio/writeForm";
	}
	
	@RequestMapping(value="/write" , method = RequestMethod.POST)
	public String write(PortfolioVO portfolio) {
		return service.portfolioInsert(portfolio);
	}
	
	@RequestMapping(value="/readForm", method = RequestMethod.GET)
	public String readForm(int portfolio_no , Model model) {
		PortfolioVO vo = service.portfolioSelectOne(portfolio_no);
		model.addAttribute("vo", vo);
		return "portfolio/readForm";
	}
	
	@RequestMapping(value="/updateGb", method = RequestMethod.GET)
	public String updateGb(PortfolioVO portfolio) {
		return service.portfolioUpdateGb(portfolio);
	}
	
}
