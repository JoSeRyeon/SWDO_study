package com.swdo.test.dao;

import java.util.ArrayList;

import com.swdo.test.vo.BoardVO;

public interface BoardMapper {
	
	public int boardInsert(BoardVO board);
	
	public ArrayList<BoardVO> boardSelectAll(BoardVO board);
	
	public BoardVO boardSelectOne(int boardnum);
	
	public int boardDelete(BoardVO board);
	
	public int boardUpdate(BoardVO board);
}
