<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>오시는 길</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <!-- AOS CSS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        .banner {
            background: linear-gradient(45deg, #63b1f6, #6610f2);
            color: #fff;
            padding: 80px 20px;
            text-align: center;
        }

        #map {
            width: 100%;
            height: 400px;
            border: 1px solid #dee2e6;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
    </style>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=316bcac2617d04ed9ceb6035800b9bea"></script>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>
<div class="banner" data-aos="fade-down">
    <h1 class="display-4 fw-bold">오시는 길</h1>
</div>
<div class="container my-5" data-aos="fade-up">
    <h2 class="mb-4 fw-bold">SmartParking 반월당점 오시는 길</h2>
    <div id="map"></div>

    <script>
        const container = document.getElementById('map');
        const options = {
            center: new kakao.maps.LatLng(35.863431, 128.593195),
            level: 3
        };

        const map = new kakao.maps.Map(container, options);

        const markerPosition  = new kakao.maps.LatLng(35.863431, 128.593195);

        const marker = new kakao.maps.Marker({
            position: markerPosition
        });

        marker.setMap(map);
    </script>
    <p><i class="fas fa-map-marker-alt me-2"></i> 대구광역시 중구 반월당로 00</p>
    <p><i class="fas fa-phone me-2"></i> 053-123-4567</p>

    <h4 class="fw-bold mt-4 mb-3"><i class="fas fa-subway me-2"></i>대중교통 이용 시</h4>
    <ul class="list-unstyled ps-3">
        <li><b>지하철</b></li>
        <li><span class="badge bg-danger">1호선</span> , <span class="badge bg-success">2호선</span>  반월당역 3번 출구 도보 2분</li>
        <li><b>버스</b></li>
        <li>
            <span class="badge bg-primary">234</span> ,
            <span class="badge bg-primary">309</span> ,
            <span class="badge bg-primary">425</span> 번 반월당 정류장 하차
        </li>
        <li>
            <span class="badge bg-danger">급행2</span> ,
            <span class="badge bg-success">990</span> ,
            <span class="badge bg-primary">609</span> 번 2호선 반월당역 정류장 하차
        </li>
    </ul>

    <h4 class="fw-bold mt-4 mb-3"><i class="fas fa-car me-2"></i>자가용 이용 시</h4>
    <ul class="list-unstyled ps-3">
        <li>달구벌대로 → 중앙네거리 방면 → 반월당역 방면 좌회전</li>
        <li>주차장 입구는 반월당로에서 진입</li>
    </ul>

    <h4 class="fw-bold mt-4 mb-3"><i class="fas fa-info-circle me-2"></i>기타 안내</h4>
    <p>사무실은 주차장 내부에 위치해 있습니다!
    
    </p>
</div>


<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>