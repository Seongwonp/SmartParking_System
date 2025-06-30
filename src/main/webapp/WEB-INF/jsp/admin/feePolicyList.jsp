<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>요금정책 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
    <style>
        .container {
            margin-top: 150px; /* 헤더 높이와 맞춰 조절 */
            padding-left: 15px;
            padding-right: 15px;
            margin-bottom: 60px;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>

<div class="container">
    <h2>요금정책 목록</h2>

    <c:forEach var="policy" items="${feeList}">
        <div class="card mb-3">
            <div class="card-header bg-primary text-white">
                    ${policy.policyName}
            </div>
            <div class="card-body">
                <p class="card-text">
                    <strong>기본시간:</strong> ${policy.baseTime} 분<br/>
                    <strong>기본요금:</strong> ${policy.baseFee} 원<br/>
                    <strong>추가시간:</strong> ${policy.additionalTime} 분마다 ${policy.additionalFee} 원<br/>
                    <strong>일일최대요금:</strong> ${policy.dailyMaxFee} 원
                </p>
                <a href="${pageContext.request.contextPath}/admin/feePolicy/modify?policyId=${policy.policyId}"
                   class="btn btn-outline-primary">
                    수정하기
                </a>
            </div>
        </div>
    </c:forEach>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>