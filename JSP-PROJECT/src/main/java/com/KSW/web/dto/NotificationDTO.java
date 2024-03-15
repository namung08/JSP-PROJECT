package com.KSW.web.dto;

import java.util.Date;

public class NotificationDTO {
    private int notificationNum;
    private String userId;
    private String notificationTitle;
    private String notificationDetails;
    private Date createdAt;
    private Date updatedAt;

    public NotificationDTO() {}

    public NotificationDTO(int notificationNum, String userId, String notificationTitle, String notificationDetails, Date createdAt, Date updatedAt) {
        this.notificationNum = notificationNum;
        this.userId = userId;
        this.notificationTitle = notificationTitle;
        this.notificationDetails = notificationDetails;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getNotificationNum() {
        return notificationNum;
    }

    public void setNotificationNum(int notificationNum) {
        this.notificationNum = notificationNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getNotificationTitle() {
        return notificationTitle;
    }

    public void setNotificationTitle(String notificationTitle) {
        this.notificationTitle = notificationTitle;
    }

    public String getNotificationDetails() {
        return notificationDetails;
    }

    public void setNotificationDetails(String notificationDetails) {
        this.notificationDetails = notificationDetails;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}
