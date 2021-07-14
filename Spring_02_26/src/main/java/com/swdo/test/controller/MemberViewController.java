package com.swdo.test.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.MemberService;
import com.swdo.test.vo.MemberVO;

@Controller
public class MemberViewController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/member/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		
		return "member/joinForm";
	}
	
	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	public String join(MemberVO member) {
		System.out.println("화면으로부터 전달받은 회원가입 정보");
		System.out.println(member);
		service.memberInsert(member);
		return "home";
	}
	
	@RequestMapping(value = "/member/info", method=RequestMethod.GET)
	public String info(Model model) {
		
		String name = "관리자";
		int age = 30;
		boolean flag = false;
		ArrayList<String> strList = new ArrayList<String>();
		strList.add("aaa");
		strList.add("bbb");
		strList.add("ccc");
		
		//map 구조와 비슷 model 객체에 저장하기 
		model.addAttribute("memberName", name);
		model.addAttribute("memberAge", age);
		model.addAttribute("memberFlag", flag);
		model.addAttribute("strList", strList);
		
		
		return "member/info";
	}
}
