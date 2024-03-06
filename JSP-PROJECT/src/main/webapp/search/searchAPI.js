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
        url: "/search/SearchDb.api",
        type: "get",
        data: {
            keyword: $('#keyword').val(),
            startNum: startNum
        },
        dataType: "json",
        success: function(data) {
            sucFuncJson(data); // 성공 함수 호출
            createPagination((data.total/12+1), page); // 페이지네이션 생성, 여기서 5는 총 페이지 수를 의미
        },
        error: errFunc
    });
    console.log(startNum);
    return false;
}

// 페이지네이션 생성 함수
function createPagination(totalPages, currentPage) {
    var paginationStr = '';
    // 한 페이지에 보여줄 항목의 수
    var pageSize = 10;
    // 현제 페이지의 시작 행과 마지막 행 번호를 계산
   let endRow = currentPage * 10;
   let startRrw = endRow - 9;
   // 페이징 처리를 위한 시작 페이지와 끝 페이지 번호를 계산
   let startPage = (currentPage-1)/pageSize * pageSize+1;
   let endPage = startPage + pageSize-1;
   // 전체 페이지 수 : totalPages
   endPage = endPage > totalPages ? totalPages : endPage;
    
    $('#pagination').html(paginationStr);

    // 페이지 버튼 클릭 이벤트 바인딩
    $('.page-btn').click(function() {
        var page = $(this).data('page');
        loadResults(page); // 해당 페이지의 결과 로드
    });
}
//<input type="hidden" name="boardnum" value=${boardnum }>
// 검색 성공 시 결과를 화면에 뿌려줍니다.
function sucFuncJson(d) {
	var str = "";
	$.each(d.items, function(index, item) {
		console.log(index);
		str += "<ul>";
		str += "    <input type='hidden' name='isbn' id='isbn' value='" + (item.isbn)+"'>";
		str += "    <img name='image' id='image' src='" + item.image + "'width='304' height='228'>";
		str += "    <li name='title' id='title'> 제목 : " + item.title + "</li>";
		str += "    <li name='author' id='author' > 저자 : " + item.author + "</li>";
		str += "    <li name='publisher' id='publisher'> 출판사 : " + item.publisher + "</li>";
		str += "    <li name='discount' id='discount'> 가격 : " + item.discount + "</li>";
		str += "    <li name='pubdate' id='pubdate'> 출간일 : " + item.pubdate + "</li>";
		str += "</ul>";
	});
	$('#searchResult').html(str);
}
// 실패 시 경고창을 띄워줍니다.
function errFunc(e) {
	alert("실패: " + e.status);
}
