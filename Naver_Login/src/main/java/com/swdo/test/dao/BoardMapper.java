package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.swdo.test.vo.BoardVO;

public interface BoardMapper {

	public ArrayList<HashMap<String, Object>> boardSelectALL();

	public ArrayList<HashMap<String, Object>> boardList(BoardVO board);

	public int boardInsert(BoardVO board);

	public BoardVO boardSelectOne(BoardVO board);
	
	public int boardUpdate(BoardVO board);
	
	public int boardUpdateCnt(BoardVO board);
	
	public int boardDelete(BoardVO board);
}
