package com.swdo.test.dao;

import java.util.ArrayList;

import com.swdo.test.vo.MemberVO;

public interface MemberMapper {
	
	public int memberInsert(MemberVO member);
	
	public MemberVO memberLogin(MemberVO member);
	
	public ArrayList<MemberVO> memberSelectAll();
}
