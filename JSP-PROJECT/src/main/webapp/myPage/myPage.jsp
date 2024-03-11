<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>myPage</title>
</head>
<body>
	<h1>마이페이지</h1>
	<a href="${pageContext.request.contextPath }/myPage/.od">
		[개인 정보 수정]
	</a><br>
	<a href="${pageContext.request.contextPath }/myPage/OrderList.od">
		[구매 내역]
	</a><br>
	<a href="${pageContext.request.contextPath }/myPage/.od">
		[문의 내역]
	</a><br>
</body>
</html>