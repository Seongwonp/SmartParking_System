<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>출차 및 요금 확인</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: "Noto Sans KR", sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 30px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-top: 80px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: bold;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #0d6efd;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 4px;
        }

        .submit-btn:hover {
            background-color: #0b5ed7;
        }

        .result-box {
            margin-top: 30px;
            padding: 15px;
            background-color: #e9ecef;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div class="container">
    <h1>출차 및 요금 확인</h1>
    <form action="outparking_process.jsp" method="post">
        <div class="mb-3">
            <label for="carNumber" class="form-label">차량 번호</label>
            <input type="text" class="form-control" id="carNumber" name="carNumber" placeholder="예: 12가3456" required>
        </div>
        <button type="submit" class="submit-btn">출차 확인</button>
    </form>

    <%-- 출차 결과가 있을 경우 출력 예시 --%>
    <%
        String carNum = request.getParameter("carNumber");
        String entryTime = request.getParameter("entryTime");  // 예: DB 또는 세션에서 불러옴
        String exitTime = request.getParameter("exitTime");
        String fee = request.getParameter("fee");
        if (carNum != null && fee != null) {
    %>
    <div class="result-box">
        <p><strong>차량번호:</strong> <%= carNum %></p>
        <p><strong>입차 시간:</strong> <%= entryTime %></p>
        <p><strong>출차 시간:</strong> <%= exitTime %></p>
        <p><strong>총 주차 요금:</strong> <%= fee %> 원</p>
    </div>
    <% } %>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
