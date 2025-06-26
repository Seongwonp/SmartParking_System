<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스마트파킹</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<div class="position-relative" style="height: 600px; min-height: 600px; overflow: hidden;">
    <video autoplay muted loop class="w-100 h-100" style="object-fit: cover;">
        <source src="${pageContext.request.contextPath}/resources/videos/intro.mp4" type="video/mp4">
        브라우저가 video 태그를 지원하지 않습니다.
    </video>

    <div id="intro-text" class="position-absolute top-50 start-50 translate-middle px-3 py-2 text-center"
         style="background-color: rgba(0, 0, 0, 0); border-radius: 10px;">
        <h1 id="intro-title" data-aos="fade-up" data-aos-duration="1000" style="color: #fff; margin-bottom: 0.5rem;">
            주차가 더 스마트해지는 세상
        </h1>
        <p id="intro-subtitle" data-aos="fade-up" data-aos-delay="1000" data-aos-duration="1000"
           style="color: #ddd; margin: 0;">
            스마트파킹 시스템과 함께 편리하고 안전한 주차 환경을 경험해보세요.
        </p>
    </div>
</div>
<div class="container mt-5 mb-5 pt-5 text-center"
     data-aos="fade-up"
     data-aos-duration="1000"
     data-aos-delay="200">
    <h1 class="mb-4">SmartParking 반월당점에 오신 것을 환영합니다!</h1>
    <p>실시간 주차 현황 확인, 차량 검색, 요금 조회 등의 서비스를 이용해 보세요.</p>

    <a href="/jsp/user/login.jsp" class="btn btn-primary mt-4">로그인</a>
    <a href="/jsp/user/signup.jsp" class="btn btn-outline-secondary mt-4 ms-3">회원가입</a>
</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>