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
<style>
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
    .book-info, .button {
        padding: 10px 0;
    }
    .book-info table {
        width: 100%;
    }
    .button {
        text-align: right;
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
        display: flex;
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
    /* 반응형 디자인 */
    @media (max-width: 768px) {
        .book-detail {
            flex-direction: column;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="book-detail">
            <div class="topColLeft book-cover">
                <img name="bookCover" id="bookCover" src="${bookdetails.image}" alt="${bookdetails.title} cover">
            </div>
            <div class="topColRight">
                <div class="bk_infoTop">
                    <h2 class="booktitle" id="bookTitle">${bookdetails.title}</h2>
                </div>
                <div class="book-info">
                    <div class="bk_price">
                        <table>
                            <tr>
                                <th>가격</th>
                                <td>${bookdetails.discount}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="bk_author">
                        <table>
                            <tr>
                                <th>저자</th>
                                <td>${bookdetails.author}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="bk_publisher">
                        <table>
                            <tr>
                                <th>출판사</th>
                                <td>${bookdetails.publisher}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="bk_pubDate">
                        <table>
                            <tr>
                                <th>출간일</th>
                                <td><fmt:formatDate value="${bookdetails.pubdate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="button">
                    <button type="button" class="button-primary">장바구니 담기</button>
                    <button type="button" class="button-primary">구매하기</button>
                </div>
            </div>  
        </div>
        <div class="tab-content">
            <ul>
                <li><a>도서 정보</a></li>
                <li><a>리뷰</a></li>
            </ul>
        </div>
        <!-- 상품정보 -->
        <div class="botCol1">
            <h4>${bookdetails.title}의 소개</h4>
            <div class="infoWrap_txtInner">
                <textarea class="txtContentText">${bookdetails.description}</textarea>
                <!-- JavaScript를 통해 내용을 동적으로 추가할 예정 -->
            </div>
        </div>
        <!-- 리뷰 -->
        <div class="botCol2">
            <table>
                <tr>
                    <th>userid</th>
                    <td>reply</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
