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
    padding: 40px;
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

/* 페이지네이션 버튼 스타일 */
.page-btn1 {
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

/* 검색 결과 그리드 스타일 */
#searchResult {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4개의 컬럼으로 나눔 */
    gap: 20px; /* 그리드 아이템 간의 간격 */
    padding: 20px; /* 컨테이너의 내부 여백 */
}

/* 검색 결과 상세 스타일 */
#searchResult ul {
    margin: 0; /* 기존 마진 제거 */
    padding: 10px; /* 패딩 유지 */
    background-color: #ffffff;
    border: 1px solid #dddddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    overflow: hidden;
    transition: box-shadow 0.3s ease;
    display: flex; /* 이미지와 텍스트를 세로로 정렬 */
    flex-direction: column; /* 컨텐츠를 세로로 정렬 */
    align-items: center; /* 가운데 정렬 */
}

#searchResult ul:hover {
    box-shadow: 0 6px 12px rgba(0,0,0,0.15);
}

#searchResult img {
    width: 100%; /* 이미지 너비를 ul에 맞춤 */
    height: 50%; /* 이미지 비율 유지 */  
    max-width: 150px; /* 최대 너비 설정 */
    margin-bottom: 10px; /* 이미지와 텍스트 사이의 마진 */
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
<input type="hidden" value="${userid }">
	<form id="searchFrm">
		<div>
			<input type="text" name="search" id="keyword" placeholder="검색하실 책 제목을 입력하세요">
			<button type="button" id="searchBtn">검색</button>
			<c:choose>
				<c:when test="${userid != null && userid == "" }">
					<div>
						${userid }님 안녕하세요.
						<a href="${pageContext.request.contextPath}/login/LogOut.bo">로그아웃</a>
						<a>마이페이지</a>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<a href="${pageContext.request.contextPath}/login/Sign-up-in.bo">로그인하러 가기</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
	<form action="">
		<div class="row" id="searchResult">
	        
	    </div>
	</form>
    <div id="pagination">
			<!-- 페이지네이션 버튼이 여기에 들어갑니다 -->
	</div>
</body>
</html>