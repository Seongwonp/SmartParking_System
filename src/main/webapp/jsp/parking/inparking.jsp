<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.opentime.smartparking_system.dao.CarDAO" %>
<%@ page import="com.opentime.smartparking_system.model.vo.CarVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>입차 등록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    body {
      font-family: "Noto Sans KR", sans-serif;
      background-color: #f8f9fa;
      padding: 30px;
    }
    .container {
      max-width: 500px;
      margin: 80px auto;
      padding: 30px;
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    h1 {
      text-align: center;
      margin-bottom: 30px;
    }
    .form-label { font-weight: bold; }
    .submit-btn {
      width: 100%;
      padding: 12px;
      background-color: #198754;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 4px;
    }
    .submit-btn:hover { background-color: #157347; }
  </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<%
  CarDAO carDAO = new CarDAO();
  List<CarVO> carList = carDAO.findAll(); // 차량 목록 조회
%>

<div class="container">
  <h1>입차 등록</h1>
  <form action="inparking_process.jsp" method="post">
    <div class="mb-3">
      <label for="carId" class="form-label">차량 선택</label>
      <select class="form-select" id="carId" name="carId" required>
        <option value="">차량을 선택하세요</option>
        <%
          for (CarVO car : carList) {
        %>
        <option value="<%=car.getCarId()%>"><%=car.getCarNumber()%> - <%=car.getCarType()%></option>
        <%
          }
        %>
      </select>
    </div>
    <div class="mb-3">
      <label for="entryTime" class="form-label">입차 시간</label>
      <input type="datetime-local" class="form-control" id="entryTime" name="entryTime" required>
    </div>
    <button type="submit" class="submit-btn">입차 등록</button>
  </form>
</div>

<%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
