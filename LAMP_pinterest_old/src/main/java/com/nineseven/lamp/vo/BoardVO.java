package com.nineseven.lamp.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int board_no;			    // 글번호
	private String board_title;		 	// 글 제목
	private String id;		  			// 작성자
	private int board_hits;			    // 조회수
	private String board_content;	  	// 글 내용
	private String board_indate;	  	// 작성일
	private String board_original;		// 원본 파일명
	private String board_saved;		  	// 저장 파일명
}