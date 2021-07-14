package com.swdo.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.MemberVO;

/**
 * 
 * DAO의 역할
 * 1. 서비스로부터 요청 받은 기능을 수행한다.
 * 2. DB연결을 위해서 SqlSession 객체를 활용한다.
 * 3. Mapper Interface의 메소드를 호출한다.
 *
 */


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	public void memberInsert(MemberVO member) {
		
		// 인터페이스의 구현체의 클래스를 갖는다. (mybatis 이용)
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			mapper.memberInsert(member);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
