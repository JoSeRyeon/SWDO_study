package com.swdo.example.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.example.dao.UserDAO;
import com.swdo.example.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDAO dao;
	
	//이미 bean에 httpSession은 등록되어 있다. 그러므로 의존을 넣어달라고 어노테이션 넣어주기.
	@Autowired 
	private HttpSession session;
	
	public String userInsert(UserVO user) {
		int cnt = dao.userInsert(user);
		String path = "";
		
		if(cnt == 0) {
			System.out.println("회원 가입 실패");
			path = "redirect:/";
		} else {
			System.out.println("회원 가입 성공");
			path = "redirect:/";
		}
		return path;
	}
	
	public ArrayList<UserVO> userSelectAll(){
		
		// 강제 형변환 안 해주면 session은 Object 타입 반환
		
		ArrayList<UserVO> list = dao.userSelectAll();
		return list;	

	}
	
	public void userDelete(int user_no) {
		int cnt = dao.userDelete(user_no);
		
		if(cnt == 0) {
			System.out.println("삭제 실패");
		}else {
			System.out.println("삭제 성공");
		}
		
	}
	
	public UserVO userSelectOne(int user_no) {
		UserVO vo = dao.userDetail(user_no);
		return vo;
	}
	
	public String userUpdate(UserVO user) {
		int cnt = dao.userUpdate(user);
		String path = "";
		
		if(cnt == 0) {
			System.out.println("회원 정보 수정 실패");
			path = "redirect:/user/updateForm?user_no="+user.getUser_no();
		} else {
			System.out.println("회원 정보 수정 성공");
			path = "redirect:/user/listForm";
		}
		
		return path;
	}
	
	public String userLogin(UserVO user) {
		UserVO result = dao.userLogin(user);
		String path = "";
		
		if(result == null) {
			System.out.println("존재하지 않는 ID입니다.");
			path = "redirect:/user/loginForm";

		} else {
			System.out.println("존재하는 ID 입니다.");
			if(user.getUser_pw().equals(result.getUser_pw())) {
				System.out.println("로그인 정보가 올바릅니다.");
				// 세션 스코프에 검증이 되었다는 data를 넣어준다.
				session.setAttribute("loginVO", result);
				path = "redirect:/";
				
			}else {
				System.out.println("비밀번호가 틀렸습니다.");
				path = "redirect:/user/loginForm";
			}
		}
		
		return path;
		
		
	}
	
	public void logout() {
		//session Scope에 있는 로그인 된 정보를 삭제한다.
		
		session.removeAttribute("loginVO");

	}
}
