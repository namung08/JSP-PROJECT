package com.KSW.web.dto;

public class QnaDTO {
    private int qnaNum;			//문의 번호 PK
    private String userId;		//유저 아이디 FK
    private String qnaDetails;	//문의 내용

    // Getters and Setters
    public int getQnaNum() {
        return qnaNum;
    }

    public void setQnaNum(int qnaNum) {
        this.qnaNum = qnaNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getQnaDetails() {
        return qnaDetails;
    }

    public void setQnaDetails(String qnaDetails) {
        this.qnaDetails = qnaDetails;
    }
}
