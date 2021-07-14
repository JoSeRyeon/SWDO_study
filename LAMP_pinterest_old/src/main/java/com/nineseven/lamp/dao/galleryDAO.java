package com.nineseven.lamp.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nineseven.lamp.controller.memberViewController;
import com.nineseven.lamp.vo.galleryVO;

@Repository
public class galleryDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(galleryDAO.class);
	
	@Autowired
	private SqlSession session;
	
	public int galleryInsert(galleryVO gallery) {
		
		int cnt = 0;
		
		try {
			galleryMapper mapper = session.getMapper(galleryMapper.class);
			cnt = mapper.galleryInsert(gallery);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public ArrayList<galleryVO> gallerySelectAll(){
		
		ArrayList<galleryVO> list = null;
		try {
			galleryMapper mapper = session.getMapper(galleryMapper.class);
			list = mapper.gallerySelectAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
