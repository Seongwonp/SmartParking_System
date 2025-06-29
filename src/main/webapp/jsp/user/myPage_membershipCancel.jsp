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
            max-width: 900px;
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
            color: #2c3e50;
            font-size: 30px;
            margin-bottom: 32px;
            padding-bottom: 10px;
        }

        .membership-status h4 {
            color: #2c3e50;
            font-size: 22px;
            margin-top: 30px;
            margin-bottom: 20px;
            border-left: 6px solid #4a97d8;
            padding-left: 14px;
        }

        .membership-benefit {
            display: flex;
            justify-content: space-between;
            margin-bottom: 32px;
            gap: 20px;

        }

        .box {
            background: linear-gradient(145deg, #ffffff, #f2f2f2);
            border-radius: 16px;
            padding: 30px;
            width: 300px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #e0e0e0;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            flex: 1 1 45%;
            margin: 10px;
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

        /*멤버쉽해지*/

        .membership-cancel-page,
        .btn-group{
            width: 100%;
        }
        .membership-cancel-page {
            margin: 0 auto;
        }

        .membership-period {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 16px;
            font-weight: bold;
            display: flex;
            align-items: center;
            border: 1px solid #cde9df;
        }

        .cancel-box h3 {
            font-size: 18px;
            margin-bottom: 12px;
        }

        .membership-card {
            background: white;
            border: 1px solid #dfe5ef;
            padding: 20px;
            border-radius: 10px;
        }

        .plan-type {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 16px;
        }

        .info div {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .warning-box {
            background-color: #fff7f5;
            border: 1px solid #f2c7c2;
            color: #c0392b;
            padding: 20px;
            margin-top: 30px;
            border-radius: 8px;
            font-size: 14px;
            line-height: 1.6;
        }

        .btn-group {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .cancel-btn,
        .back-btn {
            background: #878787;
            color: white;
            border: none;
            padding: 14px 28px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
            min-width: 180px;
            width: 48%;
        }

        .cancel-btn:hover,
        .back-btn:hover {
            background: linear-gradient(45deg, #ff3b3b, #c0392b);
        }
        .membership-cancel {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
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
                <div class="membership-cancel">
                    <h4 class="mb-3">멤버십 가입정보</h4>
                    <div class="membership-cancel-page">
                        <div class="membership-period">
                            <strong>멤버십 이용기간</strong>
                            <span>25.06.24 ~ 25.07.23</span>
                        </div>

                        <div class="cancel-box">
                            <h3>사용 중인 멤버십</h3>
                            <div class="membership-card">
                                <div class="plan-type">월간 이용권</div>
                                <div class="info">
                                    <div><span>이용 기간</span><span>25.06.24 ~ 25.07.23</span></div>
                                    <div><span>결제 금액</span><span>₩120,000</span></div>
                                </div>
                            </div>
                        </div>

                        <div class="warning-box">
                            <p>멤버십 해지 시, 다음 결제일부터 멤버십 혜택이 중단됩니다.<br>
                                이미 결제된 금액은 환불되지 않습니다.</p>
                        </div>

                        <div class="btn-group">
                            <button type="submit" class="cancel-btn">멤버십 해지하기</button>
                            <button type="button" class="back-btn">멤버십 유지하기</button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<%@include file="/jsp/include/footer.jsp" %>
</body>
</html>
