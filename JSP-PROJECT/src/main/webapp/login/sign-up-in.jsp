<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

form {
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    width: 300px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

button {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: none;
    border-radius: 4px;
    color: #fff;
    cursor: pointer;
}

#login {
    background-color: #4CAF50;
}

#signup {
    background-color: #008CBA;
}

#findid, #findpw {
    background-color: #e7e7e7;
    color: #333;
    width: 49%; /* Adjust width to fit in one line */
}

button:hover {
    opacity: 0.9;
}

.find-buttons {
    display: flex;
    justify-content: space-between;
    width: 100%;
}

h1 {
    color: #333;
    margin-bottom: 20px;
    text-align: center;
}

</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 비밀번호 암호화 스크립트 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
<script src="logins.js"></script>
<body>
	<c:if test="${not empty param.flag}">
		<c:if test="${not param.flag}">
			<script>
 				alert("로그인 실패");
 			</script>
		</c:if>
	</c:if>
    <div class="login-container">
        <h1>KSW 로그인</h1>
        <form name="loginForm" id="loginForm" action="${pageContext.request.contextPath}/login/Sign-InDB.us" method="post">
            <input name="userid" id="userid" type="text" placeholder="아이디를 입력하세요">
            <input name="userpw" id="userpw" type="password" placeholder="비밀번호를 입력하세요">
            <!-- 해시된 비밀번호를 저장할 새 hidden 필드 추가 -->
            <input type="hidden" id="hashedPassword" name="hashedPassword">
            <button type="button" id="login">로그인</button>
            <button type="button" id="signup" onclick="location.href='${pageContext.request.contextPath}/login/Sign-up.us'" >회원가입</button>
            <div class="find-buttons">
                <button type="button" id="findid" onclick="location.href='${pageContext.request.contextPath}/login/Find-id.us'">아이디 찾기</button>
                <button type="button" id="findpw" onclick="location.href='${pageContext.request.contextPath}/login/Find-pw.us'">비밀번호 찾기</button>
            </div>
        </form>
    </div>
</body>
</html>
