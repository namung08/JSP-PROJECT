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

public class UserInfoCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		UsersDTO udto = new UsersDTO();
		SHA256 sha256 = new SHA256();
		// 세션에 아이디를 저장 하기 위한 세션 객체 생성
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("userid");
		String userpw = req.getParameter("userpw");
		String pw = "";
		try {
			// 비밀번호 암호화
			pw = sha256.encrypt(userpw);
			pw = pw+userid;
			pw = sha256.encrypt(pw);
			pw = userid + pw;
			pw = sha256.encrypt(pw);
			System.out.println(pw);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		System.out.println(pw);
		if(udao.login(userid, pw)) {
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/myPage/UserInfoChange.jsp");
		} else {
			forward.setPath(req.getContextPath() + "/myPage/UserInfoCheck.jsp?flag=false");
			forward.setRedirect(false);
		}
		return forward;
		
		

		
	}

}
