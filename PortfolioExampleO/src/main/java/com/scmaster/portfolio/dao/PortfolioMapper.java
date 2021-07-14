package com.scmaster.portfolio.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.scmaster.portfolio.vo.PortfolioVO;

public interface PortfolioMapper {
	
	public int portfolioInsert(PortfolioVO portfolio);
	public ArrayList<HashMap<String, Object>> portfolioSelectPublicList();
	public ArrayList<PortfolioVO> portfolioSelectAllList(String applier_id);
	public PortfolioVO portfolioSelectOne(int portfolio_no);
	public int portfolioUpdateGb(PortfolioVO portfolio);
	public void portfolioDelete(PortfolioVO portfolio);
}
