package com.KSW.web.servlet.Front;

import java.io.IOException;

import com.KSW.web.action.ActionForward;
import com.KSW.web.servlet.Action.OrderListAction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("*.od")
public class OrderFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestRUI = req.getRequestURI();
		ActionForward forward = null;
		HttpSession session = req.getSession();
		session.setAttribute("userid", session.getAttribute("userid"));
		
		switch (requestRUI) {
		case "/myPage/OrderList.od":
			forward = new OrderListAction().execute(req, resp);
			break;
		}
	
		// 페이지 이동에 대한 일괄처리
		if (forward != null) {
			if (forward.isRedirect()) { // Redirect 방식
				resp.sendRedirect(forward.getPath());
			} else { // forward 방식
				req.getRequestDispatcher(forward.getPath()).forward(req, resp);
			}
		}
		
	}
	
}
