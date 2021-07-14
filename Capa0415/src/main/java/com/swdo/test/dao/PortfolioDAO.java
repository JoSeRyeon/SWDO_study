package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.ApplierVO;
import com.swdo.test.vo.PortfolioVO;

@Repository
public class PortfolioDAO {

	@Autowired
	private SqlSession session;
	
	
	public ArrayList<HashMap<String, Object>> portfolioSelectALL(){
		
		ArrayList<HashMap<String, Object>> list = null;
		
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			
			list = mapper.portfolioSelectALL();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int portfolioInsert(PortfolioVO portfolio) {
		
		int cnt = 0;
		
		try {
			PortfolioMapper mapper = session.getMapper(PortfolioMapper.class);
			
			cnt = mapper.portfolioInsert(portfolio);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
