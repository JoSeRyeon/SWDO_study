package com.swdo.test.vo;

import lombok.Data;

@Data
public class BoardVO {
	
	private int board_no; 			// 글번호
	private String board_title; 	// 글제목
	private String customer_id; 	// 작성자
	private int board_hits; 		// 조회수
	private String board_content; 	// 글 내용
	private String board_indate;	//작성일
	private String board_original; 	//원본파일명
	private String board_saved; 	//실제저장파일명
	
}
