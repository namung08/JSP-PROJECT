package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FindPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDAO udao = new UsersDAO();
		String username = req.getParameter("name");
		String userid = req.getParameter("id");
		String useremail = req.getParameter("email");
		if(udao.findpw(username,userid,useremail)) {
			System.out.println("비밀번호 값 불렁오는 중");
			String pw = udao.getpw(username,userid,useremail);
			System.out.println("비밀번호 값 불러옴");
			System.out.println(pw.length());
			String pw1 = pw.substring(0,2);
			String pw2 = pw.substring(pw.length()-2);
			int starcnt = pw.length()-4;
			String star = "";
			for(int i = 0;i<starcnt;i++) {
				star += "*";
			}
			System.out.println(star);
			System.out.println(pw1);
			System.out.println(pw2);
			String pwresult = pw1 + star + pw2;
			System.out.println(pwresult);
			System.out.println("userpw : " + pw);
			req.setAttribute("userpw", pwresult);
		} else {
			System.out.println("실패 페이지 이동");
			req.setAttribute("result", "false");
		}
		forward.setPath(req.getContextPath() + "/login/FindPwResult.bo");
		forward.setRedirect(false);
		return forward;
	}
}
