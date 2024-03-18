package com.KSW.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.NotificationDTO;
import com.KSW.web.dto.QnaDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class NotificationDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;

	public NotificationDAO(){
		sqlSession = factory.openSession(true);
	}
	
	public List<NotificationDTO> getNotificationList(){
		return sqlSession.selectList("getNotificationList");
	}
}
