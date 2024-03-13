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
	document.getElementById('sample4_roadAddress').disabled = false;
	document.getElementById('sample4_postcode').disabled = false;
	signupForm.submit();
}