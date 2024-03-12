package com.KSW.web.servlet.Front;

import java.io.IOException;

import com.KSW.web.action.ActionForward;
import com.KSW.web.servlet.Action.BookParamAction;
import com.KSW.web.servlet.Action.CheckLoginDBAction;
import com.KSW.web.servlet.Action.LogOutAction;
import com.KSW.web.servlet.Action.OrderListAction;
import com.KSW.web.servlet.Action.SearchViewAction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("*.bo")
public class MainFrontController extends HttpServlet{
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
		session.setAttribute("userid", session.getAttribute("userid"));
        ActionForward forward = null;
        switch (requestURI) {
        // 메인페이지로 이동
        case "/main/main-page.bo" :
        	forward = new ActionForward(true, "/main/main-page.jsp");
        	break;
		case "/search/SearchView.bo": 
			 forward = new SearchViewAction().execute(req, resp);
			//forward = new ActionForward(true, "/search/searchview.jsp");
			break;
		case "/login/Sign-up-in.bo":
			forward = new ActionForward(true, "/login/sign-up-in.jsp");
			break;
		case "/myPage/myPage.bo":
			forward = new ActionForward(true, "/myPage/myPage.jsp");
			break;
		case "/login/LogOut.bo":
			forward = new LogOutAction().execute(req, resp);
			break;
		case "/myPage/OrderList.od":
			forward = new OrderListAction().execute(req, resp);
			break;
		// 책 상세 페이지 이동
		case "/search/bookDetails.se":
        	forward = new BookParamAction().execute(req, resp);
			break;
		// 로그인
		case "/login/Sign-InDB.us": 
			System.out.println("/login/Sign-InDB.us");
			forward = new CheckLoginDBAction().execute(req, resp);
			break;
		case "/login/Sign-up.us":
			System.out.println("/login/Sign-up.us");
			forward = new ActionForward(false, "/login/sign-up.jsp");
			break;
		// 아이디와 비밀번호 찾기
		case "/login/Find-id.us":
			System.out.println("/login/Find-id.us");
			forward = new ActionForward(true, "/login/find-id.jsp");
			break;
		case "/login/Find-pw.us":
			System.out.println("/login/Find-pw.us");
			forward = new ActionForward(true, "/login/find-pw.jsp");
			break;
		case "/login/Sign-Up-Db.si": 
			forward = new ActionForward(true, "");
			break;
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
