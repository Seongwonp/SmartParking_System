<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>할인 정책 추가</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
  <style>
    .container {
      margin-top: 150px; /* 헤더 높이와 맞춰 조절 */
      padding-left: 15px;
      padding-right: 15px;
      margin-bottom: 60px;
      max-width: 600px;
    }
  </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>

<div class="container">
  <h2>할인 정책 추가</h2>

  <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
  </c:if>

  <form action="${pageContext.request.contextPath}/admin/discountPolicy/register" method="post">
    <div class="mb-3">
      <label for="type" class="form-label">할인 종류 (Type)</label>
      <input type="text" class="form-control" id="type" name="type" placeholder="할인 종류 입력" required />
    </div>

    <div class="mb-3">
      <label for="description" class="form-label">설명</label>
      <textarea class="form-control" id="description" name="description" rows="4" placeholder="설명 입력" required></textarea>
    </div>

    <div class="mb-3">
      <label for="rate" class="form-label">할인율 (%)</label>
      <input type="number" class="form-control" id="rate" name="rate" min="0" max="100" placeholder="0~100 입력" required />
    </div>

    <button type="submit" class="btn btn-primary">추가하기</button>
    <a href="${pageContext.request.contextPath}/admin/discountPolicy/list" class="btn btn-secondary ms-2">취소</a>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>