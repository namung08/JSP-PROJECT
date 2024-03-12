package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;
import com.KSW.web.dto.UsersDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CheckLoginDBAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		UsersDTO udto = new UsersDTO();
		// 세션에 아이디를 저장 하기 위한 세션 객체 생성
		HttpSession session = req.getSession();
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		System.out.println("userid : "+userid);
		System.out.println("userpw : "+userpw);
		if(udao.login(userid, userpw)) {
			udto = udao.getparam(userid,userpw);
			session.setAttribute("userid", udto.getUserid());
			forward.setPath(req.getContextPath() + "/main/main-page.jsp");
			forward.setRedirect(true);
		} else {
			forward.setPath(req.getContextPath() + "/login/sign-up-in.jsp?flag=false");
			forward.setRedirect(false);
		}
		
		
		
		return forward;
	}
	
}
