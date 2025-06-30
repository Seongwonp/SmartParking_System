<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>할인정책 수정</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
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
      padding: 120px 30px;
      overflow-y: auto;
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
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
    <h2>할인정책 수정</h2>

    <c:if test="${not empty error}">
      <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/admin/discountPolicy/modify" method="post">
      <input type="hidden" name="discountId" value="${discountPolicy.discountId}" />

      <div class="mb-3">
        <label for="type" class="form-label">할인 종류 (Type)</label>
        <input type="text" class="form-control" id="type" name="type" value="${discountPolicy.type}" required />
      </div>

      <div class="mb-3">
        <label for="description" class="form-label">설명</label>
        <textarea class="form-control" id="description" name="description" rows="10">${discountPolicy.description}</textarea>
      </div>

      <div class="mb-3">
        <label for="rate" class="form-label">할인율 (%)</label>
        <input type="number" class="form-control" id="rate" name="rate" value="${discountPolicy.rate}" min="0" max="100" required />
      </div>

      <div class="d-flex gap-2 mb-3">
        <button type="submit" class="btn btn-success">수정 완료</button>
        <a href="${pageContext.request.contextPath}/admin/discountPolicy/list" class="btn btn-primary">목록으로</a>
      </div>

      <div class="d-flex gap-2">
        <button type="reset" class="btn btn-secondary">초기화</button>
        <button type="button" class="btn btn-danger"
                onclick="if(confirm('정말 삭제하시겠습니까?')) {
                        location.href='${pageContext.request.contextPath}/admin/discountPolicy/delete?discountId=${discountPolicy.discountId}';
                        }"
                <c:if test="${discountPolicy.discountId == 1}">disabled</c:if>>
          삭제
        </button>
      </div>
    </form>
  </main>
</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>