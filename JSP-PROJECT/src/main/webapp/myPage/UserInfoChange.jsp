<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<!-- 다음 주소 찾기 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="sign-up.js"></script>
</head>
<body>
    <style>
        /* 스타일은 여기에 작성합니다 */
        /* 예시: 폼 스타일 */
        form {
            margin: 20px auto;
            width: 300px;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"], input[type="password"], input[type="date"] {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
        }
    </style>
    
    <form id="signupForm" action="${pageContext.request.contextPath}/myPage/UserInfoChangeSuccess.bo" method="post">
        <h3 style="text-align: center;"> 회원정보 수정 </h3>
        <!-- 사용자 아이디 작성 -->
        아이디
        <input type="text" id="userid" name="userid" value="${userid }" readonly >
        
        <!-- 사용자 이메일 작성 -->
        이메일
		<input type="text" id="useremail" name="useremail" value="${useremail }" readonly >
        
        <!-- 사용자 비밀번호 작성 -->
        비밀번호
        <input type="password" id="password" name="password" placeholder="비밀번호" required>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" onkeyup="checkPassword()" required>
        <span id="passwordMessage" class="error"></span>
        
        <!-- 사용자 이름 작성 -->
        이름
        <input type="text" id="username" name="username" value="${username }" required>
        
        <!-- 사용자 생일 작성 -->
        생년월일
        <input type="text" id="userbirth" name="userbirth" value="${userbirth }" readonly>
		
		<!-- 사용자 전화번호 작성 -->
		전화번호
		<input type="text" id="userphone" name="userphone" value="${userphone }" readonly>
		
		<!-- 사용자 주소 작성 -->
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_postcode" placeholder="우편번호">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소">

		<button type="button" class="btn btn-outline-secondary findbtn" onclick="sample4_execDaumPostcode()">주소 찾기</button>	
        <input type="submit" value="변경하기">
    </form>
</body>
</html>