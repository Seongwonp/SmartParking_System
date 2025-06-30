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
            margin-top: 140px;
        }

        body > .my-page .main-content {
            display: flex;
        }

        /*차량등록카드 */
        .reg-container {
            background-color: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 430px;
            margin-bottom: 30px;
        }
        h2 {
            text-align: center;
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
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #3a7fc1;
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
        <!-- 중앙 차량등록 카드 -->
        <div class="reg-container">
            <h2>차량 등록</h2>
            <form action="${pageContext.request.contextPath}/user/myPageCarForm" method="post">
                <label for="carNumber">차량 번호</label>
                <input type="text" id="carNumber" name="carNumber" value ="${carinfo.getCarNumber()}" required>

                <label for="carModel">차량 모델</label>
                <input type="text" id="carModel" name="carModel" value ="${carinfo.getCarModel()}" required>

                <label for="carType" class="form-label">차량 타입</label>
                <select id="carType" name="carType" class="form-select" >
                    <option value="annual">일반</option>
                    <option value="monthly">경차</option>
                    <option value="monthly">장애인</option>
                </select>

                <div class="button-group">
                    <input type="submit" value="등록">
                    <input type="button" value="취소">
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="/jsp/include/footer.jsp" %>
</body>
</html>