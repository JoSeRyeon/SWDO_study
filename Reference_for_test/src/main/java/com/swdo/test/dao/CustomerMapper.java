package com.swdo.test.dao;

import com.swdo.test.vo.CustomerVO;

public interface CustomerMapper {

	public int customerInsert(CustomerVO customer);
	
	public CustomerVO customerSelectOne(CustomerVO customer);
}
