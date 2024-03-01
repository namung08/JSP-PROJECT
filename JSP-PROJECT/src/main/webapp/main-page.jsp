<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>/* 검색 결과 컨테이너 */
#searchResult {
	margin-top: 20px;
}

/* 각 검색 결과 항목 */
ul {
	list-style-type: none; /* 기본 리스트 스타일 제거 */
	padding: 0;
	margin-bottom: 20px; /* 각 검색 결과 항목 사이의 간격 */
	border: 1px solid #ddd; /* 경계선 */
	border-radius: 5px; /* 경계선 둥글게 */
	background-color: #f9f9f9; /* 배경색 */
}

li {
	padding: 10px 15px; /* 내용과 경계선 사이의 간격 */
	border-bottom: 1px solid #ddd; /* 항목 사이의 구분선 */
}

li:last-child {
	border-bottom: none; /* 마지막 항목의 구분선 제거 */
}

li a {
	color: #007bff; /* 링크 색상 */
	text-decoration: none; /* 밑줄 제거 */
}

li a:hover {
	text-decoration: underline; /* 마우스 오버 시 밑줄 표시 */
}

img {
	max-width: 100%; /* 이미지 최대 너비 설정 */
	height: auto; /* 이미지 높이 자동 조절 */
	display: block; /* 이미지 블록 레벨 요소로 표시 */
	margin: 0 auto 10px; /* 이미지 중앙 정렬 및 아래쪽 여백 */
}

/* 제목 스타일 */
li>.title {
	font-size: 18px; /* 폰트 크기 */
	font-weight: bold; /* 폰트 두께 */
	margin-bottom: 5px; /* 제목과 내용 사이의 간격 */
}

/* 저자, 출판사 등의 메타 정보 스타일 */
.meta-info {
	font-size: 14px; /* 폰트 크기 */
	color: #666; /* 폰트 색상 */
}

#pagination {
	margin-top: 20px;
	text-align: center;
}

.page-btn {
	margin: 0 5px;
	padding: 5px 10px;
	background-color: #f0f0f0;
	border: 1px solid #ddd;
	cursor: pointer;
}

.page-btn:hover {
	background-color: #e9e9e9;
}

.page-btn:focus {
	outline: none; /* 클릭 시 발생하는 외곽선 제거 */
	background-color: #ddd;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="search_test.js"></script>
<body>
	<div>
		<div>
			<form id="searchFrm">
				<input type="text" id="keyword" placeholder="검색어를 입력하세요." />
				<button type="button" id="searchBtn">검색 요청</button>
			</form>
		</div>
		<div id="searchResult">여기에 검색 결과가 출력됩니다.</div>
		<div id="pagination">
			<!-- 페이지네이션 버튼이 여기에 들어갑니다 -->
		</div>

	</div>
</body>
</html>