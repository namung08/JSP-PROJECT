package com.KSW.web.servlet.Action;

import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.UsersDAO;
import com.KSW.web.dto.UsersDTO;
import com.KSW.web.sha256.SHA256;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignUpAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UsersDTO udto = new UsersDTO();
		UsersDAO udao = new UsersDAO();
		SHA256 sha256 = new SHA256();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		// 파라미터 값 불러오기
		String userid = req.getParameter("userid");
		String pw = req.getParameter("confirmPassword");
		String username = req.getParameter("username");
		String userbirth = req.getParameter("userbirth");
		String userphone = req.getParameter("userphone");
		String add1 = req.getParameter("add1");
		String add2 = req.getParameter("add2");
		String add3 = req.getParameter("add3");
		System.out.println("1"+add1+"2"+add2);
		String useraddr = add1+" ("+add2+") "+add3;
		String useremail = req.getParameter("useremail");
		// 아이디
		udto.setUserid(userid);
		// 비밀번호 암호화 하기
		String cryptpw;
		try {
			cryptpw = sha256.encrypt(pw);
			System.out.println("1:"+cryptpw);
			cryptpw = cryptpw+userid;
			cryptpw = sha256.encrypt(cryptpw);
			System.out.println("2:"+cryptpw);
			cryptpw = userid + cryptpw;
			cryptpw = sha256.encrypt(cryptpw);
			System.out.println("3:"+cryptpw);
			// 비밀번호
			udto.setUserpw(cryptpw);
		} catch (NoSuchAlgorithmException e) {
			System.out.println("암호화 실패");
			e.printStackTrace();
		}
		// 이름
		udto.setUsername(username);
		
		Date date;
		// String 타입의 userbirth를 date 타입으로 바꾸기 위한 메서드
		try {
			date = formatter.parse(userbirth);
			// 생일
			udto.setUserbirth(date);
		} catch (ParseException e) {
			System.out.println("생일 변환 실패");
			e.printStackTrace();
		}
		// 전화번호
		udto.setUserphone(userphone);
		// 주소
		udto.setUseraddr(useraddr);
		// 이메일
		udto.setUseremail(useremail);
		if(udao.insertJoin(udto)) {
			forward.setPath(req.getContextPath() + "/search/bookdetails.jsp");
			forward.setRedirect(true);
		}
		
		
		return forward;
	}
	
}
