package com.KSW.web.dto;

import java.util.Date;

public class NotificationDTO {
	private int notificationnum;			//공지 번호
	private String userid;					//작성자 아이디
	private String notification_title;		//공지 제목
	private String notification_details;	//공지 내용
	private Date created_at;				//작성 날짜
	private Date updated_at;				//수정 날짜
	
	public int getNotificationnum() {
		return notificationnum;
	}
	public void setNotificationnum(int notificationnum) {
		this.notificationnum = notificationnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNotification_title() {
		return notification_title;
	}
	public void setNotification_title(String notification_title) {
		this.notification_title = notification_title;
	}
	public String getNotification_details() {
		return notification_details;
	}
	public void setNotification_details(String notification_details) {
		this.notification_details = notification_details;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	
}
