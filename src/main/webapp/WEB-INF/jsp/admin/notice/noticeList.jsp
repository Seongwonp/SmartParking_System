<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>공지사항 목록</title>
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
            min-height: 0;
            overflow: hidden;
        }
        #sidebar {
            width: 250px;
            height: calc(100vh - 106px); /* 헤더 높이만큼 빼기 */
            background-color: #212529;
            color: white;
            overflow-y: auto;
        }
        main.content {
            flex-grow: 1;
            overflow-y: auto;
            padding: 106px 30px 20px 30px;
            
        }
        tbody tr:hover {
            background-color: #f1f3f5;
            cursor: pointer;
        }
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
        /* Center align table header and cell content */
        .table th,
        .table td {
            text-align: center;
            vertical-align: middle;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
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
        <div class="container mt-4">
            <h2>공지사항 목록</h2>

            <div class="control-bar">
                <a href="${pageContext.request.contextPath}/admin/notice/add" class="btn btn-success">공지사항 추가</a>
                <c:if test="${not empty param.successMessage}">
                    <div id="successMsg" class="alert alert-success mt-3" role="alert">
                            ${param.successMessage}
                    </div>
                </c:if>
                <form class="search-form" action="${pageContext.request.contextPath}/admin/notice/list" method="get">
                    <input type="text" name="keyword" placeholder="제목 또는 작성자 검색" value="${param.keyword != null ? param.keyword : ''}" class="form-control" />
                    <button type="submit" class="btn btn-primary ms-2">검색</button>
                </form>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-secondary">
                    <tr>
                        <th scope="col">고정</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">조회수</th>
                        <th scope="col">작성일</th>
                        <th scope="col">관리</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="notice" items="${noticeList}" varStatus="status">
                        <tr>
                            <td>
                                <c:if test="${notice.pinned}">
                                    <span class="badge bg-danger text-white">고정</span>
                                </c:if>
                            </td>
                            <td>${notice.title}</td>
                            <td>${notice.writer}</td>
                            <td>${notice.view}</td>
                            <td>${notice.createdAt}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/notice/delete" method="post" style="display:inline;">
                                    <input type="hidden" name="noticeId" value="${notice.noticeId}" />
                                    <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                                </form>
                                <a href="${pageContext.request.contextPath}/admin/notice/modify?noticeId=${notice.noticeId}" class="btn btn-outline-primary btn-sm">수정</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty noticeList}">
                        <tr>
                            <td colspan="7" class="text-center">공지사항이 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>