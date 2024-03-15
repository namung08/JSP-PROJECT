package com.KSW.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.BookDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class BookDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public BookDAO() {
		sqlSession = factory.openSession(true);
	}

	public void insertBookDetails(BookDTO bdto) {
		sqlSession.insert("Search.setBookDetail",bdto);
	}
}
