<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<style>
.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
}

.book-detail {
	margin-bottom: 20px;
}

.book-detail img {
	max-width: 200px;
	height: auto;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Book Details</h1>
		<form action="" method="post">
			<div class="book-detail">
				<img src="${bookdetails.image}" alt="${bookdetails.title} cover">
				<h2>${bookdetails.title}</h2>
				<p>
					<strong>저자:</strong> ${bookdetails.author}
				</p>
				<p>
					<strong>출판사:</strong> ${bookdetails.publisher}
				</p>
				<p>
					<strong>책 소개:</strong> ${bookdetails.description}
				</p>
				<p>
					<strong>가격:</strong> ${bookdetails.discount}
				</p>
				<p>
					<strong>출간일:</strong> <fmt:formatDate value="${bookdetails.pubdate}" pattern="yyyy-MM-dd" />
				</p>
			</div>
			<button type="button">장바구니 담기</button>
		</form>
	</div>
</body>
</html>
