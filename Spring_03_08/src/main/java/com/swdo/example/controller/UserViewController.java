package com.swdo.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.example.service.UserService;
import com.swdo.example.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserViewController {

	@Autowired
	private UserService service;

	
	@RequestMapping(value = "/joinForm" , method = RequestMethod.GET)
	public String joinForm() {
		
		System.out.println("회원 가입 폼 이동");
		return "user/joinForm";
	}
	
	@RequestMapping(value = "/join" , method = RequestMethod.POST)
	public String join(UserVO user) {
		System.out.println("입력받은 데이터 값 : " + user);
		String path = service.userInsert(user);
//		return "home"; forward 방식
		return path; //redirect 방식
		
	}
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(Model model) {
		// 1. DB로부터 data를 조회한다.
		ArrayList<UserVO> list = service.userSelectAll();
		// 2. 조회한 data를 화면으로 전송한다.
		model.addAttribute("userList",list);
		return "user/listForm";
	}
	
	
	/*
	 * @RequestMapping(value = "/delete", method = RequestMethod.GET) public String
	 * delete(int user_no) {
	 * 
	 * System.out.println("삭제 기능시 전달된 데이터 :" + user_no); // 전달받은 pk의 데이터를 삭제하는 기능을
	 * 실행한다. // 실행되는 sql구문은 delete 구문이다. // 삭제 성공 후 가야하는 곳 : listForm jsp로 이동해야 한다.
	 * (redirect 활용)
	 * 
	 * service.userDelete(user_no);
	 * 
	 * return "redirect:/user/listForm"; }
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(int user_no, Model model) {
		// 전달받은 pk 값으로 회원정보를 조회한다. -> select 쿼리
		// 조회환 회원정보를 가지고 상세 정보 페이지로 이동한다. -> forward 방식
		UserVO vo = service.userSelectOne(user_no);
		System.out.println(vo);
		model.addAttribute("userDetail", vo);
		return "user/detail";
		
	}
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(int user_no, Model model) {
		// 전달받은 pk를 가지고 db로 가서 특정 회원 정보를 조회한다.
		UserVO vo = service.userSelectOne(user_no);
		
		// 조회한 회원정보를 jsp 화면으로 전달한다. 
		model.addAttribute("userVO", vo);
		
		return "user/updateForm";
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(UserVO user) {
		
		// 전달받은 데이터를 DB로 보내서 회원정보를 수정한다.
		String path = service.userUpdate(user);
		
		return path;
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		
		return "user/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO user) {
		
		String path = service.userLogin(user);
		
		return path;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		// 로그아웃 기능 실행
		
		service.logout();
		return "redirect:/";
	}
	
}
