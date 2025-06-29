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
            margin-top: 140px;
        }

        body > .my-page .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /*멤버쉽혜택 */
        .membership-status {
            width: 800px;
            max-width: 1200px;
            margin: 20px auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            border-radius: 0.375rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .membership-status > h2 {
            text-align: center;
            color: #333;
            margin-bottom: 16px;
        }

        .membership-benefit {
            display: flex;
            justify-content: space-around;
            margin-bottom: 32px;
            gap: 24px;
        }

        .box {
            background: linear-gradient(145deg, #ffffff, #f2f2f2);
            border-radius: 16px;
            padding: 30px;
            width: 280px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            border: 1px solid #e0e0e0;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .box:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.12);
        }

        .box.shopping {
            border: 2px solid #2ecc71;
        }

        .box.contents {
            border: 2px solid #3498db;
        }

        .item {
            display: flex;
            align-items: center;
            margin-bottom: 14px;
        }

        .item img {
            width: 24px;
            height: 24px;
            margin-right: 12px;
        }

        .item span {
            font-size: 15px;
            color: #222;
        }

        /*멤버쉽가입*/
        .agreement-container {
            width: 650px;
            margin: 0 auto;
        }
        .agreement-box {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            background-color: #fff;
            margin-bottom: 20px;
            font-size: 13px;
        }

        .agreement-box label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="checkbox"] {
            margin-right: 8px;
        }

        .submit-btn {
            width: 100%;
            align-items: center;
            padding: 12px;
            background-color: #878787;
            color: white;
            font-size: 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #218838;
        }

        .membership-select {
            width: 100%;
            margin-bottom: 20px;
        }

        .agreement-container,
        .agreement-box,
        .submit-btn,
        .membership-select {
            width: 100%;
        }

        .form-select {
            padding: 8px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .membership-benefit {
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .box {
            flex: 1 1 45%;
            margin: 10px;
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
        <!-- 중앙 멤버쉽 카드 -->
        <div class="membership-status">
            <h2 class="mb-3">My 멤버십</h2>
            <h4 class="mb-3">멤버십 혜택</h4>
            <form action="/membership" method="post">
                <div class="membership-benefit">
                    <div class="box shopping">
                        <h3>연정액 혜택</h3>
                        <div class="item"><span>연 1,000,000원(무제한)</span></div>
                        <div class="item"><span>멤버쉽 최대 10% 적립</span></div>
                        <div class="item"><span>경차 30%할인</span></div>
                        <div class="item"><span>장애인 50%할인</span></div>
                    </div>
                    <div class="box contents">
                        <h3>월정액 혜택</h3>
                        <div class="item"><span>월 120,000원(무제한)</span></div>
                        <div class="item"><span>멤버쉽 최대 5% 적립</span></div>
                        <div class="item"><span>경차 30%할인</span></div>
                        <div class="item"><span>장애인 50%할인</span></div>
                    </div>
                </div>
                <div class="agreement-container">
                    <h4>멤버십 가입하기</h4>
                    <div class="membership-select mb-4">
                        <label for="membershipType" class="form-label">멤버십 종류 선택</label>
                        <select id="membershipType" name="membershipType" class="form-select">
                            <option value="annual">연정액</option>
                            <option value="monthly">월정액</option>
                        </select>
                    </div>

                    <div class="agreement-box">
                        <label><input type="checkbox" class="agree"> [필수] 만 14세 이상입니다</label>
                        <label><input type="checkbox" class="agree"> [필수] 이용약관 동의</label>
                        <label><input type="checkbox" class="agree"> [선택] 마케팅 정보 수신 동의</label>
                    </div>
                    <button type="submit" class="submit-btn">멤버쉽 혜택 시작하기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="/jsp/include/footer.jsp" %>
</body>
</html>
