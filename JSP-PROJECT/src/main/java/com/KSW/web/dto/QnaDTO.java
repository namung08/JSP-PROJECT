package com.KSW.web.dto;

import java.util.Date;

public class QnaDTO {
    private int qnaNum;			//문의 번호 PK
    private String userId;		//유저 아이디 FK
    private String qnatitle;	//문의 제목
    private String qnaDetails;	//문의 내용
    private Date created_at;	//작성 날짜
    private Date answer_at;		//답변 날짜
    private String qnaanswer;	//답변 내용

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

	public String getQnatitle() {
		return qnatitle;
	}

	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getAnswer_at() {
		return answer_at;
	}

	public void setAnswer_at(Date answer_at) {
		this.answer_at = answer_at;
	}

	public String getQnaanswer() {
		return qnaanswer;
	}

	public void setQnaanswer(String qnaanswer) {
		this.qnaanswer = qnaanswer;
	}
    
}
