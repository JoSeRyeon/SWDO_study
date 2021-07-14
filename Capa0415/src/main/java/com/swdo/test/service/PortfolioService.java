package com.swdo.test.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.PortfolioDAO;
import com.swdo.test.dao.PortfolioMapper;
import com.swdo.test.vo.ApplierVO;
import com.swdo.test.vo.PortfolioVO;

@Service
public class PortfolioService {
	
	private static final Logger logger = LoggerFactory.getLogger(PortfolioService.class);
	
	@Autowired
	private PortfolioDAO dao;
	
	@Autowired
	private HttpSession session;

	public ArrayList<HashMap<String, Object>> portfolioSelectALL(){
		
		
		
		ArrayList<HashMap<String, Object>> list = dao.portfolioSelectALL();
		logger.info("hashMap 알아보기 : {}", list.get(0));
		logger.info("hashMap 세부 알아보기 : {}" , list.get(0).get("PORTFOLIO_NO"));
		logger.info("글 전체 목록 조회 : {}", list);
		
		
		return list;
	}
	
	public String portfolioInsert(PortfolioVO portfolio) {
		
		String path = "";
		
		int cnt = 0;
		
		ApplierVO applier = (ApplierVO)session.getAttribute("loginVO");
		portfolio.setApplier_id(applier.getApplier_id());
		
		
		cnt = dao.portfolioInsert(portfolio);
		
		if(cnt == 0) {
			logger.info("게시물 등록 실패 : {}",portfolio);
			path = "redirect:/portfolio/writeForm";
		}else {
			logger.info("게시물 등록 성공 : {}", portfolio);
			path = "redirect:/portfolio/listForm";
			
		}
		
		return path;
		
	}
}
