package com.swdo.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.swdo.example.service.UserService;
import com.swdo.example.vo.UserVO;

@RestController
@RequestMapping(value = "/user")
public class UserRestController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ArrayList<UserVO> delete(int user_no) {
		
		service.userDelete(user_no);
		ArrayList<UserVO> list = service.userSelectAll();
		return list;
	}
}
