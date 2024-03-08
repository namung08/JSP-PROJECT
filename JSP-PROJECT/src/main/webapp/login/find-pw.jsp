<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        /* 스타일은 여기에 작성합니다 */
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
    <script>
        function sendPasswordResetLink() {
            var name = document.getElementById('name').value;
            var id = document.getElementById('id').value;
            var email = document.getElementById('email').value;

            // 여기에 이메일 전송 로직을 추가하세요
            // 예시: Ajax를 사용하여 서버에 요청하여 이메일 전송 처리

            // 비밀번호 변경 페이지로 이동
            alert("이메일로 비밀번호 변경 페이지 링크가 전송되었습니다.");
            // window.location.href = "이메일로_보낸_비밀번호_변경_페이지_URL";
        }
    </script>
</head>
<body>
<form class="form-horizontal" role="form" method="POST" action="starters?cmd=findPasswordAction">
    <h3 style="text-align: center;">비밀번호 찾기</h3>
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
                    <input type="text" name="id" class="form-control" id="id" placeholder="아이디" required>
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
            <button type="button" class="btn btn-outline-secondary findbtn" onclick="sendPasswordResetLink()">찾기</button>
        </div>
    </div>
</form>
</body>
</html>