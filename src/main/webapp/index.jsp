<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/jsp/include/header.jsp" %>
<!-- 광고 영상 섹션 (필요 시 추가) -->
<div class="video-container position-relative">
    <video autoplay muted loop class="w-100">
        <source src="./resources/videos/intro.mp4" type="video/mp4">
        브라우저가 video 태그를 지원하지 않습니다.
    </video>
    <div id="intro-text" class="position-absolute top-50 start-50 translate-middle px-3 py-2 text-center" style="background-color: rgba(0, 0, 0, 0); border-radius: 10px;">
        <h1 id="intro-title" style="color: #fff; margin-bottom: 0.5rem; opacity: 0; transition: opacity 1s;">주차가 더 스마트해지는 세상</h1>
        <p id="intro-subtitle" style="color: #ddd; margin: 0; opacity: 0; transition: opacity 1s;">스마트파킹 시스템과 함께 편리하고 안전한 주차 환경을 경험해보세요.</p>
    </div>
</div>
<script>
    window.addEventListener('DOMContentLoaded', () => {
        const title = document.getElementById('intro-title');
        const subtitle = document.getElementById('intro-subtitle');

        setTimeout(() => {
            title.style.opacity = '1';
        }, 300);

        setTimeout(() => {
            subtitle.style.opacity = '1';
        }, 1300);
    });
</script>
<!-- Bootstrap JS + Popper.js (Bootstrap 5용) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<%@ include file="/jsp/include/footer.jsp" %>
