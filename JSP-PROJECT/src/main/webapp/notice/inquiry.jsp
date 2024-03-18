<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
    <h1>코시웨 1:1 문의</h1>
    <!-- 1:1 문의 페이지로 이동하는 링크 필요하실지 모르겠어서 남겨둡니다 -->
    <a class="inquiry-link" href="/Inquiry/list.jsp">1:1 문의하기</a>

    <h2>1:1 문의 목록</h2>
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
            <tr>
                <td>1</td>
                <td>사용자1</td>
                <td>문의 제목1</td>
                <td>문의 내용1</td>
                <td>2024-03-18</td>
            </tr>
            <tr>
                <td>2</td>
                <td>사용자2</td>
                <td>문의 제목2</td>
                <td>문의 내용2</td>
                <td>2024-03-19</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
