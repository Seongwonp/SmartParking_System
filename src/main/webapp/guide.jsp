<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주차 안내</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <!-- AOS CSS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        .banner {
            background: linear-gradient(45deg, #007bff, #6610f2);
            color: #fff;
            padding: 80px 20px;
            text-align: center;
        }
        .section-title {
            font-weight: 700;
            margin-bottom: 30px;
        }
        .card-hover:hover {
            transform: scale(1.05);
            transition: transform 0.3s ease;
            z-index: 2;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<!-- 배너 -->
<div class="banner" data-aos="fade-down" style="margin-top: 100px;">
    <h1 class="display-4 fw-bold">주차 이용 안내</h1>
    <p class="lead">SmartParking 반월당점을 찾아주셔서 감사합니다.</p>
</div>

<!-- 본문 영역 -->
<div class="container my-5" data-aos="fade-up">
    <div class="row gy-4">
        <div class="col-md-6">
            <div class="p-4 border rounded shadow-sm h-100 card-hover">
                <h4 class="section-title"><i class="fas fa-clock me-2"></i>운영 시간</h4>
                <p>24시간 연중무휴 운영됩니다.</p>
            </div>
        </div>

        <div class="col-md-6">
            <a href="/jsp/user/parking_fee.jsp" class="text-decoration-none text-dark">
                <div class="p-4 border rounded shadow-sm h-100 position-relative card-hover">
                    <h4 class="section-title">
                        <i class="fas fa-coins me-2"></i>주차 요금
                    </h4>
                    <p>
                        무료회차 시간 10분 이내<br>
                        기본 1시간 2,000원 / 30분당 1,000원 추가<br>
                        일 최대 요금 15,000원
                    </p>
                    <p class="text-muted small mt-2">요금정보와 할인정보에 대한 자세한 정보 확인을 원하시면 클릭해주세요!</p>
                </div>
            </a>
        </div>

        <div class="col-md-6">
            <a href="#" class="text-decoration-none text-dark">
                <div class="p-4 border rounded shadow-sm h-100 card-hover">
                    <h4 class="section-title"><i class="fas fa-ticket-alt me-2"></i>정기권</h4>
                    <p>월 120,000원에 정기권 이용이 가능합니다.</p>
                    <p class="text-muted small mt-2">자세한 정보 확인을 원하시면 클릭해주세요!</p>
                </div>
            </a>
        </div>

        <div class="col-md-6">
            <div class="p-4 border rounded shadow-sm h-100 card-hover">
                <h4 class="section-title"><i class="fas fa-car-battery me-2"></i>전기차 충전소</h4>
                <ul class="list-group ps-3 mb-2">
                    <li>전기차 충전소는 B2층에 설치되어 있으며, 급속·완속 충전 모두 가능합니다.</li>
                    <li>주차장 층별 안내: B1(소형차), B2(대형차, 전기차 충전).</li>
                    <li>만차 시 인근 제휴 주차장을 안내해드립니다.</li>
                </ul>
            </div>
        </div>
        <div class="col-md-6">
            <div class="p-4 border rounded shadow-sm h-100 card-hover">
                <h4 class="section-title"><i class="fas fa-door-open me-2"></i>관리실 영업시각</h4>
                <table class="table table-bordered mb-0">
                  <tbody>
                    <tr>
                      <th>요일</th>
                      <td>월~금</td>
                    </tr>
                    <tr>
                      <th>시간</th>
                      <td>09:00 ~ 18:00</td>
                    </tr>
                    <tr>
                      <th>휴무일</th>
                      <td>토요일, 일요일, 공휴일</td>
                    </tr>
                  </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-6">
            <div class="p-4 border rounded shadow-sm h-100 card-hover">
                <h4 class="section-title"><i class="fas fa-exclamation-triangle me-2"></i>이용 시 주의사항</h4>
                <ul class="list-group ps-3 mb-2">
                    <li>차량 높이 제한은 2.1m 입니다.</li>
                    <li>장기 주차 시 반드시 관리실에 문의해 주세요.</li>
                    <li>귀중품은 차량 내부에 두지 마시고 소지해 주세요.</li>
                    <li>규격 외 차량은 입차가 제한될 수 있습니다.</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="mt-5 text-center">
        <p class="fw-bold">SmartParking 반월당점은 고객님의 편리하고 안전한 주차를 위해 최선을 다하고 있습니다.<br>
            문의: 053-123-4567</p>
    </div>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>