package com.swdo.test.dao;

import com.swdo.test.vo.CustomerVO;
import com.swdo.test.vo.ProfileVO;

public interface CustomerMapper {

	public int customerInsert(CustomerVO customer);

	//특정 회원 조회
	public CustomerVO customerSelectOne(String customer_id);

	public ProfileVO profileSelect(String customer_id);
	
	//프로필 등록
	public int profileInsert(ProfileVO profile);
}
