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
	<a href="/notification/getNotificationList.bo">공지사항</a>		
	<a href="/notice/faq.jsp">FAQ</a>
	<a href="/Inquiry/list.jsp">1:1문의</a>		<!-- @@@@@링크수정 해야함@@@@@ -->
</body>
</html>