<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSW 임시페이지</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/header.css">
<body> 
<header>
<input type="hidden" value="${userid }">
<div class="header-flex">
	<div class="header-left">
			<a href="${pageContext.request.contextPath}/main/main-page.bo"><img class="logo" alt="메인페이지로 이동" src="../img/ksw.png"></a>
	</div>
	<form id="searchFrm" action="/search/SearchView.bo" method="post">
		<div>
			<input type="text" name="search" id="keyword"
				placeholder="검색하실 책 제목을 입력하세요">
		</div>
		<div>
			<button type="submit" id="searchBtn">검색</button>
		</div>
	</form>
	<c:choose>
		<c:when test="${not empty userid}">
			<div class="header-right">
				<div>${userid }님 안녕하세요.</div>
				<div class="header-menu" >
					<div style="margin-right: 20px;"><a href="${pageContext.request.contextPath}/login/LogOut.bo">로그아웃</a></div>
					<div><a href="${pageContext.request.contextPath}/myPage/myPage.bo">마이페이지</a></div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="header-right">
				<a href="${pageContext.request.contextPath}/login/Sign-up-in.bo">로그인</a>
			</div>
		</c:otherwise>
	</c:choose>
</div>
</header>
</body>
</html>