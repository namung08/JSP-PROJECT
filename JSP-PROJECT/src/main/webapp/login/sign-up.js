/**
 * 
 */
// daum 주소 api 호출 함수
function sample4_execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete: function(data) {
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
				}
				if (extraRoadAddr !== '') {
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
// 패스워드 확인 체크
function checkPassword() {
	var password = document.getElementById("password").value;
	var confirmPassword = document.getElementById("confirmPassword").value;
	var passwordMessage = document.getElementById("passwordMessage");

	if (password !== confirmPassword) {
		passwordMessage.innerText = "비밀번호가 일치하지 않습니다.";
		passwordMessage.style.color = "red"; // 빨간색 글씨로 뜨게
		passwordMessage.className = "password-check"
	} else {
		passwordMessage.innerText = "비밀번호가 일치합니다."; // 일치하면 메시지 지우기
		passwordMessage.style.color = "green";
		passwordMessage.className = "password-check"
	}
}

function joinsubmit() {
	sendit();
	document.getElementById('sample4_roadAddress').disabled = false;
	document.getElementById('sample4_postcode').disabled = false;
	signupForm.submit();
}
$(function() {
	$('#login').click(function(e) {
		login(e); // 기본적으로 첫 페이지 로드
	});
});
// 회원가입 유효성 검사 작성
/**
 *  회원가입 validation check
 */
function sendit() {
   let frm = document.joinForm;
   let userid = frm.userid;
   let password = frm.password;
   let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
   
   if(userid.value.length < 4 || userid.value.length > 16){
       alert("아이디는 4자 이상, 16자 이하로 입력해주세요.")
       userid.focus();
       return;
   }   
   if(!reg.test(password.value)){
       alert("비밀번호는 8자리 이상이어야 하며, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.");
       password.focus();
       return;
   }	
	if(frm.password.value.search(/\s/) != -1){
		alert("비밀번호에 공백 없이 입력해주세요.");
		frm.password.focus();
		return;
	}

}	

	
	/*sessionStorage.setItem("userid",userid.value);
	sessionStorage.setItem("userpw",userpw.value);
    // 기존 코드 유지...
    e.preventDefault();
    var password = document.getElementById('userpw').value;
    var hashedPassword = CryptoJS.SHA256(password).toString();
    // hashedPassword를 hidden 필드에 설정
    document.getElementById('hashedPassword').value = hashedPassword;
    // 원본 비밀번호 필드를 비움*/
    
    // Form 제출


	
// 아이디 중복 확인
function CheckId(userid) {
	
	if (userid == "") {
		alert("아이디를 입력해주세요");
		return false;
	} else {
		$.ajax({
			type: 'post',
			url: 'idcheck.jsp',
			data: { userid: userid },
			async: true,
			success: function(result) {
				var idcheckMessage = document.getElementById("idcheck");
				if (result.trim() == "ok") {
					idcheckMessage.innerText = "사용 가능한 아이디입니다.";
					idcheckMessage.style.color = "green"; // 초록색으로 표시
				} else {
					idcheckMessage.innerText = "중복된 아이디입니다.";
					idcheckMessage.style.color = "red"; // 빨간색으로 표시
				}
			},
			error: function(result, status, error) {		// 실패시 콜백함수
				console.log(error);
			}
		});
	
	}
}