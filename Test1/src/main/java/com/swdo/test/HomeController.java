package com.swdo.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.UserService;
import com.swdo.test.vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private UserService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		
		return "home";
	}
	
	@RequestMapping( value = "/joinform" , method = RequestMethod.GET)
	public String joinform() {
		
		
		return  "/joinForm" ;
	}
	

	@RequestMapping(value = "/join" , method = RequestMethod.POST)
	public String join(UserVO user) {
		
		System.out.println(user);
		service.userJoin(user);
		
		return  "home" ;
	}
}
