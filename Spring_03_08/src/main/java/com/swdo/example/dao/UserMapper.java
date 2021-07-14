package com.swdo.example.dao;

import java.util.ArrayList;

import com.swdo.example.vo.UserVO;

public interface UserMapper {

	public int userInsert(UserVO user);
	
	public ArrayList<UserVO> userSelectAll();
	
	public int userDelete(int user_no);

	public UserVO userSelectOne(int user_no);
	
	public int userUpdate(UserVO user);
	
	public UserVO userLogin(UserVO user);
}
