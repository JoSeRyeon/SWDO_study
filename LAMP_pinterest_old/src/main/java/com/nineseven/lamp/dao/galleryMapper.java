package com.nineseven.lamp.dao;

import java.util.ArrayList;

import com.nineseven.lamp.vo.galleryVO;

public interface galleryMapper {

	public int galleryInsert(galleryVO gallery);
	
	public ArrayList<galleryVO> gallerySelectAll();
}
