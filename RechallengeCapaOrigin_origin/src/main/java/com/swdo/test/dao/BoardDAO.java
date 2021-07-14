package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.BoardVO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession session;

	public ArrayList<HashMap<String, Object>> boardSelectALL(){
		ArrayList<HashMap<String, Object>> list = null;
		
		try {
			list = session.getMapper(BoardMapper.class).boardSelectALL();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> boardList(BoardVO board) {
		ArrayList<HashMap<String, Object>> result = null;
		
		try {
			result = session.getMapper(BoardMapper.class).boardList(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int boardInsert(BoardVO board) {
		
		int cnt = 0;
		
		try {
			cnt = session.getMapper(BoardMapper.class).boardInsert(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public BoardVO boardSelectOne(BoardVO board) {
		
		BoardVO result = null;
		try {
			result = session.getMapper(BoardMapper.class).boardSelectOne(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int boardUpdate(BoardVO board) {
		
		int cnt = 0;
		
		try {
			cnt = session.getMapper(BoardMapper.class).boardUpdate(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
		
		
	}
	
	public int boardUpdateCnt(BoardVO board) {
		int cnt = 0;
		
		try {
			cnt = session.getMapper(BoardMapper.class).boardUpdateCnt(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int boardDelete(BoardVO board) {
		
		int cnt = 0;
		
		try {
			cnt = session.getMapper(BoardMapper.class).boardDelete(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
