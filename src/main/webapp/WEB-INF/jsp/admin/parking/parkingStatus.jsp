<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>차량 목록</title>
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
            height: 100%;
            min-height: 0; /* flex 버그 예방 */
        }

        #sidebar {
            width: 250px;
            overflow-y: auto;
            height: 100%;
        }

        main.content {
            flex-grow: 1;
            overflow-y: auto;
            padding: 106px 30px 20px 30px; /* 헤더 높이만큼 상단 여백 */
        }

        /* 테이블 행에 부드러운 호버 효과 추가 */
        tbody tr:hover {
            background-color: #f1f3f5;
            cursor: pointer;
        }

        /* 상단 컨트롤 박스 스타일 */
        .control-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-form {
            display: flex;
            flex-wrap: nowrap;
            align-items: center;
        }

        .search-form button {
            white-space: nowrap;
        }

        .search-form input[type="text"] {
            width: 250px;
        }
    </style>
    <script>
        window.addEventListener('DOMContentLoaded', () => {
            const msg = document.getElementById('successMsg');
            if (msg) {
                setTimeout(() => {
                    msg.style.display = 'none';
                }, 3000);
            }
        });
    </script>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div id="page-wrapper">
    <nav id="sidebar">
        <%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>
    </nav>

    <main class="content">
        <div class="container mt-4">
            <h2>주차중 차량 목록</h2>

            <div class="control-bar">
                <form class="search-form" action="${pageContext.request.contextPath}/admin/parkingList" method="get">

                    <input type="text" name="carNumberKeyword" placeholder="차량번호 검색" value="${param.carNumberKeyword != null ? param.carNumberKeyword : ''}" class="form-control me-2" />

                    <input type="text" name="userNameKeyword" placeholder="사용자 이름 검색" value="${param.userNameKeyword != null ? param.userNameKeyword : ''}" class="form-control me-2" />

                    <button type="submit" class="btn btn-primary">검색</button>
                </form>

                <c:if test="${not empty successMessage}">
                    <div id="successMsg" class="alert alert-success mt-3" role="alert">
                            ${successMessage}
                    </div>
                </c:if>

                <div class="card text mb-4">
                    <div class="card-body text-center">
                        <h5 class="card-title text-primary">현재 주차중 차량 수</h5>
                        <p class="card-text fs-4"><strong>${count}</strong>대</p>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-secondary">
                    <tr>
                        <th scope="col" class="text-center">레코드 ID</th>
                        <th scope="col" class="text-center">차량 번호</th>
                        <th scope="col" class="text-center">차량 모델</th>
                        <th scope="col" class="text-center">차량 타입</th>
                        <th scope="col" class="text-center">사용자 이름</th>
                        <th scope="col" class="text-center">입차 시간</th>
                        <th scope="col" class="text-center">출차 시간</th>
                        <th scope="col" class="text-center">요금</th>
                        <th scope="col" class="text-center">출차 처리</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="record" items="${parkingRecords}">
                        <tr>
                            <td class="text-center align-middle">${record.recordId}</td>
                            <td class="text-center align-middle">${record.carNumber}</td>
                            <td class="text-center align-middle">${record.carModel}</td>
                            <td class="text-center align-middle">${record.carType}</td>
                            <td class="text-center align-middle">${record.name}</td>
                            <td class="text-center align-middle">${record.entryTime}</td>
                            <td class="text-center align-middle">
                                <c:choose>
                                    <c:when test="${record.exitTime != null}">
                                        ${record.exitTime}
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-danger">주차중</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center align-middle"><c:out value="${record.fee}" default="0" />원</td>
                            <td class="text-center align-middle">
                                <c:choose>
                                    <c:when test="${record.exited}">
                                        <span class="badge bg-secondary">출차완료</span>
                                    </c:when>
                                    <c:otherwise>
                                        <form action="${pageContext.request.contextPath}/admin/parkingList/exit" method="post" style="margin:0;">
                                            <input type="hidden" name="carId" value="${record.carId}" />
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                    onclick="return confirm('출차 처리하시겠습니까?');">
                                                출차
                                            </button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>