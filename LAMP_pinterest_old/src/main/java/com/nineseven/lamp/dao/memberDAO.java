package com.nineseven.lamp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nineseven.lamp.vo.memberVO;

@Repository
public class memberDAO {
	
	@Autowired
	private SqlSession session;

	public void memberInsert(memberVO member) {
		try {
			memberMapper mapper = session.getMapper(memberMapper.class);
			mapper.memberInsert(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int idcheck(memberVO member) {
		int result = 0;
		try{
			memberMapper mapper = session.getMapper(memberMapper.class);
			result = mapper.idcheck(member);	
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return result;
	}
	
	public memberVO memberLogin(memberVO member) {
		memberVO result = null;
		try{
			memberMapper mapper = session.getMapper(memberMapper.class);
			result = mapper.memberLogin(member);
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return result;
	}
}
