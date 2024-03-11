package com.KSW.web.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.KSW.web.dto.UsersDTO;
import com.KSW.web.mybatis.SqlMapConfig;

import jakarta.servlet.jsp.jstl.sql.Result;

public class UsersDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public UsersDAO() {
		sqlSession = factory.openSession(true);
	}
	
	// 회원가입 절차
	public boolean join(UsersDTO udto) {
		boolean result = false;
		
		if(sqlSession.insert("Users.join",udto) == 1) {
			result = true;
		}
		
		return result;
	}
	
	// 로그인 기능
	public UsersDTO login(String userid, String userpw) {
		UsersDTO users = null;
		
		HashMap<String,String> datas = new HashMap<String, String>();
		datas.put("USERID", userid);
		datas.put("USERPW", userpw);
		
		users = sqlSession.selectOne("Users.login", datas);
		
		return users;
	}
	
	// 로그인 확인 절차
	public boolean checkid(String userid) {
		boolean result = false;
		int cnt = 0;
		cnt = sqlSession.selectOne("Users.checkId",userid);
		if(cnt >= 1) {
			result = true;
		}
		return result;
	}
	
	 // 사용자 이름과 이메일로 사용자 아이디를 찾는 메서드
   		public String findUserIdByNameAndEmail(String name, String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String userId = null;
        
        try {
            conn = getConnection(); // getConnection() 메서드는 데이터베이스 연결을 반환하는 것으로 가정합니다.

            String query = "SELECT userid FROM users WHERE name = ? AND email = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                userId = rs.getString("userid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 리소스 해제 코드들...
        }

        return userId;
   		}

    // 다른 메서드들...
}
        

