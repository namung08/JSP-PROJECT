package com.KSW.web.servlet.Action;

import java.util.List;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.SearchDAO;
import com.KSW.web.dto.CartDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SelectCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		SearchDAO sdao = new SearchDAO();
		String userid = (String) session.getAttribute("userid");
		int totalCnt = sdao.getCartCnt(userid);
		String temp = req.getParameter("page");
		int page = 0;
		page = temp == null ? 1 : Integer.parseInt(temp);

		int pageSize = 10;
		int endRow = page * 10; // 1페이지면 : 10, 4페이지 : 40
		int startRow = endRow - 9; // 1페이지면 : 1, 4페이지 : 31

		// [1][2]..[10]:[1], [11][12]..[20] : [11]
		int startPage = (page - 1) / pageSize * pageSize + 1;
		// [1][2]..[10]:[10], [11][12]..[20] : [20]
		int endPage = startPage + pageSize - 1;
		int totalPage = (totalCnt - 1) / pageSize + 1;

		endPage = endPage > totalPage ? totalPage : endPage;

		req.setAttribute("cartList", sdao.getCartList(startRow, endRow, userid));
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		// forward방식으로 페이지 이동
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/myPage/CartList.jsp");
		return forward;
	}

}
