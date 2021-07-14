package com.nineseven.lamp.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nineseven.lamp.dao.memberDAO;
import com.nineseven.lamp.dao.petDAO;
import com.nineseven.lamp.vo.memberVO;
import com.nineseven.lamp.vo.petVO;

@Service
public class petService {
	
	@Autowired
	private petDAO dao;
	
	
	public void petInsert(petVO pet) {
		
		dao.petInsert(pet);
	}
}
