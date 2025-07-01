<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>관리자</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <style>
        /* flex 레이아웃 적용 */
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        #page-wrapper {
            flex: 1;
            display: flex;
            flex-direction: row;
            min-height: 0; /* flexbox 버그 예방 */
        }
        #sidebar {
            width: 250px;
            background-color: #212529; /* 기존 bg-dark 느낌 */
            color: white;
            overflow-y: auto;
        }
        main.content {
            flex-grow: 1;
            overflow-y: auto;
            padding: 106px 20px 20px 20px; /* 기존 padding 유지 */
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
        <div style="padding: 24px;">
            <%@include file="/WEB-INF/jsp/admin/user/listNav.jsp"%>
        </div>
        <div class="container-fluid">
  <div class="row">
    <div class="col-12">
      <h4>만료된 정기권 차량 목록</h4>
      <c:choose>
        <c:when test="${not empty expiredList}">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>차량번호</th>
                <th>차종</th>
                <th>모델명</th>
                <th>시작일</th>
                <th>종료일</th>
                <th>상태</th>
                <th>타입</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="item" items="${expiredList}">
                <tr>
                  <td>${item.carNumber}</td>
                  <td>${item.carType}</td>
                  <td>${item.carModel}</td>
                  <td>${item.startDate}</td>
                  <td>${item.endDate}</td>
                  <td>${item.status}</td>
                  <td>${item.subscriptionType}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </c:when>
        <c:otherwise>
          <p>만료된 차량 목록이 없습니다.</p>
        </c:otherwise>
      </c:choose>

      <h4 class="mt-4">정기권 차량 목록 필터</h4>
      <form method="get" action="${pageContext.request.contextPath}/admin/subscription/car/list">
        <label for="subscriptionTypeSelect">구독 타입 선택:</label>
        <select id="subscriptionTypeSelect" name="type" class="form-select" style="width: 200px; display: inline-block; margin-left: 8px;" onchange="this.form.submit()">
          <option value="">-- 구독 타입 선택 --</option>
          <option value="monthly" ${param.type == 'monthly' ? 'selected' : ''}>월간</option>
          <option value="annual" ${param.type == 'annual' ? 'selected' : ''}>연간</option>
        </select>

        <label for="subscriptionStatusSelect" style="margin-left: 20px;">구독 상태 선택:</label>
        <select id="subscriptionStatusSelect" name="status" class="form-select" style="width: 200px; display: inline-block; margin-left: 8px;" onchange="this.form.submit()">
          <option value="">-- 구독 상태 선택 --</option>
          <option value="active" ${param.status eq 'active' ? 'selected' : ''}>활성</option>
          <option value="inactive" ${param.status eq 'inactive' ? 'selected' : ''}>비활성</option>
          <option value="paused" ${param.status eq 'paused' ? 'selected' : ''}>일시중지</option>
          <option value="cancelled" ${param.status eq 'cancelled' ? 'selected' : ''}>해지</option>
        </select>
      </form>

      <c:choose>
        <c:when test="${not empty filteredList}">
          <table class="table table-striped mt-3">
            <thead>
              <tr>
                <th>차량번호</th>
                <th>차종</th>
                <th>모델명</th>
                <th>시작일</th>
                <th>종료일</th>
                <th>상태</th>
                <th>타입</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="item" items="${filteredList}">
                <tr>
                  <td>${item.carNumber}</td>
                  <td>${item.carType}</td>
                  <td>${item.carModel}</td>
                  <td>${item.startDate}</td>
                  <td>${item.endDate}</td>
                  <td>${item.status}</td>
                  <td>${item.subscriptionType}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </c:when>
        <c:otherwise>
          <p class="mt-3">목록이 없습니다!</p>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</div>
    </main>
</div>

<%@ include file="/jsp/include/footer.jsp" %>

</body>
</html>