<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>SmartParking 반월당점 소개</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
  <style>
    section {
      min-height: 600px;
      padding-top: 60px;
      padding-bottom: 60px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-content: center;
    }
    h1{
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div class="video-container" data-aos="fade-up" data-aos-delay="100">
  <video autoplay muted loop playsinline style="width: 100%; object-fit: contain;">
    <source src="${pageContext.request.contextPath}/resources/videos/main_intro.mp4" type="video/mp4">
    브라우저가 video 태그를 지원하지 않습니다.
  </video>
</div>

<div class="container mt-5 mb-5 pt-5 text-center"
     data-aos="fade-up"
     data-aos-delay="200"
     style="border-radius: 10px; padding: 40px 20px;">
  <h1 class="mb-4 display-4" style="color:#368bfa; font-weight: 700" >스마트파킹 반월당점에 오신 것을 환영합니다!</h1>
</div>

<section class="py-5" style="text-align: center;">
  <div class="container" data-aos="fade-up" data-aos-delay="200" style="max-width: 700px; margin: 0 auto; font-size: 1.15rem; line-height: 1.8;">
    <h1>환영합니다!</h1>
    <p>
      스마트파킹 반월당점은 최신 기술을 바탕으로 고객님의 주차 경험을 한층 더 편리하고 안전하게 만듭니다.<br>
      실시간으로 주차 공간을 확인하고 예약할 수 있어 번거로운 주차 걱정을 덜어드립니다.<br>
      자동 요금 계산과 간편한 결제 시스템으로 빠르고 정확한 서비스를 제공합니다.<br>
      또한 경차와 장애인 차량에 대한 할인 혜택과 24시간 보안 시스템으로 안전까지 책임집니다.<br>
      언제 어디서나 모바일 앱을 통해 주차 현황과 이용 내역을 쉽게 관리할 수 있습니다.<br><br>
      저희 스마트파킹은 항상 최선을 다해 고객님의 만족을 위해 노력하겠습니다.<br>
      방문해 주셔서 진심으로 감사드립니다.
    </p>
  </div>
</section>

<section class="py-5" style="text-align: center;">
  <div class="container" data-aos="fade-up" data-aos-delay="200">
    <h1>주요 서비스</h1>
    <ul class="list-unstyled fs-5 mt-4" style="max-width: 700px; margin: 0 auto; line-height: 1.8;">
      <li class="mb-3">✔️ 실시간 주차 공간 확인 및 예약 서비스로 편리함을 제공합니다.</li>
      <li class="mb-3">✔️ 자동 요금 계산과 간편 결제 시스템으로 빠른 입출차가 가능합니다.</li>
      <li class="mb-3">✔️ 경차 및 장애인 차량 할인 적용으로 다양한 고객을 배려합니다.</li>
      <li class="mb-3">✔️ 24시간 CCTV와 보안 시스템으로 안전한 주차 환경을 보장합니다.</li>
      <li class="mb-3">✔️ 모바일 앱과 연동된 서비스로 언제 어디서나 주차 정보를 확인할 수 있습니다.</li>
    </ul>
  </div>
</section>

<section class="py-5" style="text-align: center;">
  <div class="container" data-aos="fade-up" data-aos-delay="200">
    <h1>이용 방법</h1>
    <p style="max-width: 700px; margin: 0 auto; font-size: 1.1rem; line-height: 1.8;">
      입차 시 차량 번호를 등록하고, 출차 시 자동으로 요금이 계산됩니다.<br>
      마이페이지에서 주차 내역 및 월정액 관리가 가능합니다.<br>
      월정액 회원은 별도의 절차 없이도 무제한 출입이 가능하며, 정기적인 할인 혜택을 받으실 수 있습니다.<br>
      또한, 차량 정보는 안전하게 암호화되어 관리됩니다.
    </p>
  </div>
</section>

<section class="py-5" style="text-align: center;">
  <div class="container" data-aos="fade-up" data-aos-delay="200">
    <h1>고객 후기</h1>
    <blockquote class="blockquote" style="max-width: 700px; margin: 0 auto; font-size: 1.1rem; line-height: 1.8;">
      “스마트파킹 덕분에 주차 걱정이 사라졌어요! 빠르고 편리합니다.” — 홍길동 고객<br><br>
      “정기권 할인과 실시간 주차 현황 덕분에 항상 편리하게 이용하고 있습니다.” — 김민수 고객<br><br>
      “친절한 고객지원과 안전한 시설로 안심하고 주차할 수 있어 만족합니다.” — 이영희 고객
    </blockquote>
  </div>
</section>

<section class="py-5" style="text-align: center;">
  <div class="container" data-aos="fade-up" data-aos-delay="200">
    <h1>주요 기능</h1>
    <ul class="list-unstyled fs-5 mt-4" style="max-width: 700px; margin: 0 auto; line-height: 1.8;">
      <li class="mb-3"><i class="fa-solid fa-car me-2"></i>실시간 차량 검색 및 주차 공간 예약</li>
      <li class="mb-3"><i class="fa-solid fa-money-bill-wave me-2"></i>정확한 요금 조회 및 간편 결제 시스템</li>
      <li class="mb-3"><i class="fa-solid fa-location-dot me-2"></i>쉽고 빠른 오시는 길 안내 및 교통 정보 제공</li>
      <li class="mb-3"><i class="fa-solid fa-mobile-screen-button me-2"></i>모바일 웹 연동으로 언제 어디서나 편리한 관리</li>
    </ul>
  </div>
</section>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
