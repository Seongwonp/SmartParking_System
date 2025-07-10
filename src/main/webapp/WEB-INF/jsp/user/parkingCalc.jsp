<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주차 영수증</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
        }

        .main-content {
            flex: 1 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            padding-bottom: 20px;
        }

        footer, .footer {
            flex-shrink: 0;
            height: 60px; /* adjust based on your footer height */
        }

        body {
            background-color: #f4f4f4;
            font-family: 'Courier New', Courier, monospace;
            padding: 50px 0;
        }
        .receipt {
            background: #fff;
            width: 400px;
            margin: auto;
            padding: 30px;
            border: 2px dashed #333;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        .receipt h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .receipt hr {
            border: none;
            border-top: 1px dashed #333;
            margin: 15px 0;
        }
        .receipt .line {
            display: flex;
            justify-content: space-between;
            margin: 8px 0;
            font-size: 16px;
        }
        .total {
            text-align: center;
            margin-top: 20px;
            font-size: 20px;
            font-weight: bold;
        }
        .btn-home {
            display: block;
            margin: 30px auto 0;
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="/jsp/include/header.jsp" %>

<div class="main-content">
<% String msg = (String) request.getAttribute("message"); %>
<% if (msg != null) { %>
<div class="alert alert-success text-center" role="alert" style="margin-top: 20px;" data-aos="fade-down">
    <%= msg %>
</div>
<% } %>

<div class="receipt" data-aos="fade-up">
    <h2>영수증</h2>
    <hr>
    <div class="line">
        <span>차량번호</span>
        <span>${parkingDTO.carNumber}</span>
    </div>
    <div class="line">
        <span>입차시간</span>
        <span>${parkingDTO.entryTime}</span>
    </div>
    <div class="line">
        <span>출차시간</span>
        <span>${parkingDTO.exitTime}</span>
    </div>
    <hr>
    <div class="total">
        총 요금: ₩${parkingDTO.fee}
    </div>
    <hr>
    <div class="line" style="justify-content: center;">
        감사합니다. 안전운전하고 좋은하루 되세요!
    </div>
    <a href="${pageContext.request.contextPath}/index" class="btn btn-primary btn-home">메인으로</a>
</div>
</div>

<%@include file="/jsp/include/footer.jsp" %>

<script>
    const alertBox = document.querySelector('.alert-success');
    if (alertBox) {
        setTimeout(() => {
            alertBox.style.display = 'none';
        }, 3000);
    }
</script>
</body>
</html>