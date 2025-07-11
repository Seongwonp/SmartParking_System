<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>등록차량목록</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        /*프로필카드와 남은공간 배치*/
        html, body {
            height: 100%;
            margin: 0 auto;
            display: flex;
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
        .main-content > .container {
            width: 800px;
            /*flex: 1; !* 남는 공간 모두 차지 *!*/
        }
        /*등록차량목록 카드*/
        .car-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            max-width: 900px;
            border-radius: 12px;
            overflow: hidden;
        }

        .car-table thead {
            background-color: #4a97d8;
            color: white;
        }

        .car-table th, .car-table td {
            padding: 14px 18px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        .car-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .car-table tbody tr:hover {
            background-color: #eef6ff;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .container {
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<%@include file="/jsp/include/header.jsp" %>
<div class="my-page">
   <div class="main-content">
        <!-- 우측 프로필 카드 -->
        <div>
            <%@include file="/jsp/user/myPage_profile.jsp" %>
        </div>
        <!-- 중앙 동록차량 목록 카드 -->
        <div class="container">
            <h2>등록 차량 목록</h2>
            <table class="car-table">
                <thead>
                <tr>
                    <th>차량 번호</th>
                    <th>차량 모델</th>
                    <th>타입</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="dto" items="${carList}">
                    <tr>
                        <td>${dto.carNumber}</td>
                        <td>${dto.carModel}</td>
                        <td>${dto.carType}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@include file="/jsp/include/footer.jsp" %>
</body>
</html>