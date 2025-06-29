<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav id="sidebarMenu" class="d-md-block bg-dark sidebar vh-100 position-fixed" style="top: 106px; width: 250px; height: calc(100vh - 106px);">
    <div class="position-sticky pt-3">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active text-white fw-bold d-flex align-items-center" aria-current="page" href="${pageContext.request.contextPath}/admin/adminMain.jsp">
                    <i class="fas fa-tachometer-alt me-2"></i>
                    대시보드
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-secondary d-flex align-items-center" href="${pageContext.request.contextPath}/admin/feePolicy.jsp">
                    <i class="fas fa-money-bill-wave me-2"></i>
                    요금 정책 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-secondary d-flex align-items-center" href="${pageContext.request.contextPath}/admin/discountPolicy.jsp">
                    <i class="fas fa-tags me-2"></i>
                    할인 정책 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-secondary d-flex align-items-center" href="${pageContext.request.contextPath}/admin/memberManage.jsp">
                    <i class="fas fa-users me-2"></i>
                    회원/정기권 관리
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-secondary d-flex align-items-center" href="${pageContext.request.contextPath}/admin/parkingRecords.jsp">
                    <i class="fas fa-parking me-2"></i>
                    주차 기록 조회
                </a>
            </li>
            <!-- 추가된 공지사항 등록/수정 메뉴 -->
            <li class="nav-item">
                <a class="nav-link text-secondary d-flex align-items-center" href="${pageContext.request.contextPath}/admin/noticeManage.jsp">
                    <i class="fas fa-bullhorn me-2"></i>
                    공지사항 등록/수정
                </a>
            </li>
        </ul>
    </div>
</nav>