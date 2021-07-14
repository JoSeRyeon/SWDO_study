package com.scmaster.portfolio.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scmaster.portfolio.dao.PortfolioDAO;
import com.scmaster.portfolio.vo.PortfolioVO;

@Service
public class PortfolioService {

	@Autowired
	private PortfolioDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String portfolioInsert(PortfolioVO portfolio) {
		String portfolio_id = (String)session.getAttribute("loginId");
		portfolio.setApplier_id(portfolio_id);
		return dao.portfolioInsert(portfolio) > 0 ? "redirect:/portfolio/list" : "redirect:/portfolio/writeForm";
	}
	
	public ArrayList<HashMap<String, Object>> portfolioSelectPublicList(){
		return dao.portfolioSelectPublicList();
	}
	public ArrayList<PortfolioVO> portfolioSelectAllList(){
		String applier_id = (String)session.getAttribute("loginId");
		return dao.portfolioSelectAllList(applier_id);
	}
	public PortfolioVO portfolioSelectOne(int portfolio_no) {
		return dao.portfolioSelectOne(portfolio_no);
	}
	
	public String portfolioUpdateGb(PortfolioVO portfolio) {
		String applier_id = (String)session.getAttribute("loginId");
		portfolio.setApplier_id(applier_id);
		return dao.portfolioUpdateGb(portfolio) > 0 ? "redirect:/" : "redirect:/portfolio/list";
	}
	
	public void portfolioDelete(PortfolioVO portfolio) {
		String applier_id = (String)session.getAttribute("loginId");
		portfolio.setApplier_id(applier_id);
		dao.portfolioUpdateGb(portfolio);
	}
	
}
