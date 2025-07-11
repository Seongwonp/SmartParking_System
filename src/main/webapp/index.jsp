<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <title>스마트파킹</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div class="video-container">
    <video autoplay muted loop playsinline>
        <source src="${pageContext.request.contextPath}/resources/videos/main_intro.mp4" type="video/mp4">
        브라우저가 video 태그를 지원하지 않습니다.
    </video>
</div>

<div class="container mt-5 mb-5 pt-5 text-center"
     data-aos="fade-up"
     data-aos-duration="1000"
     data-aos-delay="200" >
    <h1 class="mb-4">SmartParking 반월당점에 오신 것을 환영합니다!</h1>
    <p>실시간 주차 현황 확인, 차량 검색, 요금 조회 등의 서비스를 이용해 보세요.</p>

    <a href="/login" class="btn btn-primary mt-4">로그인</a>
    <a href="/user/signup" class="btn btn-outline-secondary mt-4 ms-3">회원가입</a>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
