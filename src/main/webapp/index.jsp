<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/jsp/include/header.jsp" %>
<!-- 광고 영상 섹션 (필요 시 추가) -->
<div class="video-container position-relative">
    <video autoplay muted loop class="w-100">
        <source src="./resources/videos/intro.mp4" type="video/mp4">
        브라우저가 video 태그를 지원하지 않습니다.
    </video>
    <div id="intro-text" class="position-absolute top-50 start-50 translate-middle px-3 py-2 text-center" style="background-color: rgba(0, 0, 0, 0); border-radius: 10px;">
      <h1 id="intro-title" data-aos="fade-up" data-aos-duration="1000" style="color: #fff; margin-bottom: 0.5rem;">
        주차가 더 스마트해지는 세상
      </h1>
      <p id="intro-subtitle" data-aos="fade-up" data-aos-delay="1000" data-aos-duration="1000" style="color: #ddd; margin: 0;">
        스마트파킹 시스템과 함께 편리하고 안전한 주차 환경을 경험해보세요.
      </p>
    </div>
</div>
<!-- AOS 를 사용해서 애니메이션 효과 지정 -->
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>AOS.init();</script>
<!-- Bootstrap JS + Popper.js (Bootstrap 5용) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<%@ include file="/jsp/include/footer.jsp" %>
