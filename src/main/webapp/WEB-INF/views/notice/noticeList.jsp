<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>공지사항 - SmartParking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
    <style>
        .banner {
            background: linear-gradient(135deg, #4e73df, #224abe);
            color: white;
            padding: 80px 20px;
            text-align: center;
            margin-top: 100px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        .banner h1 {
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.5);
        }

        .notice-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        table.notice-table thead {
            background-color: #224abe;
            color: #fff;
        }

        table.notice-table tbody tr:hover {
            background-color: #eef3fb;
            transition: background-color 0.3s ease;
        }

        table.notice-table td, table.notice-table th {
            vertical-align: middle;
            text-align: center;
            padding: 1rem;
        }

        a.notice-title {
            color: #224abe;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        a.notice-title:hover {
            color: #102766;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div class="banner" data-aos="fade-down">
    <h1 class="display-4 fw-bold">
        <i class="fa-solid fa-bullhorn me-3"></i>공지사항
    </h1>
</div>

<div class="container my-5" data-aos="fade-up">
    <c:choose>
        <c:when test="${empty noticeList}">
            <div class="alert alert-info text-center p-4 fs-5">
                <i class="fa-solid fa-circle-info me-2"></i> 공지사항이 없습니다.
            </div>
        </c:when>
        <c:otherwise>
            <div class="card notice-card">
                <div class="table-responsive">
                    <table class="table notice-table mb-0">
                        <thead>
                        <tr>
                            <th scope="col">제목</th>
                            <th scope="col" style="width: 150px;">작성자</th>
                            <th scope="col" style="width: 100px;">조회수</th>
                            <th scope="col" style="width: 150px;">작성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="notice" items="${noticeList}">
                            <tr
                                class="${notice.pinned ? 'table-danger' : ''}"
                                onclick="location.href='/notice/detail?noticeId=${notice.noticeId}';"
                                style="cursor:pointer;">
                                <td style="text-align:center;">
                                  <c:if test="${notice.pinned}">
                                    <span class="badge bg-danger me-2">
                                      <i class="fa-solid fa-bullhorn"></i> 공지
                                    </span>
                                  </c:if>
                                  <a href="/notice/detail?noticeId=${notice.noticeId}" class="notice-title">
                                    <i class="fa-regular fa-file-lines me-2"></i>${notice.title}
                                  </a>
                                </td>
                                <td>${notice.writer}</td>
                                <td class="text-muted">${notice.view}</td>
                                <td class="text-muted">${notice.createdAt}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>