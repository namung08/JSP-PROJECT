<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f8f8;
    padding: 20px;
}
h1 {
    color: #333;
}
a {
    display: block;
    margin-bottom: 10px;
    background-color: rgb(36, 39, 39);
    color: white;
    text-decoration: none;
    padding: 10px;
    width: 200px;
    text-align: center;
    font-weight: bold;
    border-radius: 5px;
}
a:hover {
    background-color: gray;
}
</style>
</head>
<body>
<h1>코시웨 고객센터</h1>
	<a href="/notice/getNotificationList.bo">공지사항</a>	<!-- 데이터베이스에서 목록 불러오기까지만 가능합니다 -->
	<a href="/notice/faq.jsp">FAQ</a>					<!-- FAQ 내용은 임의로 작성했습니다 -->
	<a href="/notice/inquiry.jsp">1:1문의</a>				<!-- 데이터베이스와 작업을 안 거쳐서 우선 jsp로 바로 갈 수 있게 했습니다 -->
</body>
</html>