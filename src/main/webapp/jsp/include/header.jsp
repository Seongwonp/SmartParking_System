<%@ page import="com.opentime.smartparking_system.model.dto.UserDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">

<nav class="navbar-custom">
    <div class="navbar-container">

        <!-- 왼쪽 로고 -->
        <div class="navbar-logo">
            <a href="${pageContext.request.contextPath}/index">
                <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="SmartParking Logo" />
            </a>
            <span id="headerClock"></span>
        </div>

        <!-- 가운데 메뉴 -->
        <ul class="navbar-menu">
            <li class="dropdown">
                <a href="/Info/intro">이용안내</a>
                <ul class="dropdown-menu">
                    <li><a href="/Info/intro">주차장 소개</a></li>
                    <li><a href="/Info/guide">주차 안내</a></li>
                    <li><a href="/Info/location">오시는 길</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="/fee/list">이용요금</a>
                <ul class="dropdown-menu">
                    <li><a href="/fee/list">요금제 안내</a></li>
                    <li><a href="/fee/list#discount-info">할인 정보</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="/contact/Q&amp;A">고객지원</a>
                <ul class="dropdown-menu">
                    <li><a href="/contact/Q&amp;A">문의하기</a></li>
                    <li><a href="/contact/F&amp;Q">자주 묻는 질문</a></li>
                </ul>
            </li>
            <li><a href="/notice/list">공지사항</a></li>
        </ul>

        <!-- 유저 메뉴 -->
        <div class="navbar-right">
            <ul class="user-menu">
                <%
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    if (user == null) {
                %>
                <li><a href="/login">Log In</a></li>
                <li><a href="/user/signup">Sign Up</a></li>
                <% } else { %>
                <li class="fw-bold text-primary" style="cursor: default;"><%= user.getName() %>님</li>
                <% if ("ADMIN".equals(user.getRole())) { %>
                <li><a href="/admin/main">관리자 페이지</a></li>
                <% } %>
                <li><a href="/user/myPageHome">마이페이지</a></li>
                <li><a href="#" id="logoutLink">Logout</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 로그아웃
        const logoutLink = document.getElementById('logoutLink');
        if (logoutLink) {
            logoutLink.addEventListener('click', function (e) {
                e.preventDefault();
                if (confirm('로그아웃하시겠습니까?')) {
                    location.href = '/user/logout';
                }
            });
        }

        // 시계 출력
        function updateClock() {
            const now = new Date();
            const pad = n => n.toString().padStart(2, '0');
            document.getElementById('headerClock').textContent =
                pad(now.getHours()) + ':' + pad(now.getMinutes()) + ':' + pad(now.getSeconds());
        }

        updateClock();
        setInterval(updateClock, 1000);
    });
</script>
