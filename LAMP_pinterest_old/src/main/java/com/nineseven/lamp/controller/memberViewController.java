package com.nineseven.lamp.controller;

import java.io.Console;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nineseven.lamp.service.galleryService;
import com.nineseven.lamp.service.memberService;
import com.nineseven.lamp.vo.galleryVO;
import com.nineseven.lamp.vo.memberVO;
import com.nineseven.lamp.vo.petVO;

@Controller
public class memberViewController {

	private static final Logger logger = LoggerFactory.getLogger(memberViewController.class);

	@Autowired
	private memberService service;
	private galleryService service1;
	
	

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(memberVO member) {
		String path = service.memberLogin(member);
		logger.info("{}", member);
		
		return path;
	}

	@RequestMapping(value = "/member/naver_login", method = RequestMethod.GET)
	public String naver_login(memberVO member) {
		
		member.setPw(member.getId().substring(member.getId().length() / 2));
		member.setId(member.getId().substring(0, member.getId().length() / 2));
		
		String path = service.memberLogin(member);
		logger.info("{}", member);
		
		return path;
	}

	@RequestMapping(value = "/member/callback", method = RequestMethod.GET)
	public String callback(memberVO member) {

		return "member/callback";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String gallery(Model model) {

		return "home";
	}
	
	@RequestMapping(value = "/member/login_callback", method = RequestMethod.GET)
	public String login_callback(memberVO member) {
		
		return "/member/login_callback";
	}


	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout() {
		
		service.logout();
		return "redirect:/";
	}

	@RequestMapping(value = "/member/joinForm", method = RequestMethod.GET)
	public String joinForm() {

		return "member/joinFormPerson";
	}

	@ResponseBody
	@RequestMapping(value = "/member/idcheck", method = RequestMethod.POST)
	public int idcheck(memberVO member) {
		int result = service.idcheck(member);
		return result;
	}

	@RequestMapping(value = "/member/joinPerson", method = RequestMethod.POST)
	public String joinPerson(memberVO member, Model model) {

		logger.info("{}", member);

//		int result = service.idcheck(member);
//
//		try {
//			if (result == 1) {
//				return "/member/joinFormPerson";
//			} else if (result == 0) {
//				service.memberInsert(member);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		service.memberInsert(member);
		model.addAttribute("member", member);
		
		return "member/joinFormPet";
	}

	@RequestMapping(value = "/member/naver_joinPerson", method = RequestMethod.GET)
	public String naver_joinPerson(memberVO member, Model model) {

		member.setPw(member.getId().substring(member.getId().length() / 2));
		member.setId(member.getId().substring(0, member.getId().length() / 2));

		int result = service.idcheck(member);
		logger.info("{}", member);
		try {
			if (result == 1) {
				logger.info("이미 가입된 아이디입니다.");
				return "redirect:/";
			} else if (result == 0) {
				service.memberInsert(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("member", member);
		return "member/joinFormPet";
	}
		


}
