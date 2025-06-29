<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>잘못된 요청 (400)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
</head>
<body class="bg-warning bg-opacity-25 d-flex flex-column justify-content-center align-items-center vh-100">
<div class="text-center">
    <i class="fas fa-exclamation-circle fa-9x text-warning mb-4"></i>
    <h1 class="display-1 text-warning">400</h1>
    <p class="fs-3">잘못된 요청입니다.</p>
    <a href="${pageContext.request.contextPath}/" class="btn btn-warning btn-lg mt-3">
        <i class="fas fa-home me-2"></i>홈으로 돌아가기
    </a>
</div>

</body>
</html>