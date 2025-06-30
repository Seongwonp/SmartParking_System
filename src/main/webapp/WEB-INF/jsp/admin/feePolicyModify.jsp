<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8"/>
  <title>요금정책 수정</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
  <style>
    html, body {
      height: 100%;
      margin: 0;
      display: flex;
      flex-direction: column;
    }
    #page-wrapper {
      flex: 1;
      display: flex;
      flex-direction: row;
      height: calc(100vh - 106px);
      overflow: hidden;
    }
    #sidebar {
      width: 250px;
      background-color: #212529;
      color: white;
      overflow-y: auto;
      flex-shrink: 0;
    }
    main.content {
      flex-grow: 1;
      padding: 130px 30px;
      overflow-y: auto;
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
    }
    main.content > * {
      max-width: 100%;
      overflow-wrap: break-word;
    }
  </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div id="page-wrapper">
  <nav id="sidebar">
    <%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>
  </nav>

  <main class="content">
    <div class="container">
      <h2>요금정책 수정</h2>

      <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
      </c:if>

      <form action="${pageContext.request.contextPath}/admin/feePolicy/modify" method="post">
        <input type="hidden" name="policyId" value="${feePolicy.policyId}"/>

        <div class="mb-3">
          <label for="policyName" class="form-label">정책명</label>
          <input type="text" class="form-control" id="policyName" name="policyName"
                 value="${feePolicy.policyName}" required/>
        </div>

        <div class="mb-3">
          <label for="baseTime" class="form-label">기본시간 (분)</label>
          <input type="number" class="form-control" id="baseTime" name="baseTime"
                 value="${feePolicy.baseTime}" min="0" required/>
        </div>

        <div class="mb-3">
          <label for="baseFee" class="form-label">기본요금 (원)</label>
          <input type="number" class="form-control" id="baseFee" name="baseFee"
                 value="${feePolicy.baseFee}" min="0" required/>
        </div>

        <div class="mb-3">
          <label for="additionalTime" class="form-label">추가시간 (분)</label>
          <input type="number" class="form-control" id="additionalTime" name="additionalTime"
                 value="${feePolicy.additionalTime}" min="0" required/>
        </div>

        <div class="mb-3">
          <label for="additionalFee" class="form-label">추가요금 (원)</label>
          <input type="number" class="form-control" id="additionalFee" name="additionalFee"
                 value="${feePolicy.additionalFee}" min="0" required/>
        </div>

        <div class="mb-3">
          <label for="dailyMaxFee" class="form-label">일일최대요금 (원)</label>
          <input type="number" class="form-control" id="dailyMaxFee" name="dailyMaxFee"
                 value="${feePolicy.dailyMaxFee}" min="0" required/>
        </div>

        <button type="submit" class="btn btn-primary">수정 완료</button>
        <a href="${pageContext.request.contextPath}/admin/feePolicy/list" class="btn btn-secondary">목록으로</a>
      </form>
    </div>
  </main>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>