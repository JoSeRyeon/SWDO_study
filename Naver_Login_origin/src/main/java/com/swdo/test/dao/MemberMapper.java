package com.swdo.test.dao;

import com.swdo.test.vo.MemberVO;

public interface MemberMapper {

	public int memberInsert(MemberVO member);
	
	public MemberVO customerSelectOne(MemberVO member);
}
