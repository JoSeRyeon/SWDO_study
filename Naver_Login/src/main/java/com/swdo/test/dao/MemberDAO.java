package com.swdo.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	public int memberInsert(MemberVO member) {
		
		int cnt = 0;
		
		try {
			cnt = session.getMapper(MemberMapper.class).memberInsert(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public MemberVO customerSelectOne(MemberVO member) {
		
		MemberVO result = null;
		try {
			result = session.getMapper(MemberMapper.class).customerSelectOne(member);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
}
