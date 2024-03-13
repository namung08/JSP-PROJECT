<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSW 임시페이지</title>
</head>
<body> 
<input type="hidden" value="${userid }">
	<div>
		<a href="${pageContext.request.contextPath}/search/SearchView.bo">검색</a>
	</div>
	<c:choose>
		<c:when test="${not empty userid }">
			<div>
				${userid }님 안녕하세요.
				<a href="${pageContext.request.contextPath}/login/LogOut.bo">로그아웃</a><br>
				<a href="${pageContext.request.contextPath}/myPage/myPage.bo">마이페이지</a>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<a href="${pageContext.request.contextPath}/login/Sign-up-in.bo">로그인하러 가기</a><br>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>