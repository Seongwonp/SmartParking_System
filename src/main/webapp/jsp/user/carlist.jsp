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
        body{
            background-color: #f9f9f9;
        }
        .car-table {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Segoe UI', sans-serif;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
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
            font-family: 'Segoe UI', sans-serif;
            margin-top: 40px;
            color: #333;
        }

        .container {
            padding: 20px;
            margin-top: 150px;
            background-color: white;
        }
    </style>
</head>
<body>
<%@include file="/jsp/include/header.jsp" %>
<div class="container">
    <h2>등록 차량 목록</h2>
    <table class="car-table">
        <thead>
        <tr>
            <th>NO</th>
            <th>차량 번호</th>
            <th>차량 모델</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>12가8255</td>
            <td>AVANTE</td>
        </tr>
        <tr>
            <td>2</td>
            <td>42소1253</td>
            <td>Lexus</td>
        </tr>
        <tr>
            <td>3</td>
            <td>28나0625</td>
            <td>VENUS</td>
        </tr>
        </tbody>
    </table>
</div>
<%@include file="/jsp/include/footer.jsp" %>
</body>
</html>