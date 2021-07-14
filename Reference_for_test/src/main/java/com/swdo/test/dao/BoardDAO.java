package com.swdo.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.BoardVO;

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
}
