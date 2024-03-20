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
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            color: #333333;
        }

        a:visited {
            color: #555555;
            text-decoration: none;
        }

        a:hover {
            color: #000000;
            text-decoration: none;
            font-weight: bold;
        }

        a:link {
            color: #555555;
            text-decoration: none;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        td {
            padding: 10px;
            border: 1px solid #dddddd;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #dddddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        button {
            background-color: #555555;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        button:hover {
            background-color: #000000;
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
</body>
</html>
