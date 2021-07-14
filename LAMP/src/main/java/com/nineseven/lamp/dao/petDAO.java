package com.nineseven.lamp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nineseven.lamp.vo.memberVO;
import com.nineseven.lamp.vo.petVO;

@Repository
public class petDAO {
	
	@Autowired
	private SqlSession session;

	public void petInsert(petVO pet) {
		try {
			petMapper mapper = session.getMapper(petMapper.class);
			mapper.petInsert(pet);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
