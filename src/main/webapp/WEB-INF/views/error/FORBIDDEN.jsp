<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>접근 불가능 (401)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
</head>
<body class="bg-danger bg-opacity-25 d-flex flex-column justify-content-center align-items-center vh-100">
<div class="text-center">
    <i class="fas fa-user-lock fa-9x text-danger mb-4"></i>
    <h1 class="display-1 text-danger">401</h1>
    <p class="fs-3">
        이 페이지는 관리자만 접근할 수 있습니다.<br>
        권한이 없는 사용자는 접근할 수 없습니다.<br>
        관리자에게 문의해 주세요.
    </p>
    <a href="${pageContext.request.contextPath}/" class="btn btn-danger btn-lg mt-3">
        <i class="fas fa-home me-2"></i>홈으로 돌아가기
    </a>
</div>
</body>
</html>