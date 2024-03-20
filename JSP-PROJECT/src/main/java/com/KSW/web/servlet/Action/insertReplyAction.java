package com.KSW.web.servlet.Action;

import java.util.List;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.ReviewDAO;
import com.KSW.web.dto.ReviewDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class insertReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		// 객체 생성
		ReviewDTO rdto = new ReviewDTO();
		ReviewDAO rdao = new ReviewDAO();
		HttpSession session = req.getSession();
		// 파라미터 값 받아오기
		String isbn = req.getParameter("isbn");
		String reply = req.getParameter("reply");
		int rating = Integer.parseInt(req.getParameter("rating"));
		String userid = (String)session.getAttribute("userid");
		// dto에 받아온 파라미터 값 담기
		rdto.setIsbn(isbn);
		rdto.setReply(reply);
		rdto.setReplygrade(rating);
		rdto.setUserid(userid);
		
		// dto를 파라미터로 dao 실행
		if(rdao.insertReply(rdto)) {
			forward.setPath(req.getContextPath()+"/myPage/OrderList.jsp");
			forward.setRedirect(true);
		}
		
		return forward;
	}
	
}
