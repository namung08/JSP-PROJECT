<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KSW 책 검색 페이지</title>
<style>
/* 페이지 전체 스타일 */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 20px;
}

/* 검색 양식 스타일 */
#searchFrm {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

#searchFrm div {
    width: 100%;
    max-width: 600px;
    display: flex;
}

#keyword {
    flex-grow: 1;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-right: 10px;
}

#searchBtn {
    padding: 10px 20px;
    font-size: 16px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

#searchBtn:hover {
    background-color: #0056b3;
}

/* 검색 결과 및 페이지네이션 컨테이너 스타일 */
.row, #pagination {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
}

/* 페이지네이션 버튼 스타일 */
.page-btn {
    padding: 5px 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin: 10px 5px;
    background-color: #fff;
    cursor: pointer;
}

.page-btn:hover, .page-btn.active {
    background-color: #007bff;
    color: #fff;
}

/* 추가적인 전반적인 스타일 조정 */
#pagination {
    margin-top: 20px;
}

/* 검색 결과 상세 스타일 */
#searchResult ul {
    margin: 10px;
    background-color: #ffffff;
    border: 1px solid #dddddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    overflow: hidden;
    transition: box-shadow 0.3s ease;
}

#searchResult ul:hover {
    box-shadow: 0 6px 12px rgba(0,0,0,0.15);
}

#searchResult img {
    display: block;
    width: 100%;
}

#searchResult li {
    list-style: none;
    padding: 8px 12px;
    border-bottom: 1px solid #f0f0f0;
}

#searchResult li:last-child {
    border-bottom: none;
}
</style>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="searchAPI.js"></script>
<body>
	<form id="searchFrm">
		<div>
			<input type="text" name="search" id="keyword" placeholder="검색하실 책 제목을 입력하세요">
			<button type="button" id="searchBtn">검색</button>
		</div>
	</form>
	<div class="row" id="searchResult">
        여기에 검색 결과가 출력됩니다.
    </div>
    <div id="pagination">
			<!-- 페이지네이션 버튼이 여기에 들어갑니다 -->
	</div>
</body>
</html>