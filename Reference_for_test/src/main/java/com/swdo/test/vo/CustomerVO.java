package com.swdo.test.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class CustomerVO {

	private String customer_id;
	private String customer_pw;
	private String customer_nm;
	private String customer_email;
	/*
	 * private ArrayList<String> customer_agree;
	 * private String customer_hobby;
	 * private String customer_sex;
	 */
}
