<%@ page import="com.opentime.smartparking_system.model.dto.UserDTO" %>
<%@ page import="com.sun.jna.platform.win32.Netapi32Util" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand mx-auto" href="${pageContext.request.contextPath}/index_public.jsp">
            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="SmartParking Logo" id="title_img"
                 height="80">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarContent">
            <ul class="navbar-nav mx-auto">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/intro.jsp" id="parkingInfoDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        이용안내
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="parkingInfoDropdown">
                        <li><a class="dropdown-item" href="/intro.jsp">주차장 소개</a></li>
                        <li><a class="dropdown-item" href="/guide.jsp">주차 안내</a></li>
                        <li><a class="dropdown-item" href="/location.jsp">오시는 길</a></li>
                    </ul>
                </li>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/fee/list" id="priceDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        이용요금
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="priceDropdown">
                        <li><a class="dropdown-item" href="/fee/list">요금제 안내</a></li>
                        <li><a class="dropdown-item" href="/fee/list#discount-info">할인 정보</a></li>
                    </ul>
                </li>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/contact.jsp" id="supportDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        고객지원
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="supportDropdown">
                        <li><a class="dropdown-item" href="/contact.jsp">문의하기</a></li>
                        <li><a class="dropdown-item" href="/faq.jsp">자주 묻는 질문</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/notice/list">공지사항</a>
                </li>
            </ul>
            <%
                UserDTO user = (UserDTO) session.getAttribute("user");
            %>

            <ul class="navbar-nav">
                <% if (user == null) { %>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Log In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/signup">Sign Up</a>
                </li>
                <% } else { %>
                <li class="nav-item">
                <a class="nav-link text-primary fw-normal fs-7" href="#" tabindex="-1" aria-disabled="true" style="cursor: default;">
                    <%= user.getName() %>님 환영합니다.
                </a>
                </li>
                <% if ("ADMIN".equals(user.getRole())) { %>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/main">관리자 페이지</a>
                </li>
                <% } %>
                <li class="nav-item">
                    <a class="nav-link" href="/jsp/user/myPage_parkingStatus.jsp">마이페이지</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="logoutLink" href="#">Logout</a>
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

    });
</script>
