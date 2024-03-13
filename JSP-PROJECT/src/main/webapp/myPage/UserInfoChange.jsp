<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSW 회원가입</title>
<!-- 다음 주소 찾기 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // daum 주소 api 호출 함수
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
            }
        }).open();
    }
    
    // 패스워드 확인 체크(일치하지 않으면 빨간색으로 밑에 비밀번호가 일치하지 않습니다)
    function checkPassword() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        if (password !== confirmPassword) {
            document.getElementById("passwordMessage").innerText = "비밀번호가 일치하지 않습니다.";
        } else {
            document.getElementById("passwordMessage").innerText = "";
        }
    }
</script>
<script>
// 패스워드 확인 체크
function checkPassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var passwordMessage = document.getElementById("passwordMessage");

    if (password !== confirmPassword) {
        passwordMessage.innerText = "비밀번호가 일치하지 않습니다.";
        passwordMessage.style.color = "red"; // 빨간색 글씨로 뜨게
    } else {
        passwordMessage.innerText = ""; // 일치하면 메시지 지우기
    }
}
</script>
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
    
    <form id="signupForm" action="/signup" method="post">
        <h3 style="text-align: center;"> KSW 회원가입 </h3>
        <!-- 사용자 아이디 작성 -->
        <input type="text" id="userid" name="userid" placeholder="사용자 아이디" required>
        <button type="button" id="dbchkId" name="dbchkId" onclick="fn_dbchkId()">중복확인</button>
        <input type="hidden" name="dbchkId" value="dbchkId"/>
        
        <!-- 사용자 이메일 작성 -->
		<input type="text" id="useremail" name="useremail" placeholder="사용자 이메일" required>
        
        <!-- 사용자 비밀번호 작성 -->
        <input type="password" id="password" name="password" placeholder="비밀번호" required>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" onkeyup="checkPassword()" required>
        <span id="passwordMessage" class="error"></span>
        
        <!-- 사용자 이름 작성 -->
        <input type="text" id="username" name="username" placeholder="사용자 이름" required>
        
        <!-- 사용자 생일 작성 -->
        <input type="date" id="userbirth" name="userbirth" placeholder="사용자 생일" required>
		
		<!-- 사용자 전화번호 작성 -->
		<input type="text" id="userphone" name="userphone" placeholder="전화번호" maxlength="11">
		
		<!-- 사용자 주소 작성 -->
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_postcode" placeholder="우편번호">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소">

		<button type="button" class="btn btn-outline-secondary findbtn" onclick="sample4_execDaumPostcode()">주소 찾기</button>	
        <input type="submit" value="가입하기">
        <form action="${pageContext.request.contextPath}/login/Sign-Up-Db.si">
		</form>
    </form>
</body>
</html>