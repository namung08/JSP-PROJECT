<%@page import="com.KSW.web.dto.UsersDTO"%>
<%@page import="com.KSW.web.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	UsersDAO udao = new UsersDAO();
	UsersDTO udto = udao.login(userid,userpw);
	
	if( udto != null){ // 로그인 성공시
		session.setAttribute("session_id", udto);
%>
	<script>
		location.href = "main-page.jsp"; // 임시 메인 페이지
	</script>
<%	} else {		// 로그인 실패 로직 %>
	<script>
		alert("아이디 또는 패스워드를 확인하세요");
		location.href = "login.jsp"; // 로그인 페이지로 다시 전송
	</script>
	
<% } %>
</body>
</html>