<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
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
            margin: 40px auto;
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

        /*멤버쉽가입*/
        .agreement-container,
        .agreement-box,
        .submit-btn,
        .membership-select {
            width: 100%;
        }
        .agreement-container {
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
            padding: 14px;
            background-color: #878787;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.4s ease;
        }

        .submit-btn:hover {
            background: linear-gradient(45deg, #45a049, #1e88e5);
        }

        .membership-select {
            margin-bottom: 20px;
        }

        .form-select {
            padding: 8px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        .membership-join {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #ddd;
        }
    </style>
</head>
<body>
<c:if test="${not empty errorMsg}">
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog" data-aos="zoom-in">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-danger" id="errorModalLabel">🚫 멤버십 안내</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
                </div>
                <div class="modal-body">
                        ${errorMsg}
                </div>
                <div class="modal-footer">
                    <a href="/contact/Q&A" class="btn btn-secondary">문의하기</a>
                    <button type="button" class="btn btn-primary" onclick="history.back()">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        window.onload = function () {
            const myModal = new bootstrap.Modal(document.getElementById('errorModal'));
            myModal.show();
        };
    </script>
</c:if>

<%@include file="/jsp/include/header.jsp" %>
<div class="my-page">
    <div class="main-content">
        <div>
            <%@include file="/jsp/user/myPage_profile.jsp" %>
        </div>
        <div class="membership-status">
            <h2 class="mb-3">My 멤버십</h2>
            <h4 class="mb-3">멤버십 혜택</h4>
            <form action="/user/subscription/join" method="post">
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
                <div class="membership-join">
                    <div class="agreement-container">
                        <h4>멤버십 가입하기</h4>
                        <div class="membership-select mb-4">
                            <label for="membershipType" class="form-label">멤버십 종류 선택</label>
                            <select id="membershipType" name="membershipType" class="form-select">
                                <option value="annual">연정액</option>
                                <option value="monthly">월정액</option>
                            </select>
                        </div>

                        <div class="membership-select mb-4">
                            <label for="carId" class="form-label">차량 선택</label>
                            <select id="carId" name="carId" class="form-select">
                                <c:forEach var="car" items="${myCarList}">
                                    <option value="${car.carId}">
                                        ${car.carNumber} (${car.carModel})
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="agreement-box">
                            <label><input type="checkbox" name="agree1" class="agree"> [필수] 만 14세 이상입니다</label>
                            <label><input type="checkbox" name="agree2" class="agree"> [필수] 이용약관 동의</label>
                            <label><input type="checkbox" name="agree3" class="agree"> [선택] 마케팅 정보 수신 동의</label>
                        </div>
                        <input type="hidden" name="userId" value="${userId}" />
                        <button type="submit" class="submit-btn">멤버쉽 혜택 시작하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="/jsp/include/footer.jsp" %>
<script>
  document.querySelector('form').addEventListener('submit', function(e) {
    const agree1 = document.querySelector('input[name="agree1"]');
    const agree2 = document.querySelector('input[name="agree2"]');
    if (!agree1.checked || !agree2.checked) {
      alert('필수 동의 항목을 모두 체크해 주세요.');
      e.preventDefault();
    }
  });
</script>
</body>
</html>
