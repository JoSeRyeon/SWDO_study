package com.swdo.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		// logger(log)는 상용화가 되어도 출력이 된다. 또한 log를 출력하면 log파일도 만들어준다.
		// log 에는 레벨도 여러 개 존재한다.
		// 현재 프로젝트의 log 레벨에 따라 출력되는 형태가 결정이 된다. 
		// error , warn, info, debug.... 등의 레벨이 있다. (info 아래 레벨은 안보임)
		// 이제부터는 sysout- 대신에 logger.level()로 출력할 것이다! 
		//		logger.info("Welcome home! The client locale is {}.", locale);
		
		logger.info("메인 화면 이동");
		
		
		
		return "home";
	}
	
}
