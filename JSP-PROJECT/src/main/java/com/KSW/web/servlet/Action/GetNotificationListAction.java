package com.KSW.web.servlet.Action;

import com.KSW.web.action.Action;
import com.KSW.web.action.ActionForward;
import com.KSW.web.dao.NotificationDAO;
import com.KSW.web.dto.NotificationDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

public class GetNotificationListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
        ActionForward forward = new ActionForward();
        
        // NotificationDAO를 사용하여 공지사항 목록을 가져온다.
        List<NotificationDTO> notificationList = new NotificationDAO().getNotificationList();
        
        // 공지사항 목록을 request에 저장한다.
        req.setAttribute("notificationList", notificationList);
        
        // 목록 조회 페이지로 이동한다.
        forward.setPath("/notice/notification-list.jsp");
        forward.setRedirect(false);
        
        return forward;
    }
}
