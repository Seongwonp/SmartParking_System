<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>관리자</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<%@ include file="/jsp/updateAdmin/adminSidebar.jsp" %>

<main class="content" style="margin-left: 250px; padding:106px 20px;">
    <div class="container-fluid">
        <h1 class="mb-4">관리자 대시보드</h1>

        <!-- 1) 주요 통계 카드 -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title">총 회원 수</h5>
                        <p class="card-text fs-2">1,234</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body">
                        <h5 class="card-title">월정액 회원</h5>
                        <p class="card-text fs-2">456</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-body">
                        <h5 class="card-title">오늘 주차 건수</h5>
                        <p class="card-text fs-2">78</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-danger mb-3">
                    <div class="card-body">
                        <h5 class="card-title">미납 요금 건수</h5>
                        <p class="card-text fs-2">9</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 2) 최근 가입 회원 리스트 -->
        <div class="row mb-4">
            <div class="col-md-6">
                <h4>최근 가입 회원</h4>
                <ul class="list-group">
                    <li class="list-group-item">홍길동 (가입일: 2025-06-25)</li>
                    <li class="list-group-item">김철수 (가입일: 2025-06-24)</li>
                    <li class="list-group-item">이영희 (가입일: 2025-06-23)</li>
                    <li class="list-group-item">박민수 (가입일: 2025-06-22)</li>
                    <li class="list-group-item">최수진 (가입일: 2025-06-21)</li>
                </ul>
            </div>

            <!-- 3) 최근 주차 기록 리스트 -->
            <div class="col-md-6">
                <h4>최근 주차 기록</h4>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>차량 번호</th>
                        <th>입차 시간</th>
                        <th>출차 시간</th>
                        <th>요금</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>12가3456</td>
                        <td>2025-06-29 08:30</td>
                        <td>2025-06-29 10:45</td>
                        <td>5,000원</td>
                    </tr>
                    <tr>
                        <td>34나7890</td>
                        <td>2025-06-29 09:00</td>
                        <td>2025-06-29 11:00</td>
                        <td>6,000원</td>
                    </tr>
                    <tr>
                        <td>56다1234</td>
                        <td>2025-06-29 09:30</td>
                        <td>2025-06-29 12:00</td>
                        <td>7,000원</td>
                    </tr>
                    <tr>
                        <td>78라5678</td>
                        <td>2025-06-29 10:00</td>
                        <td>2025-06-29 13:30</td>
                        <td>8,000원</td>
                    </tr>
                    <tr>
                        <td>90마9012</td>
                        <td>2025-06-29 11:15</td>
                        <td>2025-06-29 14:00</td>
                        <td>5,500원</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</main>

<%@ include file="/jsp/include/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>