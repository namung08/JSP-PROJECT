<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>KSW 회원가입</h3>
<form action="${pageContext.request.contextPath}/login/Sign-Up-Db.si">
	<div>
		아이디 <input type="text" name="userid">
	</div>
	<div>
		비밀번호 <input type="password" name="userpww">
	</div>
	<div>
		비밀번호 확인 <input type="password" name="userpw">
	</div>
	<div>
		이름 <input>
	</div>
	<div>
		생일 <input>
	</div>
	<div>
		전화번호 <input>
	</div>
	<div>
		주소 <input>
	</div>
	<div>
		이메일 <input>
	</div>
</form>
</body>
</html>