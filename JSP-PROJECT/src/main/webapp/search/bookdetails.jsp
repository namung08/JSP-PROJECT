<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bookdetails.title}</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
.nanum-gothic-regular {
	font-family: "Nanum Gothic", sans-serif;
	font-weight: 400;
	font-style: normal;
}

/* 기본 스타일 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background: #f4f4f4;
}

.container {
	width: 80%;
	margin: 20px auto;
	background: white;
	padding: 20px;
}
/* 이미지, 제목, 상세정보 컨테이너 스타일 */
.book-detail {
	display: flex;
	margin-bottom: 20px;
}

.book-cover img {
	max-width: 100%;
	height: auto;
}

.topColLeft, .topColRight {
	flex: 1;
}

.topColLeft {
	margin-right: 20px;
}

.topColRight {
	display: flex;
	flex-direction: column;
}

.bk_infoTop {
	height: 20%;
}

.book-info {
	flex-grow: 1;
	height: 100%;
}

.book-info, .button {
	padding: 10px 0;
}

.book-info th {
	width: 30%;
}

.book-info td {
	width: 70%;
}

.book-info table {
	width: 100%;
	height: inherit;
}

.button {
	text-align: right;
	/* position: sticky; */
	top: 100%;
	height: 8%
}
/* 버튼 스타일 */
button {
	padding: 10px 20px;
	margin-right: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button-primary {
	background-color: #4285f4;
	color: white;
}
/* 탭 및 내용 스타일 */
.tab-content ul {
	list-style: none;
	padding: 0;
	display: inline-flex;
	justify-content: space-between;
	border-bottom: 2px solid #ddd;
	margin-bottom: 20px;
}

.tab-content ul li {
	padding: 10px;
}

.tab-content ul li a {
	text-decoration: none;
	color: #4285f4;
	font-weight: bold;
}

.botCol1, .botCol2 {
	padding: 10px 0;
}

.boder {
	border: 1px solid black;
}
/* 반응형 디자인 */
@media ( max-width : 768px) {
	.book-detail {
		flex-direction: column;
	}
}
/* 리뷰 테이블 스타일 */
.botCol2 table {
    width: 100%; /* 테이블 너비를 부모 컨테이너에 맞춤 */
    border-collapse: collapse; /* 셀 사이의 경계를 합침 */
    margin-bottom: 20px; /* 테이블 사이의 마진 추가 */
}

.botCol2 th, .botCol2 td {
    border: 1px solid #ddd; /* 경계선 스타일 */
    padding: 8px; /* 셀 내부 패딩 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

.botCol2 th {
    background-color: #f2f2f2; /* 헤더 배경색 */
    color: #333; /* 헤더 텍스트 색상 */
}

.botCol2 td {
    background-color: #fff; /* 셀 배경색 */
    color: #666; /* 셀 텍스트 색상 */
}

.botCol2 td > table {
    margin: 10px 0; /* 내부 테이블 상하 마진 */
    width: auto; /* 내부 테이블 너비를 내용에 맞춤 */
}

.botCol2 td > table th,
.botCol2 td > table td {
    padding: 4px; /* 내부 테이블 셀 패딩 */
    border: 1px solid #eee; /* 내부 테이블 경계선 스타일 */
    background-color: #fafafa; /* 내부 테이블 배경색 */
}

/* 리뷰 텍스트 스타일 */
.botCol2 td .review-text {
    display: block; /* 블록 레벨 요소로 만들기 */
    padding: 10px;
    margin-top: 10px; /* 리뷰와 테이블 사이 마진 */
    background-color: #e9e9e9; /* 리뷰 배경색 */
    border: 1px solid #dcdcdc; /* 리뷰 경계선 스타일 */
    border-radius: 4px; /* 경계선 둥글게 */
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="bookdetail.js"></script>
</head>
<body>
	<div class="container">
		<div class="book-detail">
			<div class="topColLeft book-cover">
				<img name="bookCover" id="bookCover" src="${bookdetails.image}"
					alt="${bookdetails.title} cover">
			</div>
			<div class="topColRight">
				<div class="bk_infoTop">
					<h2 class="booktitle" id="bookTitle">${bookdetails.title}</h2>
				</div>
				<div class="book-info">
					<table>
						<tr>
							<th align="left">가격</th>
							<td align="center">${bookdetails.discount}</td>
						</tr>
						<tr>
							<th align="left">저자</th>
							<td align="center">${bookdetails.author}</td>
						</tr>
						<tr>
							<th align="left">출판사</th>
							<td align="center">${bookdetails.publisher}</td>
						</tr>
						<tr>
							<th align="left">출간일</th>
							<td align="center"><fmt:formatDate
									value="${bookdetails.pubdate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</table>
				</div>
				<div class="button">
					<button type="button" class="button-primary">장바구니 담기</button>
					<button type="button" class="button-primary">구매하기</button>
				</div>
			</div>

		</div>
		<div class="tab-content">
			<ul>
				<li><a href="#botCol1">도서 정보</a></li>
				<li><a href="#botCol2">리뷰</a></li>
			</ul>
		</div>
		<!-- 상품정보 -->
		<div class="boder">
			<div class="botCol1" id="botCol1">
				<h3>${bookdetails.title}의소개</h3>
				<div id="infoWrap_txtInner" class="infoWrap_txtInner">
					<textarea class="txtContentText" id="txtContentText">${bookdetails.description}</textarea>
					<!-- JavaScript를 통해 내용을 동적으로 추가할 예정 -->
				</div>
			</div>
			<!-- 리뷰 -->
			<hr>
			<div class="botCol2" id="botCol2">
				<table>
					<tr>
						<th>userid</th>
						<td>
							<table>
								<tr>
									<th>날짜</th>
									<td>평점</td>
								</tr>
							</table>
							리뷰
						</td>
					</tr>
					<tr>
						<th>userid</th>
						<td>
							<table>
								<tr>
									<th>날짜</th>
									<td>평점</td>
								</tr>
							</table>
							리뷰
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
