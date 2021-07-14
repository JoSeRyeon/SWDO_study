package com.swdo.test.dao;

import java.util.ArrayList;

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
		try{
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			cnt = mapper.memberInsert(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public MemberVO memberLogin(MemberVO member) {
		MemberVO result = null;
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			result = mapper.memberLogin(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<MemberVO> memberSelectAll(){
		ArrayList<MemberVO> memberlist = new ArrayList<MemberVO>();
		try {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			memberlist = mapper.memberSelectAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberlist;
	}
}
