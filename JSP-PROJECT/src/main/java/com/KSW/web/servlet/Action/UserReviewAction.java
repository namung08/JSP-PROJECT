package com.KSW.web.servlet.Action;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dto.ReviewDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserReviewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
	ActionForward forward = new ActionForward();
	ReviewDTO rdto = new ReviewDTO();
	
	// reply_insert_date Date 값
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String replynum = req.getParameter("replynum");
	String isbn = req.getParameter("isbn");
	String userid = req.getParameter("userid");
	String reply_insert_date = req.getParameter("reply_insert_date");
	String reply_grade = req.getParameter("reply_grade");
	// Clob 형태 변환
	String reply_detail = req.getParameter("reply_detail");
	
	
	// 리뷰 고유 숫자
	rdto.setReplynum(replynum);
	// 책 isbn 값
	rdto.setIsbn(isbn);
	// 리뷰 작성 유저 id
	rdto.setUserid(userid);
	// String 타입의 reply_insert_date를 date 타입으로 바꾸기 위한 메서드
	Date date;
	try {
		date = formatter.parse(reply_insert_date);
		rdto.setReply_insert_date(date);
	}catch (ParseException e) {
		System.out.println("데이트 타입 변환 실패");
		e.printStackTrace();
	}
	// 리뷰 평점
	rdto.setReply_grade(reply_grade);
	// 리뷰 내용 자바에서 Clob 타입으로 변환해서 넣기
	rdto.setReply_detail(reply_detail);
	
	
	
	forward.setPath(req.getContextPath() + "");
	forward.setRedirect(true);
	return forward;

	}
}
