package com.KSW.web.servlet.Action;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.OrderlistDAO;
import com.KSW.web.dto.OrderListDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InsertOrderListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		OrderListDTO odto = new OrderListDTO();
		OrderlistDAO odao = new OrderlistDAO();
		
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("userid");
		String title = req.getParameter("title");
		String discount = req.getParameter("discount");
		System.out.println(discount);
		String quantity = req.getParameter("quantity");
		int count;
		if(quantity != null && quantity != "") {
			count = Integer.parseInt(quantity);
			odto.setCount(count);
		} else {
			count = 1;
			odto.setCount(count);
		}
		String isbn = req.getParameter("isbn");
		discount = discount.trim().replace(",", "").replace("원", "");
		int dis = Integer.parseInt(discount);
		dis = dis*count;
		
		odto.setUserId(userid);
		
		LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);
		odto.setIsbn(isbn);
		odto.setOrderDate(formattedDate);
		odto.setTitle(title);
		odto.setDiscount(dis);
		System.out.println(odto);
		
		if(odao.insertOrderList(odto)) {
			System.out.println("성공!");
			forward.setPath(req.getContextPath()+"/myPage/OrderList.bo");
			forward.setRedirect(false);
		}
		return forward;
	}
	
	

}
