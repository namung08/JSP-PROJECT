/**
 * 
 */

window.onload = function() {
	// .infoWrap_txtInner 클래스를 가진 모든 요소를 찾습니다. 
	// querySelectorAll을 사용하여 여러 개가 있을 경우를 대비합니다.
	var infoWraps = document.querySelectorAll('.infoWrap_txtInner');

	// 각 infoWrap 요소에 대해 반복 처리합니다.
	infoWraps.forEach(function(infoWrap) {
		// 현재 infoWrap 요소 내부의 .txtContentText 클래스를 가진 <textarea> 요소를 찾습니다.
		var txtArea = infoWrap.querySelector('.txtContentText');
		// <textarea>의 값(책 설명)을 가져옵니다.
		var txtValue = txtArea.value;

		// 새로운 <div> 요소를 생성하여 <textarea>의 값으로 설정합니다.
		var newDiv = document.createElement('div');
		newDiv.innerHTML = txtValue;

		// 생성된 <div>를 infoWrap 내부에 추가합니다.
		infoWrap.appendChild(newDiv);
	});
};
