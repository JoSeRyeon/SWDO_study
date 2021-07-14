package com.scmaster.portfolio.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.portfolio.vo.PortfolioVO;

@Repository
public class PortfolioDAO {
	
	@Autowired
	private SqlSession session;
	
	public int portfolioInsert(PortfolioVO portfolio) {
		int cnt = 0;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			cnt =mapper.portfolioInsert(portfolio);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ArrayList<HashMap<String, Object>> portfolioSelectPublicList(){
		ArrayList<HashMap<String, Object>> list = null;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			list = mapper.portfolioSelectPublicList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<PortfolioVO> portfolioSelectAllList(String applier_id){
		ArrayList<PortfolioVO> list = null;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			list = mapper.portfolioSelectAllList(applier_id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public PortfolioVO portfolioSelectOne(int portfolio_no) {
		PortfolioVO vo = null;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			vo = mapper.portfolioSelectOne(portfolio_no);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public int portfolioUpdateGb(PortfolioVO portfolio) {
		int cnt = 0;
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			cnt = mapper.portfolioUpdateGb(portfolio);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public void portfolioDelete(PortfolioVO portfolio) {
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			mapper.portfolioDelete(portfolio);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
