<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/jsp/include/header.jsp" %>
<!-- 광고 영상 섹션 (필요 시 추가) -->
<div class="video-container">
    <video autoplay muted loop class="w-100">
        <source src="./resources/videos/intro.mp4" type="video/mp4">
        브라우저가 video 태그를 지원하지 않습니다.
    </video>
</div>
<!-- Bootstrap JS + Popper.js (Bootstrap 5용) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<%@ include file="/jsp/include/footer.jsp" %>
