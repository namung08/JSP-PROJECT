<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${userid }'smyPage</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="mypage.js"></script>
<link rel="stylesheet" type="text/css" href="../css/header.css">
</head>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 40px;
}
.list {
	max-width : 350px;
	padding: 10px;
	background-color: #ffffff;
	border: 1px solid #dddddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: box-shadow 0.3s ease;
	display: flex; /* 이미지와 텍스트를 세로로 정렬 */
	flex-direction: column; /* 컨텐츠를 세로로 정렬 */
	align-items: center; /* 가운데 정렬 */
}
</style>
<body>
	<header>
		<input type="hidden" value="${userid }">
		<div class="header-flex">
			<div class="header-left">
				<a href="${pageContext.request.contextPath}/main/main-page.bo"><img
					class="logo" alt="메인페이지로 이동" src="../img/ksw.png"></a>
			</div>
			<form id="searchFrm">
				<div>
					<input type="text" name="search" id="keyword"
						placeholder="검색하실 책 제목을 입력하세요">
				</div>
				<div>
					<button type="button" id="searchBtn">검색</button>
				</div>
			</form>
			<c:choose>
				<c:when test="${not empty userid}">
					<div class="header-right">
						<div>${userid }님안녕하세요.</div>
						<div class="header-menu">
							<div style="margin-right: 20px;">
								<a href="${pageContext.request.contextPath}/login/LogOut.bo">로그아웃</a>
							</div>
							<div>
								<a href="${pageContext.request.contextPath}/myPage/myPage.bo">마이페이지</a>
							</div>
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
	<input type="hidden" id="flag" value="${flag}">
	<div class="list">
		<h1>${userid }님의마이페이지</h1>
		<div>
			<a href="${pageContext.request.contextPath }/myPage/UserInfoCheck.bo">
				[회원정보 수정] </a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath }/myPage/OrderList.bo">
				[구매 내역] </a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath }/myPage/.bo"> [문의 내역]
			</a>
		</div>
		<div>
			<a id="cartlist"
				href="${pageContext.request.contextPath }/search/CartList.bo">
				[장바구니] </a>
		</div>
	</div>
</body>
</html>