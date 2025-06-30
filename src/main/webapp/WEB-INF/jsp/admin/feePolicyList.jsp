<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>요금정책 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        #page-wrapper {
            flex: 1;
            display: flex;
            flex-direction: row;
            height: calc(100vh - 106px);
            overflow: hidden;
        }
        #sidebar {
            width: 250px;
            background-color: #212529;
            color: white;
            overflow-y: auto;
            flex-shrink: 0;
        }
        main.content {
            flex-grow: 1;
            padding: 150px 30px;
            overflow-y: auto;
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }
        main.content > * {
            max-width: 100%;
            overflow-wrap: break-word;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<div id="page-wrapper">
    <nav id="sidebar">
        <%@ include file="/WEB-INF/jsp/admin/adminSidebar.jsp" %>
    </nav>
    <main class="content">
        <div class="container">
            <h2>요금정책 목록</h2>

            <div class="row">
                <c:forEach var="policy" items="${feeList}">
                    <div class="col-md-8 col-lg-6 mb-4">
                        <div class="card h-100">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                <span>${policy.policyName}</span>
                                <a href="${pageContext.request.contextPath}/admin/feePolicy/add"
                                   class="btn btn-success btn-sm"
                                   style="font-size: 0.75rem; padding: 0.25rem 0.5rem;">
                                    요금제 추가
                                </a>
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    <strong>기본시간:</strong> ${policy.baseTime} 분<br/>
                                    <strong>기본요금:</strong> ${policy.baseFee} 원<br/>
                                    <strong>추가시간:</strong> ${policy.additionalTime} 분마다 ${policy.additionalFee} 원<br/>
                                    <strong>일일최대요금:</strong> ${policy.dailyMaxFee} 원
                                </p>
                                <a href="${pageContext.request.contextPath}/admin/feePolicy/modify?policyId=${policy.policyId}" class="btn btn-outline-primary">
                                    수정하기
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>
</div>
<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>