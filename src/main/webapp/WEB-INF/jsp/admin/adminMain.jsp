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
        <div class="container-fluid">
            <h1 class="mb-4"><%=user.getName()%>님 환영합니다.</h1>

            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-body">
                            <h5 class="card-title">총 회원 수</h5>
                            <p class="card-text fs-2">${totalMembers} 명</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">월정액 회원</h5>
                            <p class="card-text fs-2">${subscriptionMembers} 명</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-body">
                            <h5 class="card-title">오늘 주차 건수</h5>
                            <p class="card-text fs-2">${todayParkingCount} 건</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-danger mb-3">
                        <div class="card-body">
                            <h5 class="card-title">미납 요금 건수</h5>
                            <p class="card-text fs-2">${unpaidCount} 건</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-6">
                    <h4>최근 가입 회원 <small class="text-primary fs-6">* 월정액회원은 파란색으로 표시</small></h4>
                    <c:choose>
                        <c:when test="${not empty recentMembers}">
                            <table class="table table-bordered table-hover">
                                <thead class="table-light">
                                <tr>
                                    <th>이름</th>
                                    <th>아이디</th>
                                    <th>전화번호</th>
                                    <th>가입일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="member" items="${recentMembers}">
                                    <c:choose>
                                        <c:when test="${member.subscription}">
                                            <tr>
                                                <td class="text-primary">${member.name}</td>
                                                <td class="text-primary">${member.userName}</td>
                                                <td class="text-primary">${member.phone}</td>
                                                <td class="text-primary"><fmt:formatDate value="${member.joinDate}" pattern="yyyy-MM-dd" /></td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td>${member.name}</td>
                                                <td>${member.userName}</td>
                                                <td>${member.phone}</td>
                                                <td><fmt:formatDate value="${member.joinDate}" pattern="yyyy-MM-dd" /></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p>목록이 없습니다!</p>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="col-md-6">
                    <h4>최근 주차 기록</h4>
                    <c:choose>
                        <c:when test="${not empty recentParkingRecords}">
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
                                <c:forEach var="record" items="${recentParkingRecords}">
                                    <tr>
                                        <td>${record.carNumber}</td>
                                        <td>${record.inTime}</td>
                                        <td>${record.outTime}</td>
                                        <td>${record.fee}원</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p>목록이 없습니다!</p>
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