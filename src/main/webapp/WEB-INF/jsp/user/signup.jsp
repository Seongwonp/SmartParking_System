<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        h1 {
            text-align: center;
            margin-bottom: 20px;
            padding: 20px;
        }

        body {
            font-family: "Noto Sans KR", sans-serif;
            background: #fff;
            padding: 30px;
        }

        .container_signUp {
            width: 420px;
            margin: 60px auto 100px;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            background-color: #fafafa;
        }

        h2 {
            font-size: 14px;
            margin-bottom: 18px;
            font-weight: bold;
            color: #333;
        }

        .icon {
            font-size: 12px;
            width: 60px;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        input {
            font-size: 12px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .input-group {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 5px;
            background-color: white;
        }

        .input-group .icon {
            font-size: 18px;
            color: #888;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 25px;
        }

        input {
            flex: 1;
            height: 100%;
            border: none;
            padding: 0 10px;
            font-size: 14px;
        }

        input::placeholder {
            color: #bbb;
        }

        input:focus {
            outline: none;
            background: #fffdf7;
        }

        .agreement-container {
            width: 360px;
            margin: 0 auto;
            align-items: center;
        }

        .check-all {
            display: block;
            font-size: 13px;
            margin-bottom: 10px;
        }

        .subtext {
            font-size: 10px;
            color: #666;
            margin-bottom: 20px;
        }

        .agreement-box {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 18px;
            background-color: #fff;
            margin-bottom: 20px;
            font-size: 13px;
        }

        .agreement-box label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="checkbox"] {
            margin-right: 8px;
        }

        .submit-btn {
            width: 100%;
            align-items: center;
            padding: 12px;
            background-color: #28a745;
            color: white;
            font-size: 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div class="container_signUp">
    <h1>회원가입</h1>
    <h2>회원정보를 입력해주세요</h2>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger mt-3" role="alert">
                ${errorMessage}
        </div>
    </c:if>
    <form action="/user/signup" method="post">
        <div class="input-group">
            <i class="fa-solid fa-envelope icon"></i>
            <input type="email" name="userName" placeholder="아이디(이메일)">
        </div>
        <div class="input-group">
            <i class="fa-solid fa-lock icon"></i>
            <input type="password" name="password" placeholder="비밀번호">
        </div>
        <div class="input-group">
            <i class="fa-solid fa-lock icon"></i>
            <input type="password" name="passwordConfirm" placeholder="비밀번호 확인">
        </div>
        <div class="input-group">
            <i class="fa-solid fa-user icon"></i>
            <input type="text" name="name" placeholder="이름">
        </div>
        <div class="input-group">
            <i class="fa-solid fa-mobile-screen icon"></i>
            <input type="tel" name="phone" placeholder="휴대폰번호">
        </div>
        <hr>
        <div class="agreement-container">
            <label class="check-all">
                <input type="checkbox" id="all-agree"> <strong>모두 확인하였으며 동의합니다.</strong>
            </label>
            <p class="subtext">
                전체 동의에는 필수 및 선택 정보에 대한 동의가 포함되어 있으며, 선택 항목에 대한 동의를 거부하시는 경우에도 서비스 이용이 가능합니다.
            </p>

            <div class="agreement-box">
                <label><input type="checkbox" class="agree"> [필수] 만 14세 이상입니다</label>
                <label><input type="checkbox" class="agree"> [필수] 이용약관 동의</label>
                <label><input type="checkbox" class="agree"> [선택] 마케팅 정보 수신 동의</label>
            </div>

            <button type="submit" class="submit-btn">동의하고 가입하기</button>
        </div>
    </form>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
<script>
    document.getElementById("all-agree").addEventListener("change", function () {
        const isChecked = this.checked;
        const checkboxes = document.querySelectorAll(".agreement-box .agree");
        checkboxes.forEach(function (checkbox) {
            checkbox.checked = isChecked;
        });

        const form = document.querySelector("form");
        form.addEventListener("submit", (e) => {
            const password = document.querySelector("input[name='password']").value;
            const passwordConfirm = document.querySelector("input[name='passwordConfirm']").value;
            if (password !== passwordConfirm) {
                alert("비밀번호가 일치하지 않습니다.");
                e.preventDefault(); // 제출 막기
            }
        });
    });
</script>
