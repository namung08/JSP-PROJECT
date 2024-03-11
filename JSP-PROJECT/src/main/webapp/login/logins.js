/**
 * 
 */
// jsp에서의 ${pageContext.request.contextPath}를 js에서 전역변수로 설정
const hostIndex = location.href.indexOf(location.host) + location.host.length;
const contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
// 로그인 버튼을 눌렀을 때 실행이 될 자바스크립트
$(function() {
	$('#login').click(function(e) {
		login(e); // 기본적으로 첫 페이지 로드
	});
});
function login(e) {
	const loginForm = document.loginForm;
	const userid = loginForm.userid;
	const userpw = loginForm.userpw;
	
	// 아이디 빈값 체크
	if (userid.value.trim() == "") {
		alert("아이디를 입력하세요");
		userid.focus();
		return false;
	}
	// 비밀번호 빈값 체크
	if (userpw.value.trim() == "") {
		alert("비밀번호를 입력하세요");
		userpw.focus();
		return false;
	}
	sessionStorage.setItem("userid",userid.value);
	sessionStorage.setItem("userpw",userpw.value);
    // 기존 코드 유지...
//    e.preventDefault();
  //  var password = document.getElementById('userpw').value;
//    var hashedPassword = CryptoJS.SHA256(password).toString();
    // hashedPassword를 hidden 필드에 설정
//    document.getElementById('hashedPassword').value = hashedPassword;
    // 원본 비밀번호 필드를 비움
    
    loginForm.submit();
//    document.getElementById('userpw').valu ;
}

