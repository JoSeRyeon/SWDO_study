package com.swdo.example.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.example.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession session;
	

	public int userInsert(UserVO user) {
		int cnt = 0;
		try {
			// Mapper Interface의 객체를 생성하여 메소드를 호출한다.
			// 원래는 interface는 객체를 생성할 수 없으나, mybatis의 session 객체를 통해 이 기능 실현 가능
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.userInsert(user);

		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
		}
		return cnt;
	}

	public ArrayList<UserVO> userSelectAll() {

		ArrayList<UserVO> list = new ArrayList<>();

		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.userSelectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public int userDelete(int user_no) {
		
		int cnt = 0;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.userDelete(user_no);
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		}
		return cnt;
	}
	
	public UserVO userDetail(int user_no) {
		UserVO vo = null;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			vo = mapper.userSelectOne(user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	public int userUpdate(UserVO user) {
		int cnt = 0;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.userUpdate(user);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	
	public UserVO userLogin(UserVO user) {
		
		UserVO result = null;
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.userLogin(user);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
}
