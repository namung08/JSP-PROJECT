<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
	<div>
		<table style="width: 900px; border: 1px;">
			<tr align="center" valign="middle">
				<td><h3>${username }(${userid })님의 구매내역</h3></td>
			</tr>
			<tr align="right" valign="middle">
				<a href="${pageContext.request.contextPath}/myPage/myPage.bo">마이페이지로 돌아가기</a>
			</tr>
			<tr align="right" valign="middle">
				<td>총 구매내역 : ${totalCnt} 개</td>
			</tr>
		</table>
		<table border="1" style="border-collapse: collapse; border-spacing: 0; width: 900px;">
			<tr align="center" valign="middle">
				<th width="30%">주문일</th>
				<th width="25%">책이름</th>
				<th width="15%">가격</th>
				<th width="15%">주문상태</th>
				<th width="7">수량</th>
			</tr>
			<!-- 게시글 작성 : 게시글이 있는경우 -->
			<c:choose>
				<c:when test="${OrderList != null and fn:length(OrderList) > 0 }">
					<c:forEach var="order" items="${OrderList }">
					<!--기준이 되는 날짜 준비-->
					<fmt:parseDate value="${order.orderDate}" var="orderDate" pattern="yyyy-MM-dd"/>
					<!-- 기준 날짜 변경 -->
					<fmt:formatDate value="${orderDate }" pattern="yyyy-MM-dd" var="OrderDate"/>
					<!--기준이 되는 날짜를 일수로 변경-->
					<fmt:parseNumber value="${orderDate.time / (1000*60*60*24)}" integerOnly="true" var="odate"></fmt:parseNumber>
					<!--현재 날짜 준비-->
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<fmt:formatDate var="nowD" value="${now}" pattern="yyyy-MM-dd hh:mm:ss" />
					<!--현재 날짜를 기준이 되는 날짜와 같은 포멧으로 변경-->
					<fmt:parseDate value="${nowD }" var="nowPlanDate" pattern="yyyy-MM-dd"/>
					<!--현재 날짜를 일수로 변경-->
					<fmt:parseNumber value="${nowPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="ndate"></fmt:parseNumber>
						<tr align="center" valign="middle"
							onmouseover="this.style.background='#bbdefb'"
							onmouseout="this.style.background=''" height="23px">
							<td class="orderdate" height="23px;">
								
								${OrderDate }
							</td>
							<td height="23px;">${order.title }</td>
							<td height="23px;">${order.discount }</td>
							<td class="deliverystatus" height="23px;">
								
								<c:if test="${odate == ndate }">배송 준비중</c:if>
								<c:if test="${odate < ndate+3 and odate>ndate}">배송 중</c:if>
								<c:if test="${odate >= ndate+3 }">배송 완료</c:if>
							</td>
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
						<a href="${pageContext.request.contextPath }/myPage/OrderList.bo?page=${nowPage -1}">[&lt;]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${i == nowPage }">[${i }]</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/myPage/OrderList.bo?page=${i}">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${nowPage < totalPage }">
						<a href="${pageContext.request.contextPath }/myPage/OrderList.bo?page=${nowPage + 1}">[&gt;]</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>