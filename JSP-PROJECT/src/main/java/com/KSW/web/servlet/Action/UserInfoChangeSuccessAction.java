package com.KSW.web.servlet.Action;

import java.security.NoSuchAlgorithmException;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;
import com.KSW.web.dto.UsersDTO;
import com.KSW.web.sha256.SHA256;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserInfoChangeSuccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		UsersDTO udto = new UsersDTO();
		SHA256 sha256 = new SHA256();
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("password");
		String username = req.getParameter("username");
		String useremail = req.getParameter("useremail");
		String userbirth = req.getParameter("userbirth");
		String userphone = req.getParameter("userphone");
		String useraddr = req.getParameter("useraddr");
		
		
		req.setAttribute("userid", userid);
		req.setAttribute("userpw", userpw);
		req.setAttribute("useremail", useremail);
		req.setAttribute("username", username);
		req.setAttribute("userbirth", userbirth);
		req.setAttribute("userphone", userphone);
		req.setAttribute("useraddr", useraddr);
		
		try {
			userpw = sha256.encrypt(userpw);
			userpw = sha256.encrypt(userpw + userid);
			userpw = sha256.encrypt(userid + userpw);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/myPage/UserInfoChangeSuccess.jsp");
		return forward;
	}
}
