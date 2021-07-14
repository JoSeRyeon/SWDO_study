package com.swdo.test.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.vo.MemberVO;

@Controller
public class MemberViewController {

	@RequestMapping(value = "/member/joinForm", method = RequestMethod.GET)  // a 태그 사용했으므로 GET 방식
	public String joinForm() {
		return "member/joinForm";
		
	}
	
	@RequestMapping(value = "/member/join", method = RequestMethod.POST)
	   public String join(MemberVO member) {
	      System.out.println("화면으로부터 전달받은 회원가입 정보");
	      System.out.println(member);
	      return "home";
	   }
	
	@RequestMapping(value="/member/info", method = RequestMethod.GET)
	public String info(Model model) {
		String name = "관리자";
		int age = 30;
		boolean flag = false;
		ArrayList<String> strList = new ArrayList<String>();
		strList.add("aaa");
		strList.add("bbb");
		strList.add("ccc");
		
		model.addAttribute("memberName", name);
		model.addAttribute("memberAge", age);
		model.addAttribute("memberFlag", flag);
		model.addAttribute("strList", strList);
		
		return "member/info";
	}
	}

