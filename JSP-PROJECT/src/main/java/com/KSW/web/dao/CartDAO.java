package com.KSW.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.CartDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class CartDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public CartDAO() {
		sqlSession = factory.openSession(true);
	}

	public boolean insertCart(CartDTO cdto) {
		boolean result = false;
		if(sqlSession.insert("MyPage.setCart",cdto) == 1) {
			result = true;
		}
		return result;
	}

	public boolean deleteCart(int cartNum) {
		boolean result = false;
		if(sqlSession.delete("MyPage.delCart",cartNum) == 1) {
			result = true;
		}
		return result;
	}

	
	
}
