<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    	align-content:center;
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        width: 300px;
    }

    input[type="text"],
    input[type="password"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }

    button {
        width: calc(100% - 20px);
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

    #findid,
    #findpw {
        background-color: #e7e7e7;
        color: #333;
    }

    button:hover {
        opacity: 0.9;
    }
</style>

</head>
<body>
	<form action="">
		<input name="userid" id="userid" type="text" placeholder="아이디를 입력하세요">
		<input name="userpw" id="userpw" type="password" placeholder="비밀번호를 입력하세요">
		<button id="login" name="login">로그인</button>
		<button id="signup" name="signup">회원가입</button>
		<button id="findid" name="findid">아이디 찾기</button>
		<button id="findpw" name="findpw">비밀번호 찾기</button>
	</form>
</body>
</html>