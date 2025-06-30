<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>공지사항 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
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
            height: calc(100vh - 106px);
            background-color: #212529;
            color: white;
            overflow-y: auto;
        }
        main.content {
            flex-grow: 1;
            overflow-y: auto;
            padding: 106px 30px 20px 30px;
            max-width: 700px;
        }
    </style>
</head>
<body>

<%@ include file="/jsp/include/header.jsp" %>

<div id="page-wrapper">
    <nav id="sidebar">
        <%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>
    </nav>

    <main class="content">
        <div class="container">
            <h2>공지사항 등록</h2>

            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/admin/notice/add" method="post">
                <div class="mb-3">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title"
                           value="${param.title}" maxlength="255" required/>
                </div>

                <div class="mb-3">
                    <label for="content" class="form-label">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="10" required>${param.content}</textarea>
                </div>

                <div class="mb-3">
                    <label for="writer" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="writer" name="writer"
                           value="${param.writer}" maxlength="50" required/>
                </div>

                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="isPinned" name="isPinned" value="1"
                           <c:if test="${param.isPinned == '1'}">checked</c:if> />
                    <label class="form-check-label" for="isPinned">공지 고정</label>
                </div>

                <button type="submit" class="btn btn-primary">등록 완료</button>
                <a href="${pageContext.request.contextPath}/admin/notice/list" class="btn btn-secondary">목록으로</a>
            </form>
        </div>
    </main>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>