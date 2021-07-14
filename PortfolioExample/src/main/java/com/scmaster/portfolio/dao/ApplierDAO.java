package com.scmaster.portfolio.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.portfolio.vo.ApplierVO;

@Repository
public class ApplierDAO {
	
	@Autowired
	private SqlSession session;
	
	public int applierInsert(ApplierVO applier) {
		int cnt = 0;
		try {
			ApplierMapper mapper = session.getMapper(ApplierMapper.class);
			cnt = mapper.applierInsert(applier);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ApplierVO applierSelectOne(String applier_id) {
		ApplierVO vo = null;
		try {
			ApplierMapper mapper = session.getMapper(ApplierMapper.class);
			vo = mapper.applierSelectOne(applier_id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
}
