<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Insert title here</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        .signup-container {
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .form-group:not(:last-child) {
        margin-bottom: 15px;
    }
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <div class="signup-container">
        <h2 class="text-center">회원가입</h2>
        <form action="/signin" method="post" onsubmit="return signinconfirm()">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" class="form-control" id="id" name="id"  required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"  required>
            </div>
            <button type="submit" class="btn btn-primary btn-block mx-auto" style="display: block; margin-top: 20px;">회원가입</button>
        </form>
    </div>

    <script>
        function signinconfirm(){
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if(password !== confirmPassword){
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            } else {
            	alert('회원가입이 완료되었습니다.');
                return true;
            }
        }

    </script>

</body>
</html>