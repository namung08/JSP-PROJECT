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
	public boolean login(String userid, String userpw) {
		boolean result = false;
		HashMap<String, String> idpw = new HashMap<>();
		idpw.put("userid", userid);
		idpw.put("userpw", userpw);
		if((Integer)sqlSession.selectOne("Users.loginboolean", idpw) == 1) {
			result = true;
		}
		
		return result;
	}
	
	public UsersDTO getparam(String userid, String userpw) {
		HashMap<String, String> idpw = new HashMap<>();
		idpw.put("userid", userid);
		idpw.put("userpw", userpw);
		return sqlSession.selectOne("Users.login", idpw);
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
	

	public boolean findId(String username, String useremail) {
		boolean result = false;
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("username", username);
		data.put("useremail", useremail);
		
		if((Integer)sqlSession.selectOne("Users.findid",data) == 1) {
			System.out.println("아이디 찾기 성공");
			result = true;
		} else {
			System.out.println("아이디 찾기 실패");
		}
		
		return result;
	}

	public String getid(String username, String useremail) {
		String id = null;
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("username", username);
		data.put("useremail", useremail);
		id = sqlSession.selectOne("Users.getid",data);
		
		return id;
	}

		

    // 다른 메서드들...
}
        

