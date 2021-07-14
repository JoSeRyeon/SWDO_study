package com.nineseven.lamp.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nineseven.lamp.dao.galleryDAO;
import com.nineseven.lamp.vo.galleryVO;
import com.nineseven.lamp.vo.memberVO;

@Service
public class galleryService {
	
	private static final Logger logger = LoggerFactory.getLogger(galleryService.class);

	@Autowired
	private galleryDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public void galleryInsert(galleryVO gallery) {
		memberVO member = (memberVO)session.getAttribute("loginVO");
		gallery.setId(member.getId());
		
		int cnt = dao.galleryInsert(gallery);
		
		if(cnt ==0) {
			logger.info("사진 등록 실패 {}" , gallery);
		}else {
			logger.info("사진 등록 성공 {}", gallery);
		}
	}
	
	public ArrayList<galleryVO> gallerySelectAll(){
		ArrayList<galleryVO> list = dao.gallerySelectAll();
		logger.info("글전체 : {}", list);
		return list;
	}
}
