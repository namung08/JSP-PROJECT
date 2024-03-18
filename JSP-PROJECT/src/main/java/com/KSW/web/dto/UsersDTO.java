package com.KSW.web.dto;

import java.util.Date;

public class UsersDTO {
	private String userid;		//유저 아이디
	private String userpw;		//유저 비밀번호
	private String username;	//유저 이름
	private Date userbirth;		//유저 생년월일
	private String userphone;	//유저 전화번호
	private String useraddr;	//유저 주소
	private String useremail;	//유저 이메일
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
        // 아이디 유효성 검사 로직 추가
        if (userid == null || userid.length() < 4 || userid.length() > 16) {
            throw new IllegalArgumentException("아이디는 4자 이상, 16자 이하여야 합니다.");
        }
        this.userid = userid;
    }
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
        // 비밀번호 유효성 검사 로직 추가
        String pattern = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
        if (!userpw.matches(pattern)) {
            throw new IllegalArgumentException("비밀번호는 8자리 이상이어야 하며, 대문자/소문자/숫자/특수문자를 모두 포함해야 합니다.");
        }
        this.userpw = userpw;
    }
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
        // 이름 유효성 검사 로직 추가 (예: 공백 없이 2자 이상)
        if (username == null || username.trim().length() < 2) {
            throw new IllegalArgumentException("이름은 2자 이상이어야 합니다.");
        }
        this.username = username;
    }
	public Date getUserbirth() {
		return userbirth;
	}
	public void setUserbirth(Date userbirth) {
		this.userbirth = userbirth;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUseraddr() {
		return useraddr;
	}
	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	
	
}
