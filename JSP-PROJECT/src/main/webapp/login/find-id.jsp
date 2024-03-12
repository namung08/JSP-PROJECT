<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        form h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        input[type="text"], input[type="email"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            background-color: #4CAF50;
        }

        button:hover {
            opacity: 0.9;
        }
    </style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="findid.js"></script>
<body>
<form class="form-horizontal" role="form" method="POST" action="${pageContext.request.contextPath}/login/FindId.bo">
	<h3 style="text-align: center;">아이디 찾기</h3>
    <div class="row">
        <div class="col-md-10 inputbb">
            <div class="form-group has-danger">
                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <input type="text" name="name" class="form-control" id="name" placeholder="이름" required autofocus>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 inputbb">
            <div class="form-group">
                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <input type="email" name="email" class="form-control" id="email" placeholder="이메일" required>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 inputbb">
            <button type="submit" class="btn btn-outline-secondary findbtn">찾기</button>
        </div>
    </div>
</form>
</body>

</html>