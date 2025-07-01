<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>회원 목록</title>
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
        <div style="padding: 24px;">
            <%@include file="/WEB-INF/jsp/admin/user/listNav.jsp"%>
        </div>
        <div class="container mt-4">
            <h2>회원 목록</h2>

            <div class="control-bar">
                <c:if test="${not empty successMessage}">
                    <div id="successMsg" class="alert alert-success mt-3" role="alert">
                            ${successMessage}
                    </div>
                </c:if>

                <form class="search-form" action="${pageContext.request.contextPath}/admin/user/list" method="get">
                    <select name="op" class="form-select me-2" style="width:auto;">
                        <option value="userName" <c:if test="${param.op == 'userName' || empty param.op}">selected</c:if>>아이디</option>
                        <option value="name" <c:if test="${param.op == 'name'}">selected</c:if>>이름</option>
                        <option value="phone" <c:if test="${param.op == 'phone'}">selected</c:if>>전화번호</option>
                    </select>
                    <input type="text" name="keyword" placeholder="회원명 또는 아이디 검색" value="${param.keyword != null ? param.keyword : ''}" class="form-control me-2" />
                    <button type="submit" class="btn btn-primary">검색</button>
                </form>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-secondary">
                    <tr>
                        <th scope="col">아이디</th>
                        <th scope="col">이름</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">가입일</th>
                        <th scope="col">동작</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td class="toggle-cars" data-user-id="${user.userId}" style="cursor: pointer;">
                                ${user.userName}
                            </td>
                            <td>${user.name}</td>
                            <td>${user.phone}</td>
                            <td>${user.joinDate}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/user/delete" method="post" style="display:inline;">
                                    <input type="hidden" name="userId" value="${user.userId}" />
                                    <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">
                                        삭제
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <tr id="car-list-${user.userId}" style="display:none;">
                            <td colspan="5">
                                <div class="car-list-placeholder">
                                    차량 정보를 불러오는 중입니다...
                                </div>
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