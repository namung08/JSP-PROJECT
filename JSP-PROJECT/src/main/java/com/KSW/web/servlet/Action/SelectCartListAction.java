package com.KSW.web.servlet.Action;

import java.util.List;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.SearchDAO;
import com.KSW.web.dto.CartDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SelectCartListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		CartDTO cdto = new CartDTO();
		SearchDAO sdao = new SearchDAO();
		String userid = (String)session.getAttribute("userid");
		int totalCnt = sdao.getCartCnt(userid);
		if(sdao.countCartList(userid)) {
			req.setAttribute("cartList", sdao.getCartList(userid));
		}
		return forward;
	}

}
