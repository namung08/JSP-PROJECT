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
<input type="hidden" value="${usersinfo.userid }">
	<div>
		<a href="${pageContext.request.contextPath}/search/SearchView.bo">검색</a>
	</div>
	<c:choose>
		<c:when test="${not empty usersinfo.userid }">
			<div>
				${usersinfo.userid }님 안녕하세요.
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/login/LogOut.bo'">로그아웃</button>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<a href="${pageContext.request.contextPath}/login/Sign-up-in.bo">로그인하러 가기</a>
			</div>
		</c:otherwise>
	</c:choose>
	
</body>
</html>