package com.codingbox.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.codingbox.web.dbconnection.DBConnection_bak;
import com.codingbox.web.dto.MemberDTO;

public class MemberDAO_bak {
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs;
	
	// 회원가입
	public boolean join(MemberDTO mDto) {
		boolean result = false;
		String sql 
		= "INSERT INTO TBL_MEMBER VALUES (?,?,?,?,?)";
		
		try{
			conn = DBConnection_bak.getConnection();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, mDto.getUserid());
			pstm.setString(2, mDto.getUserpw());
			pstm.setString(3, mDto.getUsername());
			pstm.setString(4, mDto.getUsergender());
			pstm.setString(5, mDto.getUserphone());
			
			if(pstm.executeUpdate() != 0) { // 성공
				result = true;
			} else {						// 실패
				result = false;
			}
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 예외 발생");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("SQL 예외 발생");
		}
		
		return result;
	}
	
	// 로그인 확인
	public MemberDTO login(String userid, String userpw) {
		MemberDTO member = null;
		String sql 
		= "SELECT * FROM TBL_MEMBER WHERE USERID =? AND USERPW =?";
		
		try {
			conn = DBConnection_bak.getConnection();
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, userid);
			pstm.setString(2, userpw);
			
			rs = pstm.executeQuery();
			if( rs.next() ) {
				member = new MemberDTO();
				member.setUserid(rs.getString(1));
				member.setUserpw(rs.getString(2));
				member.setUsername(rs.getString(3));
				member.setUsergender(rs.getString(4));
				member.setUserphone(rs.getString(5));
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 예외 발생");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("SQL 예외 발생");
		}
		
		return member;
	}
	
	public boolean checkId(String userid) {
		boolean result = false;
		String sql 
		= "SELECT COUNT(*) FROM TBL_MEMBER WHERE USERID=?";
		
		try {
			conn = DBConnection_bak.getConnection();
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, userid);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1) == 1) {
					result = true;
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
	

}








