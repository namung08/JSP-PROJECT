package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;
import com.KSW.web.dto.UsersDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserInfoCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		UsersDTO udto = new UsersDTO();
		// 세션에 아이디를 저장 하기 위한 세션 객체 생성
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		String userpw = req.getParameter("userpw");
		
		if(udao.login(userid, userpw)) {
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/myPage/UserInfoChange.jsp");
		} else {
			forward.setPath(req.getContextPath() + "/myPage/UserInfoCheck.jsp?flag=false");
			forward.setRedirect(false);
		}

		return forward;
	}

}
