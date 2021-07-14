package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.swdo.test.vo.ApplierVO;
import com.swdo.test.vo.PortfolioVO;

public interface PortfolioMapper {
	
	public ArrayList<HashMap<String, Object>> portfolioSelectALL();
	
	public int portfolioInsert(PortfolioVO portfolio);

}
