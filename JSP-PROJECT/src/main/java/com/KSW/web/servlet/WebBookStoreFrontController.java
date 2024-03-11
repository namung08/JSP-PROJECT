package com.KSW.web.servlet;

import java.io.IOException;

import com.KSW.web.action.ActionForward;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("*.bo")
public class WebBookStoreFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		HttpSession session = req.getSession();
        ActionForward forward = null;
        switch (requestURI) {
		case "/search/SearchView.bo": 
			 forward = new SearchViewAction().execute(req, resp);
			//forward = new ActionForward(true, "/search/searchview.jsp");
			break;
		case "/login/Sign-up-in.bo":
			forward = new ActionForward(true, "/login/sign-up-in.jsp");
			break;
		case "/login/LogOut.bo":
			forward = new LogOutAction().execute(req, resp);
		}
		// 페이지 이동에 대한 일괄 처리
        if (forward != null) {
            if (forward.isRedirect()) { // Redirect 방식
                resp.sendRedirect(forward.getPath());
            } else { // Forward 방식
                req.getRequestDispatcher(forward.getPath()).forward(req, resp);
            }
        }
	}
}
