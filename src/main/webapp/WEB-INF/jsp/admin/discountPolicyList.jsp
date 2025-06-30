<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>할인정책 목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
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
  </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<div id="page-wrapper">
  <nav id="sidebar">
    <%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>
  </nav>
  <main class="content">
    <div class="card mb-5">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h4 class="mb-2">할인정책 목록</h4>
        <a href="${pageContext.request.contextPath}/admin/discountPolicy/register" class="btn btn-success btn-sm">
          신규 등록
        </a>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-striped table-bordered table-hover table-sm align-middle">
            <thead class="table-primary fw-bold text-center">
            <tr>
              <th>할인ID</th>
              <th>할인 종류 (Type)</th>
              <th>설명</th>
              <th>할인율 (%)</th>
              <th style="width: 150px;">관리</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="discount" items="${discountList}">
              <tr>
                <td class="text-center align-middle">${discount.discountId}</td>
                <td class="text-center align-middle">${discount.type}</td>
                <td class="text-center align-middle">${discount.description}</td>
                <td class="text-center align-middle">${discount.rate}</td>
                <td class="text-center align-middle">
                  <a href="${pageContext.request.contextPath}/admin/discountPolicy/modify?discountId=${discount.discountId}" class="btn btn-primary btn-md">
                    <i class="bi bi-pencil-square"></i> 수정
                  </a>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </main>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>