package com.swdo.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.vo.MemberVO;

@Controller
@RequestMapping(value = "/calendar")
public class CalendarController {
	
	@RequestMapping(value = "/naver_login", method = RequestMethod.GET)
	public String naver_login() {
		
		return "calendar/naver_login";
	}
	
	@RequestMapping(value = "/naver_login_collback", method = RequestMethod.GET)
	public String login_collback() {
		
		return "calendar/naver_login_collback";
	}

}
