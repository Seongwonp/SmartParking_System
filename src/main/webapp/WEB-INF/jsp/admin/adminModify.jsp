<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>관리자 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <style>
        .container {
            margin-top: 170px; /* 헤더 높이와 맞춰 조절 */
            padding-left: 15px;
            padding-right: 15px;
        }
        body, html {
            height: 80%;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const form = document.querySelector("form");
            form.addEventListener("submit", (e) => {
                const pw = document.querySelector("input[name='password']").value;
                const pwConfirm = document.querySelector("input[name='passwordConfirm']").value;
                if (pw !== pwConfirm) {
                    alert("비밀번호가 일치하지 않습니다.");
                    e.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>

<div class="container">
    <h1>관리자 수정</h1>
    <h2>관리자 정보를 수정해주세요</h2>

    <!-- 에러 메시지 출력 -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger mt-3" role="alert">
                ${errorMessage}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin/modify" method="post">
        <input type="hidden" name="userId" value="${admin.userId}" />

        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
            <input type="email" name="userName" value="${admin.userName}" placeholder="아이디(이메일)" class="form-control" required />
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
            <input type="password" name="password" placeholder="새 비밀번호" class="form-control" />
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
            <input type="password" name="passwordConfirm" placeholder="새 비밀번호 확인" class="form-control" />
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
            <input type="text" name="name" value="${admin.name}" placeholder="이름" class="form-control" required />
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text"><i class="fa-solid fa-mobile-screen"></i></span>
            <input type="tel" name="phone" value="${admin.phone}" placeholder="휴대폰번호" class="form-control" required />
        </div>

        <button type="submit" class="btn btn-primary w-100">수정 완료</button>
        <a href="${pageContext.request.contextPath}/admin/List" class="btn btn-secondary w-100 mt-2">취소</a>
    </form>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>