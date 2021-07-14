package com.swdo.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.MemberDAO;
import com.swdo.test.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private HttpSession session;

	public String memberInsert(MemberVO member) {
		int cnt = dao.memberInsert(member);
		String path = "";
		
		if(cnt == 0){
			System.out.println("회원 가입 실패");
			path = "redirect:/member/joinForm";
		}else {
			System.out.println("회원 가입 성공");
			path = "redirect:/";
		}
		return path;
	}
	
	public String memberLogin(MemberVO member) {
		MemberVO result = dao.memberLogin(member);
		String path = "";
		
		if(result == null) {
			System.out.println("없는 아이디입니다.");
			path = "redirect:/member/loginForm";
		}else {
			System.out.println("올바른 아이디입니다.");
			if(member.getPassword().equals(result.getPassword())) {
				System.out.println("올바른 로그인정보입니다.");
				session.setAttribute("loginVO", result);
				path = "redirect:/";
			}else {
				System.out.println("비밀번호가 틀렸습니다.");
				path = "redirect:/member/loginForm";
			}
		}
		return path;
	}
	
	public void logout() {
		
		session.removeAttribute("loginVO");
	}
	
	public ArrayList<MemberVO> memberSelectAll(){
		ArrayList<MemberVO> memberlist = dao.memberSelectAll();
		return memberlist;
	}
}
