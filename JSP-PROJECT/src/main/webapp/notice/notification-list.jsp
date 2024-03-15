<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <style>
        /* CSS 스타일링 작성 */
    </style>
</head>
<body>
    <h1>공지사항 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>수정일</th>
            </tr>
        </thead>
        <tbody>
            <%-- 공지사항 목록을 반복하여 출력 --%>
            <c:forEach var="notification" items="${notificationList}">
                <tr>
                    <td>${notification.notificationNum}</td>
                    <td>${notification.userId}</td>
                    <td>${notification.notificationTitle}</td>
                    <td>${notification.notificationDetails}</td>
                    <td>${notification.createdAt}</td>
                    <td>${notification.updatedAt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
