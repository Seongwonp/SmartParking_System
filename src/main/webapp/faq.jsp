<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자주 묻는 질문</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div class="container" style="margin-top: 150px;">
    <h2 class="text-center mb-4" data-aos="fade-up">자주 묻는 질문</h2>
  <div class="input-group input-group-lg mb-4" data-aos="fade-up" data-aos-delay="100">
    <input type="text" id="faqSearch" class="form-control" placeholder="궁금한 질문을 검색해 보세요">
    <button class="btn btn-outline-primary" type="button">
      <i class="fas fa-search"></i>
    </button>
  </div>
    <div class="accordion" id="faqAccordion" data-aos="fade-up" data-aos-delay="100">

        <div class="accordion-item">
            <h2 class="accordion-header" id="q1">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#a1"
                        aria-expanded="true" aria-controls="a1">
                    Q. 주차 요금은 어떻게 계산되나요?
                </button>
            </h2>
            <div id="a1" class="accordion-collapse collapse show" aria-labelledby="q1" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    기본요금 + 추가요금으로 계산되며, 경차/장애인 할인 및 월정액이 적용될 수 있습니다.
                </div>
            </div>
        </div>


        <div class="accordion-item">
            <h2 class="accordion-header" id="q2">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a2"
                        aria-expanded="false" aria-controls="a2">
                    Q. 정기권은 어떻게 등록하나요?
                </button>
            </h2>
            <div id="a2" class="accordion-collapse collapse" aria-labelledby="q2" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    마이페이지 → 정기권 메뉴에서 신청 및 결제 후 등록이 가능합니다.
                </div>
            </div>
        </div>


        <div class="accordion-item">
            <h2 class="accordion-header" id="q3">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a3"
                        aria-expanded="false" aria-controls="a3">
                    Q. 실시간 주차 현황은 어디서 확인하나요?
                </button>
            </h2>
            <div id="a3" class="accordion-collapse collapse" aria-labelledby="q3" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    메인 화면 또는 마이페이지에서 실시간 주차 공간 상태를 확인할 수 있습니다.
                </div>
            </div>
        </div>


        <div class="accordion-item">
            <h2 class="accordion-header" id="q4">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a4"
                        aria-expanded="false" aria-controls="a4">
                    Q. 주차는 몇 시간까지 가능한가요?
                </button>
            </h2>
            <div id="a4" class="accordion-collapse collapse" aria-labelledby="q4" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    일반 주차는 최대 24시간까지 가능하며, 그 이상은 초과 요금이 부과될 수 있습니다.
                </div>
            </div>
        </div>


        <div class="accordion-item">
            <h2 class="accordion-header" id="q5">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a5"
                        aria-expanded="false" aria-controls="a5">
                    Q. 월정액 등록 차량도 요금이 부과되나요?
                </button>
            </h2>
            <div id="a5" class="accordion-collapse collapse" aria-labelledby="q5" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    월정액 기간 내에 등록된 차량은 추가 요금 없이 이용 가능합니다. 다만 등록된 차량 외에는 요금이 부과됩니다.
                </div>
            </div>
        </div>


        <div class="accordion-item">
            <h2 class="accordion-header" id="q6">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a6"
                        aria-expanded="false" aria-controls="a6">
                    Q. 회원가입 없이도 이용할 수 있나요?
                </button>
            </h2>
            <div id="a6" class="accordion-collapse collapse" aria-labelledby="q6" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    비회원도 입차/출차는 가능하지만, 마이페이지 기능 및 정기권 등록 등은 회원만 이용 가능합니다.
                </div>
            </div>
        </div>


        <div class="accordion-item">
            <h2 class="accordion-header" id="q7">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a7"
                        aria-expanded="false" aria-controls="a7">
                    Q. 차량 정보를 수정하고 싶어요
                </button>
            </h2>
            <div id="a7" class="accordion-collapse collapse" aria-labelledby="q7" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    로그인 후 마이페이지 → 차량 관리 메뉴에서 차량 정보를 수정할 수 있습니다.
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <h2 class="accordion-header" id="q8">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a8"
                        aria-expanded="false" aria-controls="a8">
                    Q. 할인 대상 조건이 어떻게 되나요?
                </button>
            </h2>
            <div id="a8" class="accordion-collapse collapse" aria-labelledby="q8" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    경차, 장애인 등록 차량은 할인 대상입니다. 해당 정보는 차량 등록 시 자동으로 반영됩니다.
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
