/**
 * 
 */

// [검색 요청] 버튼 클릭 시 실행할 메서드를 정의합니다.
// HTML 문서의 로딩이 완료된 후에 내부의 코드가 실행되도록 하는 역할
$(function() {
	$('#searchBtn').click(function() {
		$.ajax({
			url: "../../NaverSearchAPI.do",  // 요청 URL
			type: "get",                  // HTTP 메서드
			data: {                       // 매개변수로 전달할 데이터
				keyword: $('#keyword').val(),                   // 검색어
				startNum: $('#startNum option:selected').val()  // 검색 시작 위치
			},
			dataType: "json",      // 응답 데이터 형식
			success: sucFuncJson,  // 요청 성공 시 호출할 메서드 설정
			error: errFunc         // 요청 실패 시 호출할 메서드 설정
		});
	});
});

// 검색 성공 시 결과를 화면에 뿌려줍니다.
function sucFuncJson(d) {
	var str = "";
	$.each(d.items, function(index, item) {
		str += "<ul>";
		str += "    <li>" + (index + 1) + "</li>";
		str += "    <li> 제목 : " + item.title + "</li>";
		str += "    <img src='" + item.image + "'width='304' height='228'>";
		str += "    <li> 저자 : " + item.author + "</li>";
		str += "    <li> 출판사 : " + item.publisher + "</li>";
		str += "    <li> 가격 : " + item.discount + "</li>";
		str += "    <li> 출간일 : " + item.postdate + "</li>";
		str += "    <li><a href='" + item.link + "' target='_blank'>바로가기</a></li>";
		str += "</ul>";
	});
	$('#searchResult').html(str);
}

// 실패 시 경고창을 띄워줍니다.
function errFunc(e) {
	alert("실패: " + e.status);
}