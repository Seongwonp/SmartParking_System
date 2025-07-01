<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>스마트파킹</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        .section-block {
            padding: 1.5rem;
        }
        .section-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 1.5rem;
        }
        .card-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1.5rem;
        }
        .info-card,
        .info-card2 {
            background: linear-gradient(135deg, #ffffff, #f8f9fa);
            border-radius: 0.75rem;
            padding: 1.5rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: 1px solid #dee2e6;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
            margin: 10px;
            position: relative;
            overflow: hidden;
        }
        .info-card::before,
        .info-card2::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(0, 123, 255, 0.1), transparent 60%);
            transform: rotate(25deg);
            transition: opacity 0.3s ease;
            opacity: 0;
        }
        .info-card:hover::before,
        .info-card2:hover::before {
            opacity: 1;
        }
        .info-card{
            flex : 1 1 20%;
        }
        .info-card2 {
            flex: 1 1 45%;
        }
        .info-card:hover,
        .info-card2:hover {
            transform: translateY(-8px);
            box-shadow: 0 16px 32px rgba(0, 0, 0, 0.15);
            background: linear-gradient(135deg, #e9f5ff, #ffffff);
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: 700;
            text-align: center;
            color: #0d6efd;
            margin-bottom: 0.75rem;
        }
        .card-value {
            font-size: 1.5rem;
            font-weight: bold;
            color: #343a40;
            text-align: center;
        }
        .card-container a {
            text-decoration: none;
            color: #212529;
            padding-bottom: 20px;
            transition: color 0.2s;
        }
        .card-container a:hover {
            text-decoration: none;
            color: #0d6efd;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<div class="position-relative" style="height: 500px; min-height: 500px; overflow: hidden;">
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
<div class="container mt-5 mb-5 pt-5 text-start"
     data-aos="fade-up"
     data-aos-duration="1000"
     data-aos-delay="200">
    <!-- 입출차 관리 -->
    <div class="section-block">
        <h1 class="section-title">입출차 관리</h1>
        <div class="card-container">
            <a href ="/user/parking/entryForm" class="info-card2">
                <h3 class="card-title">입차등록</h3>
            </a>
            <a href="/user/parking/exitForm" class="info-card2">
                <h3 class="card-title">출차등록</h3>
            </a>
        </div>
    </div>
    <!-- 입출차 현황 -->
    <div class="section-block">
        <h1 class="section-title">입출차 현황</h1>
        <div class="card-container">
            <div class="info-card">
                <h3 class="card-title">현재 주차가능공간</h3>
                <p class="card-value">5대</p>
            </div>
            <div class="info-card">
                <h3 class="card-title">현재 주차중</h3>
                <p class="card-value">5대</p>
            </div>
            <div class="info-card">
                <h3 class="card-title">전일 입차대수</h3>
                <p class="card-value">25대</p>
            </div>
            <div class="info-card">
                <h3 class="card-title">전일 출차대수</h3>
                <p class="card-value">18대</p>
            </div>
        </div>
    </div>
    <!-- 내 차량 정보 -->
    <div class="section-block">
        <h1 class="section-title">내 차량 정보</h1>
        <div class="card-container">
            <a href ="/user/myPageCarList" class="info-card2">
                <h3 class="card-title">등록차량목록</h3>
            </a>
            <a href="/user/myPageInOut" class="info-card2">
                <h3 class="card-title">최근 입출차 내역</h3>
            </a>
        </div>
    </div>
</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>