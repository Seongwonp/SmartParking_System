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
      padding: 150px 30px;
      overflow-y: auto;
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
    }
    main.content > * {
      max-width: 100%;
      overflow-wrap: break-word;
    }
    .input-group {
      margin-bottom: 1rem;
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
  </main>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>