<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String user = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
    <title>스마트파킹 시스템</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body style="padding-top: 70px;">
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/user/index_public.jsp">스마트파킹</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarContent">
            <div class="mx-auto">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="parkingDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            주차관리
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="parkingDropdown">
                            <li><a class="dropdown-item" href="/parking.do">입출차 관리</a></li>
                            <li><a class="dropdown-item" href="/status.jsp">주차현황</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            차량검색
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="searchDropdown">
                            <li><a class="dropdown-item" href="/search.do">검색하기</a></li>
                            <li><a class="dropdown-item" href="/search/history.jsp">검색 기록</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="feeDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            요금제
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="feeDropdown">
                            <li><a class="dropdown-item" href="/fee.do">요금 안내</a></li>
                            <li><a class="dropdown-item" href="/discount.jsp">할인 정보</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="contactDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Contact
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="contactDropdown">
                            <li><a class="dropdown-item" href="/contact.jsp">문의하기</a></li>
                            <li><a class="dropdown-item" href="/faq.jsp">자주 묻는 질문</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <ul class="navbar-nav">
                <% if (user == null) { %>
                <li class="nav-item"><a class="nav-link" href="/login.jsp">Sign in</a></li>
                <li class="nav-item"><a class="nav-link" href="/register.jsp">Register</a></li>
                <% } else { %>
                <li class="nav-item"><a class="nav-link" href="/user/main.jsp">마이페이지</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
</body>
<!-- Bootstrap JS + Popper.js (Bootstrap 5용) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<!-- AOS 를 사용해서 애니메이션 효과 지정 -->
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>AOS.init();</script>

</html>