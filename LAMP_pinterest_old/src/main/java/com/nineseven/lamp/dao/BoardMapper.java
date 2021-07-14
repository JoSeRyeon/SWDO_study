package com.nineseven.lamp.dao;

import java.util.ArrayList;

import com.nineseven.lamp.vo.BoardVO;

public interface BoardMapper {
	public int boardInsert(BoardVO board);
	
	public ArrayList<BoardVO> boardSelectAll();
}
