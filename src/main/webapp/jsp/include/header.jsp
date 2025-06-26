<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String user = (String) session.getAttribute("userName");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index_public.jsp">스마트파킹</a>
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
                            <li><a class="dropdown-item" href="/status">주차현황</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            차량검색
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="searchDropdown">
                            <li><a class="dropdown-item" href="/search.do">검색하기</a></li>
                            <li><a class="dropdown-item" href="/search/history">검색 기록</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="feeDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            요금제
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="feeDropdown">
                            <li><a class="dropdown-item" href="/fee.do">요금 안내</a></li>
                            <li><a class="dropdown-item" href="/discount">할인 정보</a></li>
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
                <li class="nav-item"><a class="nav-link" href="/jsp/user/login.jsp">Log In</a></li>
                <li class="nav-item"><a class="nav-link" href="/jsp/user/signup.jsp">Sign Up</a></li>
                <% } else { %>
                <li class="nav-item"><a class="nav-link" href="/user/myPage.jsp">마이페이지</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
