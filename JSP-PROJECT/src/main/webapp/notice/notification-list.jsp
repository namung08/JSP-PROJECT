<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            padding: 20px;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: rgb(36, 39, 39);
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
	<c:if test="${not empty param.flag}">
		<c:if test="${not param.flag}">
			<script>
				alert("관리자가 아닙니다.");
			</script>
		</c:if>
	</c:if>
    <h1>공지사항 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
                <th>수정일</th>
                <c:if test="${isAdmin}">
                    <th>수정</th>
                    <th>삭제</th>
                </c:if>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="notification" items="${NotificationList}">
                <tr>
                    <td>${notification.notificationNum}</td>
                    <td>${notification.userId}</td>
                    <td>${notification.notificationTitle}</td>
                    <td>${notification.notificationDetails}</td>
                    <td>${notification.createdAt}</td>
                    <td>${notification.updatedAt}</td>
                    <c:if test="${isAdmin}">
                        <td><a href="${pageContext.request.contextPath}/notice/noticemodify.bo?notificationNum=${notification.notificationNum}">수정</a></td>
                        <td><a href="${pageContext.request.contextPath}/notice/noticdelete.bo?notificationNum=${notification.notificationNum}">삭제</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/notice/noticeWrite.bo">[공지사항 작성]</a>
</body>
</html>
