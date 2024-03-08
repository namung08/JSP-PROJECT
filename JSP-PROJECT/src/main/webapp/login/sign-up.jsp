<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSW 회원가입</title>
	<!-- 다음 주소 찾기 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function inputIdchk() {
        var userid = document.getElementById("userid").value;
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                if (xhr.status == 200) {
                    var isDuplicate = xhr.responseText;
                    if (isDuplicate == "true") {
                        alert("사용할 수 없는 아이디입니다.");
                    } else {
                        alert("사용 가능한 아이디입니다.");
                    }
                } else {
                    alert("서버 오류가 발생했습니다.");
                }
            }
        };
        xhr.open("GET", "checkId.jsp?userid=" + userid, true);
        xhr.send();
    }
    	// daum 주소 api 호출 함수 
    function sample4_execDaumPostcode() {
        // 함수 내용 작성
    }
</script>
<script>	
			// 회원가입중 사용자 주소 찾기 API(daum)
			
			//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
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
        input[type="text"], input[type="password"] {
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
    </style>
</head>
<body>
    <form id="signupForm" action="/signup" method="post">
        <h3 style="text-align: center;"> KSW 회원가입 </h3>
        <!-- 사용자 아이디 작성 -->
        <input type="text" id="userid" name="userid" placeholder="사용자 아이디" required>
        <button type="button" id="dbchkId" name="dbchkId" onclick="fn_dbchkId">중복확인</button>
        <input type="hidden" name="dbchkId" value="dbchkId"/>
        
        <!-- 사용자 비밀번호 작성 -->
        <input type="password" id="password" name="password" placeholder="비밀번호" required>
        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required>
        
        <!-- 사용자 이름 작성 -->
        <input type="text" id="username" name="username" placeholder="사용자 이름" required>
        
        <!-- 사용자 생일 작성 -->
        <input type="text" id="userbirth" name="userbirth" placeholder="사용자 생일" required>
		
		<!-- 사용자 전화번호 작성 -->
		<!-- 사용자 전화번호 인증 차후에 결정 -->
		<div>
			<label for="phone">전화번호</label>
			<div>
				<select name="phone1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="051">051</option>
				</select><br> <input type="text" name="phone2" size="5" maxlength="4">
				- <input type="text" name="phone3" size="5" maxlength="4">
			</div>
		</div>
		
		<!-- 사용자 주소 작성 -->
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
		<input type="text" id="sample4_postcode" placeholder="우편번호">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소">
		<input type="text" id="sample4_extraAddress" placeholder="참고항목">
		<button type="button" class="btn btn-outline-secondary findbtn" onclick="sample4_execDaumPostcode()">주소 찾기</button>	
		
		
		<input type="text" id="useremail" name="useremail" placeholder="사용자 이메일" required>
		<button type="button" id="dbchkId" name="dbchkId" onclick="fn_dbchkId">중복확인</button>
        <input type="submit" value="가입하기">
        
        <form action="${pageContext.request.contextPath}/login/Sign-Up-Db.si">
		</form>
</body>
</html>