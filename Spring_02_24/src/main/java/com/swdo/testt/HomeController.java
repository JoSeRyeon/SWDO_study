package com.swdo.testt;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		
		return "join";
	}
	
	@RequestMapping(value = "/sendNumber" , method = RequestMethod.GET)
	public String sendNumber(int num) {
		
		System.out.println("전달 받은 숫자 : " + num);
		return "main";
	}
	
	@RequestMapping(value = "/sendString" , method = RequestMethod.GET)
	public String sendString(String str) {
		
		System.out.println("전달 받은 문자 : " + str);
		return "main";
	}
	
	@RequestMapping(value = "/sendData", method = RequestMethod.GET)
	public String sendData(int num, String str, boolean flag) {
		
		System.out.println("전달받은 데이터 : " + num + str + flag);
		return "main";
		
	}
	
	@RequestMapping(value = "/sendFormData", method = RequestMethod.POST)
	public String sendFormData(String sendId, String sendPw) {
		System.out.println("폼 태그를 사용해서 전달받은 데이터 " + sendId + ", " + sendPw);
		return "main";
	}
	
	@RequestMapping(value = "/sendFormData2", method = RequestMethod.POST)
	public String sendFormDate2(MemberVO vo) {
		System.out.println("폼태그를 사용해서 객체로 전달받은 데이터 : " + vo);
		
		return "main";
	}
}
