package com.swdo.test.vo;

import lombok.Data;

@Data
public class BoardVO {

	 private int board_no;     
	 private String board_title; 
	 private String board_content;
	 private String customer_id;  
	 private String board_indate;  
	 private int board_hits;    
}
