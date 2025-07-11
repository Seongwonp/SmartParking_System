<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        /*프로필카드와 남은공간 배치*/
        html, body {
            height: 100%;
            margin: 0 auto;
            display: flex;
            /*flex-direction: column;*/
        }
        body {
            background: #f9f9f9;
            font-family: sans-serif;
        }

        body > .my-page {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f9f9f9;
            top: 20%;
        }

        body> .my-page .main-content {
            display: flex;
        }

        /*주차현황카드 */
        .parking-status {
            width: 800px;
            max-width: 1200px;
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 0.375rem;
        }
        .parking-status>h2 {
            text-align: center;
            color: #333;
        }
        .parking-status thead th{
            background-color: #4a97d8;
            color: white;
        }
    </style>
</head>
<body>
<%@include file="/jsp/include/header.jsp" %>
<% String msg = (String) request.getAttribute("successMsg"); %>
<% if (msg != null) { %>
<div class="alert alert-success text-center" role="alert" style="margin-top: 100px;">
    <%= msg %>
</div>
<% } %>

<div class="my-page">
    <div class="main-content">
        <!-- 우측 프로필 카드 -->
        <div>
            <%@include file="/jsp/user/myPage_profile.jsp" %>
        </div>
        <!-- 중앙 주차현황 카드 -->
        <div class="parking-status">
            <h2 class="mb-3">주차현황</h2>
            <table class="table table-bordered text-center">
                <thead class="table-light">
                <tr>
                    <th>차량번호</th>
                    <th>입차시간</th>
                    <th>출차시간</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="record" items="${parkingStatusList}">
                    <tr>
                        <td>${record.carNumber}</td>
                        <td>${record.entryTime}</td>
                        <td>
                            <c:choose>
                                <c:when test="${record.exitTime != null}">
                                    ${record.exitTime}
                                </c:when>
                                <c:otherwise>-</c:otherwise>
                            </c:choose>
                        </td>
                        <td class="text-success">
                            <c:choose>
                                <c:when test="${record.exitTime == null}">주차중</c:when>
                                <c:otherwise>출차완료</c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="/jsp/include/footer.jsp" %>
<script>
    const alertBox = document.querySelector('.alert-success');
    if (alertBox) {
        setTimeout(() => {
            alertBox.style.display = 'none';
        }, 3000);
    }
</script>
</body>
</html>
