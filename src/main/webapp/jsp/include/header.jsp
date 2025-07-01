<%@ page import="com.opentime.smartparking_system.model.dto.UserDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top border-bottom shadow-sm">
    <div class="container-fluid">
        <!-- 로고 -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index">
            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="SmartParking Logo" height="60" class="d-inline-block align-text-top" />
        </a>

        <!-- 햄버거 버튼 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">
            <!-- 중앙 네비 메뉴 -->
            <ul class="navbar-nav mx-auto fw-semibold fs-6">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/Info/intro" id="parkingInfoDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        이용안내
                    </a>
                    <ul class="dropdown-menu shadow-sm">
                        <li><a class="dropdown-item" href="/Info/intro">주차장 소개</a></li>
                        <li><a class="dropdown-item" href="/Info/guide">주차 안내</a></li>
                        <li><a class="dropdown-item" href="/Info/location">오시는 길</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/fee/list" id="priceDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        이용요금
                    </a>
                    <ul class="dropdown-menu shadow-sm">
                        <li><a class="dropdown-item" href="/fee/list">요금제 안내</a></li>
                        <li><a class="dropdown-item" href="/fee/list#discount-info">할인 정보</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/contact/Q&A" id="supportDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        고객지원
                    </a>
                    <ul class="dropdown-menu shadow-sm">
                        <li><a class="dropdown-item" href="/contact/Q&A">문의하기</a></li>
                        <li><a class="dropdown-item" href="/contact/F&Q">자주 묻는 질문</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/notice/list">공지사항</a>
                </li>
            </ul>

            <!-- 오른쪽 시계 -->
            <span id="headerClock" class="me-3 fw-semibold text-dark fs-6 align-self-center"></span>

            <!-- 오른쪽 로그인/회원가입 or 유저메뉴 -->
            <ul class="navbar-nav fw-semibold fs-6">
                <%
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    if (user == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link text-secondary" href="/login">Log In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-secondary" href="/user/signup">Sign Up</a>
                </li>
                <% } else { %>
                <li class="nav-item">
                    <a class="nav-link text-primary" href="#" tabindex="-1" aria-disabled="true" style="cursor: default;">
                        <%= user.getName() %>님 환영합니다.
                    </a>
                </li>
                <% if ("ADMIN".equals(user.getRole())) { %>
                <li class="nav-item">
                    <a class="nav-link text-secondary" href="/admin/main">관리자 페이지</a>
                </li>
                <% } %>
                <li class="nav-item">
                    <a class="nav-link text-secondary" href="/jsp/user/myPageHome">마이페이지</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-secondary" id="logoutLink" href="#">Logout</a>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const dropdownIds = [
            "parkingInfoDropdown",
            "priceDropdown",
            "supportDropdown"
        ];

        dropdownIds.forEach(function (id) {
            const link = document.getElementById(id);
            if (link) {
                link.addEventListener("click", function (e) {
                    window.location.href = link.href;
                });
            }
        });

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
            function pad(n) {
                return n.toString().padStart(2, '0');
            }
            document.getElementById('headerClock').textContent =
                pad(now.getHours()) + ':' + pad(now.getMinutes()) + ':' + pad(now.getSeconds());
        }

        updateClock();
        setInterval(updateClock, 1000);
    });
</script>