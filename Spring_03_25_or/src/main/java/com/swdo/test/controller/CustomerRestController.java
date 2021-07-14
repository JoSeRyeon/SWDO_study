package com.swdo.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.swdo.test.service.CustomerService;


//비동기 처리만 담당하는 컨트롤러의 경우
//RestController 어노테이션처리를 클래스에 하면
//하나하나 메소드에 @responseBody 처리 할 필요가 없어짐

@RestController
@RequestMapping(value = "/customer")
public class CustomerRestController {
	
	@Autowired
	private CustomerService service;
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public boolean idCheck(String customer_id) {
		boolean flag = false;
		
		System.out.println("아이디 중복 검사 : " + customer_id);
		flag = service.idCheck(customer_id);
		
		return flag;
	}
}
