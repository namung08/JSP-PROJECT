<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="CartList.js"></script>
<body>
	<header>
	<input type="hidden" value="${userid }" id="userid">
		<div class="header-flex">
			<div class="header-left">
				<h2>
					<a href="${pageContext.request.contextPath}/main/main-page.bo">K.S.W.</a>
				</h2>
			</div>
			<div>
				${userid }님 안녕하세요. <a
					href="${pageContext.request.contextPath}/login/LogOut.bo">로그아웃</a><br>
				<a href="${pageContext.request.contextPath}/myPage/myPage.bo">마이페이지</a>
			</div>
		</div>
	</header>
	<div class="main">
		<h2>장바구니</h2>
		<form action="${pageContext.request.contextPath}/myPage/InsertOrder.bo">
			<div class="CartList">
			<!-- 장바구니에 담은 주문 내역이 출력될 구역 -->
			</div>
		</form>
		<div class="Pagination">
		<!-- 페이징 처리를 위한 구역 -->
		</div>
	</div>

</body>
</html>