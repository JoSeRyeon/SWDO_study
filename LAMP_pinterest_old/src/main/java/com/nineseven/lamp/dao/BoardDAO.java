package com.nineseven.lamp.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nineseven.lamp.vo.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession session;
	
	public int boardInsert(BoardVO board) {
		int cnt = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.boardInsert(board);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return cnt;
	}
	
	public ArrayList<BoardVO> boardSelectAll() {
		ArrayList<BoardVO> list = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			list = mapper.boardSelectAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
