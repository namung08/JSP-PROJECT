<!-- item: 배열 요소의 데이터 -->​​
<%-- 추가 완료 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 API</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="search.js"></script>
<style>
    ul{border:2px #cccccc solid;}
</style>
</head>
<body>
<div>
    <div>
        <form id="searchFrm">
            한 페이지에 10개씩 출력됨 <br />
            <select id="startNum">
                <option value="1">1페이지</option>
                <option value="11">2페이지</option>
                <option value="21">3페이지</option>
                <option value="31">4페이지</option>
                <option value="41">5페이지</option>
            </select>
            <input type="text" id="keyword" placeholder="검색어를 입력하세요." />
            <button type="button" id="searchBtn">검색 요청</button>
        </form>
    </div>
    <div class="row" id="searchResult">
        여기에 검색 결과가 출력됩니다.
    </div>
</div>
</body>
</html>
