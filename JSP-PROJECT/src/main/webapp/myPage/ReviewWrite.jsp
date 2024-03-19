<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문내역</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</head>
<body>
    <div id="review">
        <form id="reviewForm" action="${pageContext.request.contextPath}/myPage/WriteReviewAction.bo" method="post">
            <table>
                <tr>
                    <td>제목:</td>
                    <td><input type="text" id="reviewTitle" name="reviewTitle"></td>
                </tr>
                <tr>
                    <td>별점:</td>
                    <td>
                        <select id="rating" name="rating">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>내용:</td>
                    <td><textarea id="reviewContent" name="reviewContent" rows="4" cols="50"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">작성 완료</button>
                        <button type="button" onclick="closeReviewForm()">취소</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <button type="button" onclick="showReviewForm()">리뷰 작성</button>

    <script>
        // 리뷰 작성 양식을 보여주는 함수
        function showReviewForm() {
            document.getElementById("review").style.display = "block";
        }

        // 리뷰 작성 양식을 숨기는 함수
        function closeReviewForm() {
            document.getElementById("review").style.display = "none";
        }
    </script>
</body>
</html>