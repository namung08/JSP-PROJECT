<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="header-flex">
			<div class="header-left">
				<h2>
					<a href="${pageContext.request.contextPath}/main/main-page.bo">K.S.W.</a>
				</h2>
			</div>
		</div>
	</header>
	${userid } <br>
	${notificationTitle } <br>
	${notificationDetails } <br>
	${createdAt } <br>
</body>
</html>