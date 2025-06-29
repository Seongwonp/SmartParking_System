<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>차량등록</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin-top: 130px;
        }

        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .container {
            margin-top: 250px;
            margin-bottom: 30px;
            background-color: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 360px;
        }

        h2 {
            text-align: center;
            /*color: #4a97d8;*/
            margin-bottom: 40px;
        }

        label {
            display: block;
            margin-top: 16px;
            color: #555;
            font-weight: 500;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .button-group {
            margin-top: 24px;
            display: flex;
            justify-content: space-between;
        }

        input[type="submit"], input[type="button"] {
            width: 48%;
            padding: 12px;
            background-color: #4a97d8;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #3a7fc1;
        }
    </style>
</head>
<body>
<%@include file="/jsp/include/header.jsp" %>
<div class="container">
    <h2>차량 등록</h2>
    <form action="register" method="post">
        <label for="carNumber">차량 번호</label>
        <input type="text" id="carNumber" name="carNumber" required>

        <label for="carModel">차량 모델</label>
        <input type="text" id="carModel" name="carModel" required>

        <label for="ownerName">차량 소유자 이름</label>
        <input type="text" id="ownerName" name="ownerName" required>

        <label for="phone">연락처</label>
        <input type="text" id="phone" name="phone" required>

        <div class="button-group">
            <input type="submit" value="등록">
            <input type="button" value="취소">
        </div>
    </form>
</div>
<%@include file="/jsp/include/footer.jsp" %>
</body>
</html>