<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<style>
a:visited {
	color: #ce93d8;
	text-decoration: none;
}

a:hover {
	color: #ce93d8;
	text-decoration: none;
	font-weight: bold;
}

a:link {
	color: #ce93d8;
	text-decoration: none;
}

table {
	margin: 0 auto;
}
</style>
<body>
	<div>
		<table style="width: 900px; border: 1px;">
			<tr align="center" valign="middle">
				<td><h3>${username }(${userid })님의 구매내역</h3></td>
			</tr>
			<tr align="right" valign="middle">
				<td>총 구매내역 : ${totalCnt} 개</td>
			</tr>
		</table>
		<table border="1"
			style="border-collapse: collapse; border-spacing: 0; width: 900px;">
			<tr align="center" valign="middle">
				<th width="8%">번호</th>
				<th width="30%">이미지</th>
				<th width="15%">책이름</th>
				<th width="15%">가격</th>
				<th width="15%">배송상태</th>
				<th width="10%">ISBN</th>
				<th width="7">수량</th>
			</tr>
			<!-- 게시글 작성 : 게시글이 있는경우 -->
			<c:choose>
				<c:when test="${OrderList != null and fn:length(OrderList) > 0 }">
					<c:forEach var="order" items="${OrderList }">
						<tr align="center" valign="middle"
							onmouseover="this.style.background='#bbdefb'"
							onmouseout="this.style.background=''" height="23px">
							<td height="23px;">${order.orderNum }</td>
							<td height="23px;">${order.image }</td>
							<td height="23px;">${order.title }</td>
							<td height="23px;">${order.discount }</td>
							<td height="23px;">${order.deliveryStatus }</td>
							<td height="23px;">${order.isbn }</td>
							<td height="23px;">${order.count }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr style="height: 50px;">
		               <td colspan="7" style="text-align: center">
		                  구매 내역이 없습니다.
		               </td>
		            </tr>
				</c:otherwise>
			</c:choose>
		</table>
		<br>
		<!-- 페이징 처리 -->
		<table style="border: 0px; width: 900px;">
			<tr align="center" valign="middle" >
				<td>
					<c:if test="${nowPage > 1 }">
						<a href="${pageContext.request.contextPath }/myPage/OrderList.od?page=${nowPage -1}">[&lt;]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${i == nowPage }">[${i }]</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/myPage/OrderList.od?page=${i}">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${nowPage < totalPage }">
						<a href="${pageContext.request.contextPath }/myPage/OrderList.od?page=${nowPage + 1}">[&gt;]</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>