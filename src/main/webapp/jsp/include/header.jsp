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
</head>
<body style="padding-top: 70px;">
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/user/index_public.jsp">스마트파킹</a>
        <%-- 햄버거 버튼 ( 화면 축소시 네비게이션 토글 버튼 ) --%>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav mb-2 mb-lg-0 ms-auto">
                <li class="nav-item"><a class="nav-link" href="/parking.do">주차관리</a></li>
                <li class="nav-item"><a class="nav-link" href="/search.do">차량검색</a></li>
                <li class="nav-item"><a class="nav-link" href="/fee.do">요금제</a></li>
                <li class="nav-item"><a class="nav-link" href="/contact.jsp">Contact</a></li>
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
</html>