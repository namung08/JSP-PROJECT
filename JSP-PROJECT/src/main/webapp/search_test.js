/**
 * 
 */
// [검색 요청] 버튼 클릭 시 실행할 메서드를 정의합니다.
$(function() {
    $('#searchBtn').click(function() {
        loadResults(1); // 기본적으로 첫 페이지 로드
    });
});

function loadResults(page) {
    var startNum = (page - 1) * 10 + 1; // 페이지 번호에 따른 시작 번호 계산
    $.ajax({
        url: "../../NaverSearchAPI.do",
        type: "get",
        data: {
            keyword: $('#keyword').val(),
            startNum: startNum
        },
        dataType: "json",
        success: function(data) {
            sucFuncJson(data); // 성공 함수 호출
            createPagination(5, page); // 페이지네이션 생성, 여기서 5는 총 페이지 수를 의미
        },
        error: errFunc
    });
}

// 페이지네이션 생성 함수
function createPagination(totalPages, currentPage) {
    var paginationStr = '';
    for (var i = 1; i <= totalPages; i++) {
        paginationStr += '<button type="button" class="page-btn" data-page="' + i + '">' + i + '</button>';
    }
    $('#pagination').html(paginationStr);

    // 페이지 버튼 클릭 이벤트 바인딩
    $('.page-btn').click(function() {
        var page = $(this).data('page');
        loadResults(page); // 해당 페이지의 결과 로드
    });
}
// 검색 성공 시 결과를 화면에 뿌려줍니다.
function sucFuncJson(d) {
	var str = "";
	$.each(d.items, function(index, item) {
		str += "<ul>";
		str += "    <li>" + (index + 1) + "</li>";
		str += "    <li class='title'> 제목 : " + item.title + "</li>";
		str += "    <img src='" + item.image + "'width='304' height='228'>";
		str += "    <li class='meta-info' > 저자 : " + item.author + "</li>";
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
