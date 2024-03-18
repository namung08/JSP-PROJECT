<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의</title>
    <style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
	padding: 20px;
}

h1 {
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ddd;
}

th {
	background-color: rgb(36, 39, 39);
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

.inquiry-link {
	display: block;
	margin-bottom: 10px;
	background-color: rgb(36, 39, 39);
	color: white;
	text-decoration: none;
	padding: 10px;
	width: 200px;
	text-align: center;
	font-weight: bold;
	border-radius: 5px;
}

.inquiry-link:hover {
	background-color: gray;
}

a {
	display: block;
	margin-bottom: 10px;
	background-color: rgb(36, 39, 39);
	color: white;
	text-decoration: none;
	padding: 10px;
	width: 200px;
	text-align: center;
	font-weight: bold;
	border-radius: 5px;
}

a:hover {
	background-color: gray;
}
/* 페이징 처리 테이블에 적용될 CSS */
.pagination-table {
    border: 0px;
    width: 900px;
}
</style>
</head>
<body>
	<a align="right" valign="middle" href="${pageContext.request.contextPath}/notice/notice-main.bo">고객센터로 돌아가기</a>
	<h1>코시웨 1:1 문의</h1>
    <!-- 1:1 문의 페이지로 이동하는 링크 필요하실지 모르겠어서 남겨둡니다 -->
    <a class="inquiry-link" href="/Inquiry/list.jsp">1:1 문의하기</a>

    <h2>${username }(${userid })님의 1:1 문의 목록</h2>
    <p align="right">총 문의 개수 ${totalCnt}</p>
    <table>
        <thead>
        <!-- 테이블 예시 -->
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
			<c:choose>
				<c:when test="${inquiryList != null and fn:length(inquiryList) > 0 }">
					<c:forEach var="inquiry" items="${inquiryList }">
						<tr>
							<td>${inquiry.qnaNum }</td>
							<td>${inquiry.userId}</td>
							<td>${inquiry.qnatitle }</td>
							<td>${inquiry.qnaDetails }</td>
							<td>${inquiry.created_at }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr style="height: 50px;">
						<td colspan="7" style="text-align: center">문의 내역이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
    </table>
    <!-- 페이징 처리 -->
	<table class="pagination-table">
		<tr align="center" valign="middle">
			<td>
				<c:if test="${nowPage > 1 }">
					<a href="${pageContext.request.contextPath }/notice/inquiry.bo?page=${nowPage -1}">[&lt;]</a>
				</c:if> 
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:choose>
						<c:when test="${i == nowPage }">[${i }]</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath }/notice/inquiry.bo?page=${i}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> 
				<c:if test="${nowPage < totalPage }">
					<a href="${pageContext.request.contextPath }/notice/inquiry.bo?page=${nowPage + 1}">[&gt;]</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>
