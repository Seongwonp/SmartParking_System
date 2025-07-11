<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav id="sidebarMenu"
     class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse"
     style="height: calc(100vh - 106px); width: 250px;">
    <div class="position-sticky pt-3" style="top: 106px;">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link
                    ${currentPage eq 'main' ? 'active text-white fw-bold' : 'text-secondary'}
                   d-flex align-items-center"
                   href="${pageContext.request.contextPath}/admin/main">
                    <i class="fas fa-tachometer-alt me-2"></i>
                    대시보드
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link
                    ${currentPage eq 'feePolicyList' ? 'active text-white fw-bold' : 'text-secondary'}
                    d-flex align-items-center"
                   href="${pageContext.request.contextPath}/admin/feePolicy/list">
                    <i class="fas fa-money-bill-wave me-2"></i>
                    요금 정책 관리
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link
                 ${currentPage eq 'discountPolicyList' ? 'active text-white fw-bold' : 'text-secondary'}
                 d-flex align-items-center"
                   href="${pageContext.request.contextPath}/admin/discountPolicy/list">
                    <i class="fas fa-tags me-2"></i>
                    할인 정책 관리
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link
                    ${currentPage eq 'memberManage' ? 'active text-white fw-bold' : 'text-secondary'}
                    d-flex align-items-center"
                   href="${pageContext.request.contextPath}/admin/user/list">
                    <i class="fas fa-users me-2"></i>
                    회원/정기권 관리
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link
                    ${currentPage eq 'parkingRecords' ? 'active text-white fw-bold' : 'text-secondary'}
                    d-flex align-items-center"
                   href="${pageContext.request.contextPath}/admin/parking/history">
                    <i class="fas fa-parking me-2"></i>
                    주차 기록 조회
                </a>
            </li>


            <li class="nav-item">
                <a class="nav-link
                    ${currentPage eq 'parkingStatus' ? 'active text-white fw-bold' : 'text-secondary'}
                    d-flex align-items-center"
                   href="${pageContext.request.contextPath}/admin/parkingList">
                    <i class="fas fa-parking me-2"></i>
                    차량 출차 처리
                </a>
            </li>




            <li class="nav-item">
                <a class="nav-link
                    ${currentPage eq 'noticeList' ? 'active text-white fw-bold' : 'text-secondary'}
                    d-flex align-items-center"
                   href="${pageContext.request.contextPath}/admin/notice/list">
                    <i class="fas fa-bullhorn me-2"></i>
                    공지사항 등록/수정
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link
                    ${currentPage eq 'List' ? 'active text-white fw-bold' : 'text-secondary'}
                    d-flex align-items-center"
                   href="${pageContext.request.contextPath}/admin/List">
                    <i class="fas fa-bullhorn me-2"></i>
                    관리자 목록 / 관리
                </a>
            </li>

        </ul>
    </div>
</nav>