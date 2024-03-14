<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
a {
	text-decoration: none;
	color: inherit;
}

.header-flex {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-between;
	padding: 10px 40px;
}

.header-left {
	color: #007bff;
}

.header-right {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: space-between;
	border: 1px #007bff solid;
	padding: 10px
}

.header-menu {
	display: flex;
	flex-direction: row;
	align-content: flex-start;
	justify-content: space-between;
	margin-top: 10px;
}
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 40px;
}
#cartResult img {
	width: 100%; /* 이미지 너비를 ul에 맞춤 */
	height: 50%; /* 이미지 비율 유지 */
	max-width: 150px; /* 최대 너비 설정 */
}
.CartList {
	margin: 0; /* 기존 마진 제거 */
	margin-bottom:10px;
	padding: 10px; /* 패딩 유지 */
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
.td-count-con {
    text-align: -webkit-center;
}
.main {
	align-self: center;
}
.main h2 {
	text-align: center;
}
.count-con{
    display: flex;
    flex-direction: row;
}

/* 검색 결과 및 페이지네이션 컨테이너 스타일 */
.row, #pagination {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}
/* 페이지네이션 버튼 스타일 */
.count-btn, .creditbtn{
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin: 10px 5px;
	background-color: #fff;
	cursor: pointer;
}

/* 페이지네이션 버튼 스타일 */
.page-btn1 {
	padding: 5px 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin: 10px 5px;
	background-color: #fff;
	cursor: pointer;
}

.count-btn:hover, .page-btn.active, .creditbtn{
	background-color: #007bff;
	color: #fff;
}

/* 추가적인 전반적인 스타일 조정 */
.count-btn {
}

/* 검색 양식 스타일 */
#searchFrm {
	display: flex;
	justify-content: center;
}

#searchFrm div {
	width: 400px;
	display: flex;
}

#keyword {
	flex-grow: 1;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
}

#searchBtn {
	padding: 10px 20px;
	font-size: 16px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

#searchBtn:hover {
	background-color: #0056b3;
}
.count-text {
	text-align: center;
	width: 20px;
	padding: 5px 10px;
	margin: 10px 5px;
}
tr {
	padding: 5px;
}
#credit {
	flex-direction: row;
}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../myPage/CartList.js"></script>
<body>
	<header>
		<input type="hidden" value="${userid }" id="userid">
		<div class="header-flex">
			<div class="header-left">
				<h2>
					<a href="${pageContext.request.contextPath}/main/main-page.bo">K.S.W.</a>
				</h2>
			</div>
			<form id="searchFrm">
				<div>
					<input type="text" name="search" id="keyword"
						placeholder="검색하실 책 제목을 입력하세요">
					<button type="button" id="searchBtn">검색</button>
				</div>
			</form>
			<div class="header-right">
				<div>${userid }님 안녕하세요.</div>
				<div class="header-menu" >
					<div style="margin-right: 20px;"><a href="${pageContext.request.contextPath}/login/LogOut.bo">로그아웃</a></div>
					<div><a href="${pageContext.request.contextPath}/myPage/myPage.bo">마이페이지</a></div>
				</div>
			</div>
		</div>
	</header>
	<div class="main">
		<h2>장바구니</h2>
		<form class="cartForm" action="${pageContext.request.contextPath}/myPage/InsertOrder.bo">
			<div class="CartList">
				<table>
					<tr>
						<th width="10%">선택</th>
						<th width="15%">이미지</th>
						<th width="50%">제목</th>
						<th width="15%">가격</th>
						<th width="15%">수량</th>
					</tr>
					<!-- 장바구니에 담은 주문 내역이 출력될 구역 -->
					
					<c:choose>
						<c:when test="${cartList != null and fn:length(cartList) > 0 }">
							<!-- 장바구니에 내용이 있을 경우 출력 -->
							<c:forEach var="cart" items="${cartList }">
								<tr id="cartResult">
									<td style="text-align: center;"><input type="checkbox" value="Y"></td>
									<td><img alt="${cart.title }" src="${cart.image }"><input type="hidden" name="cartNum" value="${cart.cartNum }"></td>
									<td>${cart.title }</td>
									<td>${cart.discount }</td>
									<td class="td-count-con">
										<button type="button" class="count-btn" value="128465">&#128465;</button>
										<div class="count-con">
											<button class="count-btn" type="button" value="8592">&#8592;</button>
											<input class="count-text" type="text" readonly value='1'>
											<button class="count-btn" type="button" value="8594">&#8594;</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<!-- 장바구니에 담은 물건이 없는 경우 -->
							<tr>
								<td>등록된</td>
								<td>물건이</td>
								<td>없음</td>
								<td></td>
								<td></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div class="CartList" id="credit" style="justify-content: flex-end;">
				<div>
					<table>
						<tr>
							<th style="padding-right: 10px;">총 금액</th>
							<td>금액 * 갯수</td>
						</tr>
					</table>
				</div>
				<button class="creditbtn" type="button" style=" width: 25%;">결제</button>
			</div>
		</form>
	</div>

</body>
</html>