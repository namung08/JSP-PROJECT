<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${userid }'s myPage</title>
</head>
<body>
	<h1>${userid }님의 마이페이지</h1>
	<a href="${pageContext.request.contextPath }/myPage/UserInfoCheck.bo">
		[회원정보 수정]
	</a><br>
	<a href="${pageContext.request.contextPath }/myPage/OrderList.bo">
		[구매 내역]
	</a><br>
	<a href="${pageContext.request.contextPath }/myPage/.bo">
		[문의 내역]
	</a><br>
	<a href="${pageContext.request.contextPath }/main/main-page.jsp">
		[메인 페이지]
	</a><br>
	<a href="${pageContext.request.contextPath }/search/CartList.bo">
		[장바구니]
	</a><br>
	
</body>
</html>