package com.KSW.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.NotificationDTO;
import com.KSW.web.mybatis.SqlMapConfig;

public class NotificationDAO {
    private SqlSessionFactory factory;

    public NotificationDAO() {
        this.factory = SqlMapConfig.getFactory();
    }

    // 공지사항 목록 조회
    public List<NotificationDTO> getNotificationList() {
        try (SqlSession sqlSession = factory.openSession()) {
            return sqlSession.selectList("com.KSW.web.dao.NotificationMapper.getNotificationList");
        }
    }

    // 공지사항 추가
    public void addNotification(NotificationDTO notification) {
        try (SqlSession sqlSession = factory.openSession()) {
            sqlSession.insert("com.KSW.web.dao.NotificationMapper.addNotification", notification);
            sqlSession.commit();
        }
    }

    // 공지사항 수정
    public void updateNotification(NotificationDTO notification) {
        try (SqlSession sqlSession = factory.openSession()) {
            sqlSession.update("com.KSW.web.dao.NotificationMapper.updateNotification", notification);
            sqlSession.commit();
        }
    }

    // 공지사항 삭제
    public void deleteNotification(int notificationNum) {
        try (SqlSession sqlSession = factory.openSession()) {
            sqlSession.delete("com.KSW.web.dao.NotificationMapper.deleteNotification", notificationNum);
            sqlSession.commit();
        }
    }
}
