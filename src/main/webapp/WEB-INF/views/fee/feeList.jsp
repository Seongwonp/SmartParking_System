<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>요금 정보</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    .banner {
      background: url('/resources/img/banner_background.png') no-repeat center center / cover;
      color: #fff;
      padding: 80px 20px;
      text-align: center;
      border-radius: 12px;
    }
    table th, table td {
      padding: 0.7rem 1rem;
      font-size: 1rem;
    }
    thead.table-light {
      background-color: #f5f7fa !important;
      border-top: 4px solid #0d6efd !important;
    }
    tbody tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    tbody tr:hover {
      background-color: #e6f0ff;
    }
    .list-unstyled li {
      margin-bottom: 12px;
      font-size: 1.25rem;
    }
  </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<div class="banner" data-aos="fade-down" style="margin-top: 100px;">
  <h1 class="display-4 fw-bold">요금 정보</h1>
</div>
<div class="container" style="margin: 50px auto;">
  <h2 class="fw-bold mb-4" data-aos="fade-up"><i class="fa-solid fa-wallet text-primary me-2"></i>요금 정보</h2>
  <p class="text-muted mb-4" data-aos="fade-up" data-aos-delay="50">
    차량 이용 시 아래 요금 기준에 따라 정산됩니다. 요금 감면 대상 차량 및 할인 적용 기준은 하단 안내를 참고하세요.
  </p>
  <div class="alert alert-info mb-4" role="alert" data-aos="fade-up" data-aos-delay="100">
    <strong>안내 및 주의사항:</strong> 요금 정책은 주차장 운영 상황에 따라 변경될 수 있으며, 실제 적용 시점에 따라 차이가 있을 수 있습니다. 자세한 사항은 관리사무소에 문의해 주세요.
  </div>
  <c:forEach var="policy" items="${feeList}">
    <div class="mb-4 p-4 border rounded shadow-sm" data-aos="fade-up" data-aos-delay="100">
      <h5 class="fw-bold text-primary mb-3">${policy.policyName}</h5>
      <ul class="list-unstyled mb-0">
        <li><strong>기본 시간:</strong>
          <c:choose>
            <c:when test="${policy.baseTime lt 60}">
              ${policy.baseTime} 분
            </c:when>
            <c:otherwise>
              <fmt:formatNumber value="${policy.baseTime div 60}" maxFractionDigits="0" /> 시간
              <c:if test="${policy.baseTime mod 60 ne 0}">
                <fmt:formatNumber value="${policy.baseTime mod 60}" maxFractionDigits="0" /> 분
              </c:if>
            </c:otherwise>
          </c:choose>
        </li>
        <li><strong>기본 요금: </strong> <fmt:formatNumber value="${policy.baseFee}" type="number" groupingUsed="true" /> 원</li>
        <li><strong>추가 ${policy.additionalTime}분당: </strong> <fmt:formatNumber value="${policy.additionalFee}" type="number" groupingUsed="true" /> 원</li>
        <li><strong>1일 최대 요금: </strong> <fmt:formatNumber value="${policy.dailyMaxFee}" type="number" groupingUsed="true" /> 원</li>
      </ul>
    </div>
  </c:forEach>

  <h3 class="fw-semibold mt-5 mb-3" data-aos="fade-up">차량 구분 기준</h3>
  <table class="table table-bordered text-center align-middle small shadow-sm" data-aos="fade-up" data-aos-delay="50">
    <thead class="table-light">
      <tr>
        <th>차량 종류</th>
        <th>구분 기준</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>경형 차량</td>
        <td>배기량 1,000cc 이하, 길이 3.6m 이하, 너비 1.6m 이하</td>
      </tr>
      <tr>
        <td>중형 차량</td>
        <td>승용 및 일반 차량</td>
      </tr>
      <tr>
        <td>친환경 차량</td>
        <td>전기차, 수소차, 하이브리드 등 저공해 2종 이하 차량</td>
      </tr>
    </tbody>
  </table>


  <h4 class="fw-bold mt-5 mb-2" data-aos="fade-up">
    <i class="fa-solid fa-money-check-alt me-2 text-primary"></i>주차요금 정산 방법
  </h4>
  <p data-aos="fade-up">출차 전 무인정산기 또는 웹페이지를 통해 요금을 결제해 주세요.</p>


  <h4 class="fw-bold mt-5 mb-2" data-aos="fade-up">
    <i class="fa-solid fa-circle-info me-2 text-primary"></i>무인정산기 결제 유의사항
  </h4>
  <ul class="mb-3" data-aos="fade-up">
    <li>무인정산기에서 결제 후 15분 이내에 출차해야 추가 요금이 부과되지 않습니다.</li>
    <li>현금 및 카드 결제가 모두 가능합니다.</li>
    <li>영수증이 필요하신 경우 결제 후 출력 버튼을 눌러주세요.</li>
  </ul>


  <h4 class="fw-bold mt-5 mb-2" data-aos="fade-up">
    <i class="fa-solid fa-circle-info me-2 text-primary"></i>웹페이지 결제 유의사항
  </h4>
  <ul class="mb-3" data-aos="fade-up">
    <li>모바일 또는 PC에서 주차장 웹페이지에 접속하여 차량번호로 조회 후 결제 가능합니다.</li>
    <li>웹 결제 후 반드시 결제 완료 여부를 확인하시고 출차해 주세요.</li>
    <li>결제 오류 시 고객센터로 문의 바랍니다.</li>
  </ul>


  <h4 id="discount-info" class="fw-bold mt-5 mb-2" data-aos="fade-up">
    <i class="fa-solid fa-circle-info me-2 text-primary"></i>요금 감면 안내
  </h4>
  <ul class="mb-3" data-aos="fade-up">
    <li>장애인, 국가유공자, 경차 등 감면 대상 차량은 증빙서류를 사전에 제출해야 할인 적용이 가능합니다.</li>
    <li>감면 기준 및 적용 방법은 주차장 운영 정책에 따라 달라질 수 있습니다.</li>
    <li>자세한 사항은 관리사무소 또는 안내 데스크에 문의해 주세요.</li>
  </ul>

  <h4 class="fw-bold mt-5 mb-3" data-aos="fade-up">
    <i class="fa-solid fa-tags me-2 text-success"></i>할인 정책 상세 안내
  </h4>

  <table class="table table-bordered align-middle shadow-sm" data-aos="fade-up" data-aos-delay="50">
    <thead class="table-light">
    <tr class="text-center">
      <th scope="col">할인 유형</th>
      <th scope="col">할인 설명</th>
      <th scope="col">할인율 (%)</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="discount" items="${discountList}">
      <tr>
        <td class="fw-bold text-primary text-center">${discount.type}</td>
        <td style="white-space: pre-line;">${discount.description}</td>
        <td class="fw-semibold text-center">${discount.rate}%</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>