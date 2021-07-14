package com.nineseven.lamp.dao;

import com.nineseven.lamp.vo.memberVO;

public interface memberMapper {
	public void memberInsert(memberVO member);
	
	public int idcheck(memberVO member);
	
	public memberVO memberLogin(memberVO member);
}
