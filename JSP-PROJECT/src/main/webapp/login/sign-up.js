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

// 패스워드 확인 체크
function checkPassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var passwordMessage = document.getElementById("passwordMessage");

    if (password !== confirmPassword) {
        passwordMessage.innerText = "비밀번호가 일치하지 않습니다.";
        passwordMessage.style.color = "red"; // 빨간색 글씨로 표시
        passwordMessage.className = "password-check"
        return false;
    } else {
        passwordMessage.innerText = "비밀번호가 일치합니다."; // 일치하면 메시지 지우기
        passwordMessage.style.color = "green";
        passwordMessage.className = "password-check"
        return true;
    }
}

function joinsubmit() {
    if (sendit()) {
        document.getElementById('sample4_roadAddress').disabled = false;
        document.getElementById('sample4_postcode').disabled = false;
        document.getElementById('signForm').submit();
    } else {
        alert("유효성 검사를 통과하지 못했습니다. 다시 시도해주세요.");
        return false; // 유효성 검사 실패 시 폼 제출 방지
    }
}

function sendit() {
    let frm = document.joinForm;
    let userid = frm.userid;
    let password = frm.password;
    let reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

    if (userid.value.length < 4 || userid.value.length > 16) {
        alert("아이디는 4자 이상, 16자 이하로 입력해주세요.");
        userid.focus();
        return false; // 유효성 검사 실패 시 false 반환
    }
    if($('#idcheck').text() != "사용 가능한 아이디입니다." && $('#idcheck').text() == "") {
		alert("아이디 중복체크가 완료가 되지 않았습니다.\n다시 진행해 주세요.")
		userid.focus();
		return false;
	}
    if (!reg.test(password.value)) {
        alert("비밀번호는 8자리 이상이어야 하며, 영문/숫자가 하나라도 포함되어야 합니다.");
        password.focus();
        return false; // 유효성 검사 실패 시 false 반환
    }
    if (frm.password.value.search(/\s/) != -1) {
        alert("비밀번호에 공백 없이 입력해주세요.");
        frm.password.focus();
        return false; // 유효성 검사 실패 시 false 반환
    }
    return true; // 모든 조건 통과 시 true 반환
}

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
            error: function(result, status, error) { // 실패시 콜백함수
                console.log(error);
            }
        });
    }
}
