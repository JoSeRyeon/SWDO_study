package com.swdo.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.CustomerVO;

@Repository
public class CustomerDAO {
	
	@Autowired
	private SqlSession session;
	
	public int customerInsert(CustomerVO customer) {
		
		int cnt = 0;
		
		try {
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			cnt = mapper.customerInsert(customer);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public CustomerVO customerSelectOne(CustomerVO customer) {
		
		CustomerVO result = null;
		
		try {
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			result = mapper.customerSelectOne(customer);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	
}
