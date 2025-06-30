<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>관리자 추가</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        #page-wrapper {
            flex: 1;
            display: flex;
            flex-direction: row;
            height: calc(100vh - 106px);
            min-height: 0;
            overflow: hidden;
        }
        #sidebar {
            width: 250px;
            height: 100%;
            background-color: #212529;
            color: white;
            overflow-y: auto;
            flex-shrink: 0;
        }
        main.content {
            flex-grow: 1;
            overflow-y: auto;
            padding: 30px;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }
        .container {
            width: 100%;
            padding-top: 50px;
        }
        .input-group {
            margin-bottom: 1rem;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const form = document.querySelector("form");
            form?.addEventListener("submit", (e) => {
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

<div id="page-wrapper">
    <nav id="sidebar">
        <%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>
    </nav>

    <main class="content">
        <div class="container">
            <h1 class="mt-5">관리자 추가</h1>
            <h2 class="mt-3">관리자 정보를 입력해주세요</h2>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger mt-3" role="alert">
                        ${errorMessage}
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath}/admin/register" method="post">
                <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-envelope"></i></span>
                    <input type="email" name="userName" placeholder="아이디(이메일)" class="form-control" required />
                </div>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                    <input type="password" name="password" placeholder="비밀번호" class="form-control" required />
                </div>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
                    <input type="password" name="passwordConfirm" placeholder="비밀번호 확인" class="form-control" required />
                </div>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                    <input type="text" name="name" placeholder="이름" class="form-control" required />
                </div>
                <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-mobile-screen"></i></span>
                    <input type="tel" name="phone" placeholder="휴대폰번호" class="form-control" required />
                </div>
                <button type="submit" class="btn btn-success w-100">관리자 추가하기</button>
            </form>
        </div>
    </main>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>