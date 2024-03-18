package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class noticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		
		
		
		if(userid == "admin") {
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/notice/noticeWrite.jsp");
		} else {
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/notice/noticeWrite.jsp?flag=false");
		}
		
		return forward;
	}

}
