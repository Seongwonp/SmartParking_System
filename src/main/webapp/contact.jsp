<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <title>고객센터</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<div class="container" style="margin: 150px auto 100px; max-width: 650px;">
  <img src="/resources/img/contact.gif" class="img-fluid" style="max-width: 300px; height: auto; display: block; margin: 0 auto;" />
  <h2 class="mb-4 text-center" data-aos="fade-up">무엇을 도와드릴까요?</h2>

  <div class="input-group input-group-lg mb-4" data-aos="fade-up" data-aos-delay="100">
    <a href="/faq.jsp" class="form-control text-start text-muted" style="text-decoration: none; cursor: pointer;">
      <i class="fas fa-search me-2 text-secondary"></i> 궁금한 점을 입력해 주세요
    </a>
  </div>
  <div class="list-group" data-aos="fade-up" data-aos-delay="200">
    <a href="/faq.jsp#payment" class="list-group-item list-group-item-action">
      <i class="fas fa-credit-card me-2"></i> 결제 관련 문의
    </a>
    <a href="/faq.jsp#account" class="list-group-item list-group-item-action">
      <i class="fas fa-user me-2"></i> 계정 관련 문제
    </a>
    <a href="/faq.jsp#membership" class="list-group-item list-group-item-action">
      <i class="fas fa-ticket-alt me-2"></i> 정기권 이용 방법
    </a>
    <a href="/contact.jsp" class="list-group-item list-group-item-action">
      <i class="fas fa-envelope-open-text me-2"></i> 기타 문의하기
    </a>
  </div>
</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
