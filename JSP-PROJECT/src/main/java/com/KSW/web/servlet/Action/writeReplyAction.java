package com.KSW.web.servlet.Action;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.OrderlistDAO;
import com.KSW.web.dto.OrderListDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class writeReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		OrderListDTO odto = new OrderListDTO();
		OrderlistDAO odao = new OrderlistDAO();
		
		String isbn = req.getParameter("isbn");
		String title = odao.getTitle(isbn);
		
		req.setAttribute("isbn", isbn);
		req.setAttribute("title", title);
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/myPage/ReviewWrite.jsp");
		return forward;
	}

}
