<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <style>
        h1 {
            text-align: center;
            padding-bottom: 20px;
        }

        body {
            font-family: "Noto Sans KR", sans-serif;
            background: #fff;
            padding: 30px;
        }

        .container {
            width: 420px;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            background-color: #fafafa;
            margin: 150px auto 80px;
        }

        .input-group {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
            background-color: white;
        }

        .input-group .icon {
            font-size: 18px;
            color: #888;
            width: 30px;
            height: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        input {
            flex: 1;
            height: 100%;
            border: none;
            padding: 0 10px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            background: #fffdf7;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-size: 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-btn:hover {
            background-color: #0069d9;
        }

        .helper-text {
            font-size: 13px;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<%@include file="/jsp/include/header.jsp"%>
<div class="container">
    <h1>로그인</h1>
    <form action="login_process.jsp" method="post">
        <div class="input-group">
            <i class="fa-solid fa-envelope icon"></i>
            <input type="email" name="id" placeholder="아이디(이메일)" required>
        </div>
        <div class="input-group">
            <i class="fa-solid fa-lock icon"></i>
            <input type="password" name="pw" placeholder="비밀번호" required>
        </div>
        <button type="submit" class="login-btn">로그인</button>
    </form>
    <div class="helper-text">
        계정이 없으신가요? <a href="join.jsp">회원가입</a>
    </div>
</div>
<%@include file="/jsp/include/footer.jsp"%>
</body>
</html>
