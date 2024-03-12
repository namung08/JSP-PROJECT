package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.SearchDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class insertBookDb implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		SearchDAO sdao = new SearchDAO();
		
		if(sdao.insertBookDb(sdao)) {
			forward.setPath(req.getContextPath() + "/search/BoardView.bo");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
