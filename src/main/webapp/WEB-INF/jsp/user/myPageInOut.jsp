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

        /*최근입출차내역카드 */
        .inOut-status {
            width: 800px;
            max-width: 1200px;
            margin:20px auto;
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 0.375rem;
        }
        .inOut-status>h2 {
            text-align: center;
            color: #333;
        }
        .inOut-status thead th{
            background-color: #4a97d8;
            color: white;
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
        <!-- 중앙 최근입출차내역 카드 -->
        <div class="inOut-status">
            <h2 class="mb-3">최근입출차내역</h2>
            <table class="table table-bordered text-center">
                <thead class="table-light">
                <tr>
                    <th>NO</th>
                    <th>입차시간</th>
                    <th>출차시간</th>
                    <th>요금</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>2025-06-27</td>
                    <td>08:30</td>
                    <td>14:30</td>
                    <td class="text-success">8000원</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2025-06-25</td>
                    <td>09:30</td>
                    <td>13:30</td>
                    <td class="text-success">4000원</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="/jsp/include/footer.jsp" %>
</body>
</html>
