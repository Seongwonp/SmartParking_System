<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 차량 주차 기록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0 auto;
            display: flex;
        }
        body {
            background: #f9f9f9;
            font-family: sans-serif;
        }

        body > .my-page {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            background-color: #f9f9f9;
            margin-top: 140px;
            width: 100%;
        }

        body > .my-page .main-content {
            display: flex;
            gap: 30px;
        }

        .parking-history {
            width: 800px;
            max-width: 1200px;
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 0.375rem;
        }

        .parking-history > h2 {
            text-align: center;
            color: #333;
        }

        .parking-history thead th {
            background-color: #4a97d8;
            color: white;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div class="my-page">
    <div class="main-content">
        <!-- 좌측 프로필 카드 -->
        <div>
            <%@ include file="/jsp/user/myPage_profile.jsp" %>
        </div>

        <!-- 우측 주차 기록 카드 -->
        <div class="parking-history">
            <h2 class="mb-3">내 차량 주차 기록 조회</h2>

            <!-- 차량 선택 폼 -->
            <form method="get" action="${pageContext.request.contextPath}/user/parking/history"
                  class="row gy-2 gx-3 align-items-center mb-4">
                <div class="col-auto">
                    <label for="carSelect" class="visually-hidden">차량 선택</label>
                    <select name="carId" id="carSelect" class="form-select" onchange="this.form.submit()">
                        <option value="">-- 차량 선택 --</option>
                        <c:forEach var="car" items="${carList}">
                            <option value="${car.carId}" <c:if test="${param.carId == car.carId}">selected</c:if>>
                                    ${car.carNumber} (${car.carModel})
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <input type="hidden" name="limit" value="${param.limit != null ? param.limit : 0}" />
            </form>

            <hr/>

            <!-- 주차 기록 테이블 -->
            <c:choose>
                <c:when test="${not empty parkingHistory}">
                    <div class="table-responsive">
                        <table class="table table-bordered text-center">
                            <thead>
                            <tr>
                                <th>차량번호</th>
                                <th>입차시간</th>
                                <th>출차시간</th>
                                <th>요금</th>
                                <th>상태</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="record" items="${parkingHistory}">
                                <tr>
                                    <td>${record.carNumber}</td>
                                    <td>${record.entryTime}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${record.exitTime != null}">
                                                ${record.exitTime}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-warning fw-bold">출차 전</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <strong class="text-primary">${record.fee}원</strong>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${record.exitTime == null}">
                                                <span class="badge bg-warning text-dark">주차 중</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-success">출차 완료</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <form method="get" action="${pageContext.request.contextPath}/user/parking/history">
                        <input type="hidden" name="carId" value="${param.carId}" />
                        <input type="hidden" name="limit" value="${param.limit != null ? param.limit + 5 : 5}" />
                        <button type="submit" class="btn btn-primary">더보기</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <p class="text-muted">주차 기록이 없습니다.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>