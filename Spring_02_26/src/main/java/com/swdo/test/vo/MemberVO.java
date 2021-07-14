package com.swdo.test.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String[] hobby;
	private int age;
	private String pr;
	private String indate;
}
