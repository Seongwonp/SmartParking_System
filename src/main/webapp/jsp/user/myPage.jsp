<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0 auto;
            display: flex;
            /*flex-direction: column;*/
        }

        body > .my-mage {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f9f9f9;
            margin-top: 140px;
            width: 100%;
        }

        body {
            background: #f9f9f9;
            font-family: sans-serif;
        }

        .my-mage .main-content {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            width: 100%;
            /*max-width: 1200px;*/
            /*gap: 40px;*/
        }
    
        .parking-status {
            /*width: 100%;*/
            display: flex;
            max-width: 1200px;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            border-radius: 0.375rem;
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
<%@include file="/jsp/include/header.jsp" %>
<div class="my-mage">
    <div class="main-content">
        <!-- 중앙 주차현황 카드 -->
        <div class="parking-status">
            <h4 class="mb-3">주차현황(예시)</h4>
            <table class="table table-bordered text-center">
                <thead class="table-light">
                <tr>
                    <th>차량번호</th>
                    <th>입차시간</th>
                    <th>출차시간</th>
                    <th>주차위치</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>12가 3456</td>
                    <td>2025-06-27 08:30</td>
                    <td>-</td>
                    <td>B2 101</td>
                    <td class="text-success">주차중</td>
                </tr>
                </tbody>
            </table>
        </div>
        <!-- 우측 사용자 프로필 카드 -->
        <div>
            <%@include file="/jsp/user/myPage_profile.jsp" %>
        </div>
    </div>
</div>
<%@include file="/jsp/include/footer.jsp" %>
</body>
</html>
