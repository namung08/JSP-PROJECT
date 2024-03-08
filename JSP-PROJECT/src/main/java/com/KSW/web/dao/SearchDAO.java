package com.KSW.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.BookDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class SearchDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public SearchDAO() {
		sqlSession = factory.openSession(true);
	}
	
	public boolean insertBookDb() {
		boolean result = false;
		BookDTO bdto = new BookDTO();
		if (sqlSession.insert("Reply.insertReply", bdto) == 1) {
			result = true;
		}
		
		return result;
	}
}
