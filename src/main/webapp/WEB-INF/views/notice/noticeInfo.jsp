<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지 상세 - SmartParking</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
</head>
<style>
  .banner {
    background: linear-gradient(135deg, #4e73df, #224abe);
    color: white;
    padding: 80px 20px;
    text-align: center;
    margin-top: 100px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
  }

  .banner h1 {
    text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.5);
  }
</style>
<body>

<%@ include file="/jsp/include/header.jsp" %>
<div class="banner" data-aos="fade-down">
  <h1 class="display-4 fw-bold">
    <i class="fa-solid fa-bullhorn me-3"></i>공지사항
  </h1>
</div>

<div class="container my-5" data-aos="fade-up">
  <h2 class="mb-4">
    <i class="fa-solid fa-bullhorn me-2"></i>공지사항 상세
  </h2>

  <c:choose>
    <c:when test="${empty notice}">
      <div class="alert alert-warning text-center p-4 fs-5">
        <i class="fa-solid fa-triangle-exclamation me-2"></i>
        해당 공지사항이 존재하지 않습니다.
      </div>
    </c:when>
    <c:otherwise>
      <div class="card shadow-sm">
        <div class="card-body">
          <h3 class="card-title text-primary fw-bold">
            <i class="fa-regular fa-file-lines me-2"></i>
              ${notice.title}
          </h3>
          <div class="text-muted small mb-3">
            작성자: <strong>${notice.writer}</strong> |
            조회수: <strong>${notice.view}</strong> |
            작성일: <strong>${notice.createdAt}</strong>
            <c:if test="${not empty notice.updatedAt}">
              | 수정일: <strong>${notice.updatedAt}</strong>
            </c:if>
          </div>
          <hr/>
          <div class="card-text" style="white-space: pre-wrap;">
              ${notice.content}
          </div>
        </div>
      </div>
      <div class="mt-4">
        <a href="${pageContext.request.contextPath}/notice/list" class="btn btn-secondary">
          <i class="fa-solid fa-arrow-left me-2"></i>목록으로
        </a>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<%@ include file="/jsp/include/footer.jsp" %>

</body>
</html>