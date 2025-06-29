<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>인증 필요 (401)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
</head>
<body class="bg-info bg-opacity-25 d-flex flex-column justify-content-center align-items-center vh-100">
<div class="text-center">
    <i class="fas fa-user-lock fa-9x text-info mb-4"></i>
    <h1 class="display-1 text-info">401</h1>
    <p class="fs-3">인증이 필요합니다. 로그인 후 다시 시도해 주세요.</p>
    <a href="${pageContext.request.contextPath}/login" class="btn btn-info btn-lg mt-3">
        <i class="fas fa-sign-in-alt me-2"></i>로그인 페이지로 이동
    </a>
</div>
</body>
</html>