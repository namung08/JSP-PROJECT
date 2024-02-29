package com.codingbox.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codingbox.web.dbconnection.DBConnection_bak;
import com.codingbox.web.dto.MemberDTO;
import com.codingbox.web.mybatis.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlSession;
	
	public MemberDAO() {
		sqlSession = factory.openSession(true);
	}
	
	 // 회원가입
	public boolean join(MemberDTO mDto) {
		boolean result = false;
		if(sqlSession.insert("Member.join",mDto) == 1) {
			result = true;
		}
		
		
		return result;
	}
	
	// 로그인 확인
	public MemberDTO login(String userid, String userpw) {
		MemberDTO member = null;
		
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
	
		member = sqlSession.selectOne("Member.login", datas);
		
		return member;
	}
	
	public boolean checkId(String userid) {
		boolean result = false;
		int cnt = 0;
		
		cnt = sqlSession.selectOne("Member.checkId", userid);
		if(cnt >= 1) {
			result = true;
		}
		
		return result;
	}
//	
//	public MemberDTO searchById(String userid) {
//		MemberDTO mDto = null;
//		return sqlSession.selectOne("Member.searchById", userid);
//	}
	public MemberDTO searchById(String userid) {
	    // 메서드 구현
		return sqlSession.selectOne("Member.searchById", userid);
	}
	
	public List<MemberDTO> getList() {
		return sqlSession.selectList("Member.getList");
	}
}








