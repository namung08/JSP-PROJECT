package com.KSW.web.dto;

import java.sql.Date;

public class ReviewDTO {
	private String replynum;
	private String isbn;
	private String userid;
	private Date reply_insert_date;
	private String reply_grade;
	private String reply_detail;
	
	public String getReplynum() {
		return replynum;
	}
	public void setReplynum(String replynum) {
		this.replynum = replynum;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getReply_insert_date() {
		return reply_insert_date;
	}
	public void setReply_insert_date(Date reply_insert_date) {
		this.reply_insert_date = reply_insert_date;
	}
	public String getReply_grade() {
		return reply_grade;
	}
	public void setReply_grade(String reply_grade) {
		this.reply_grade = reply_grade;
	}
	public String getReply_detail() {
		return reply_detail;
	}
	public void setReply_detail(String reply_detail) {
		this.reply_detail = reply_detail;
	}
	
	
	
}	
