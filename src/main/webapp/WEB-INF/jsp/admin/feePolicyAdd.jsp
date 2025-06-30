<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8"/>
  <title>요금정책 등록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
  <style>
    .container {
      margin-top: 150px; /* 헤더 높이와 맞춰 조절 */
      padding-left: 15px;
      padding-right: 15px;
      margin-bottom: 60px;
    }
  </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>

<div class="container">
  <h2>요금정책 등록</h2>

  <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
  </c:if>

  <form action="${pageContext.request.contextPath}/admin/feePolicy/add" method="post">
    <div class="mb-3">
      <label for="policyName" class="form-label">정책명</label>
      <input type="text" class="form-control" id="policyName" name="policyName"
             value="${param.policyName}" required/>
    </div>

    <div class="mb-3">
      <label for="baseTime" class="form-label">기본시간 (분)</label>
      <input type="number" class="form-control" id="baseTime" name="baseTime"
             value="${param.baseTime}" min="0" required/>
    </div>

    <div class="mb-3">
      <label for="baseFee" class="form-label">기본요금 (원)</label>
      <input type="number" class="form-control" id="baseFee" name="baseFee"
             value="${param.baseFee}" min="0" required/>
    </div>

    <div class="mb-3">
      <label for="additionalTime" class="form-label">추가시간 (분)</label>
      <input type="number" class="form-control" id="additionalTime" name="additionalTime"
             value="${param.additionalTime}" min="0" required/>
    </div>

    <div class="mb-3">
      <label for="additionalFee" class="form-label">추가요금 (원)</label>
      <input type="number" class="form-control" id="additionalFee" name="additionalFee"
             value="${param.additionalFee}" min="0" required/>
    </div>

    <div class="mb-3">
      <label for="dailyMaxFee" class="form-label">일일최대요금 (원)</label>
      <input type="number" class="form-control" id="dailyMaxFee" name="dailyMaxFee"
             value="${param.dailyMaxFee}" min="0" required/>
    </div>

    <button type="submit" class="btn btn-primary">등록 완료</button>
    <a href="${pageContext.request.contextPath}/admin/feePolicy/list" class="btn btn-secondary">목록으로</a>
  </form>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>