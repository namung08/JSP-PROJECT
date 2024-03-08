package com.KSW.web.servlet;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dto.BookDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookParamAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		BookDTO bdto = new BookDTO();
		bdto.setIsbn(req.getParameter("isbn"));
		bdto.setDescription(req.getParameter("description"));
		bdto.setImage(req.getParameter("imageSrc"));
		bdto.setTitle(req.getParameter("title"));
		bdto.setAuthor(req.getParameter("author"));
		bdto.setPublisher(req.getParameter("publisher"));
		bdto.setDiscount(req.getParameter("discount"));
		String date = req.getParameter("pubdate");
		// 2009-06-20
		// 스트링 타입을 date 타입으로 변환
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date setdate;
		try {
			setdate = formatter.parse(date);
			bdto.setPubdate(setdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		req.setAttribute("bookdetails", bdto);
		forward.setPath(req.getContextPath() + "/search/bookdetails.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
