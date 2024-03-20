package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.OrderlistDAO;
import com.KSW.web.dto.OrderListDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class writeReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		OrderListDTO odto = new OrderListDTO();
		OrderlistDAO odao = new OrderlistDAO();
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/myPage/ReviewWrite.jsp");
		return forward;
	}

}
