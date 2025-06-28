<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>공지사항 - SmartParking</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
  <style>
    .banner {
      background: linear-gradient(45deg, #63b1f6, #6610f2);
      color: white;
      padding: 80px 20px;
      text-align: center;
      margin-top: 100px;
    }
    table.notice-table thead {
      background-color: #f8f9fa;
    }
    table.notice-table tbody tr:hover {
      background-color: #e9f5ff;
      cursor: pointer;
    }
    a.notice-title {
      color: #0d6efd;
      font-weight: 600;
      text-decoration: none;
      transition: color 0.3s ease;
    }
    a.notice-title:hover {
      color: #0a58ca;
      text-decoration: underline;
    }
    td.text-muted {
      font-size: 0.9rem;
    }
  </style>
</head>
<body>
  <%@ include file="/jsp/include/header.jsp" %>

  <div class="banner" data-aos="fade-down">
    <h1 class="display-4 fw-bold"><i class="fa-solid fa-bullhorn me-3"></i>공지사항</h1>
  </div>

  <div class="container my-5" data-aos="fade-up">
    <c:choose>
      <c:when test="${empty noticeList}">
        <div class="alert alert-info">공지사항이 없습니다.</div>
      </c:when>
      <c:otherwise>
        <div class="table-responsive">
          <table class="table table-striped table-hover notice-table shadow-sm">
            <thead>
              <tr>
                <th scope="col">제목</th>
                <th scope="col" style="width: 150px;">작성자</th>
                <th scope="col" style="width: 100px;">조회수</th>
                <th scope="col" style="width: 150px;">작성일</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="notice" items="${noticeList}">
                <tr onclick="location.href='/notice/detail?noticeId=${notice.noticeId}'" style="cursor:pointer;">
                  <td><a href="/notice/detail?noticeId=${notice.noticeId}" class="notice-title">${notice.title}</a></td>
                  <td>${notice.writer}</td>
                  <td class="text-muted">${notice.view}</td>
                  <td class="text-muted">${notice.createdAt}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </c:otherwise>
    </c:choose>
  </div>

  <%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>