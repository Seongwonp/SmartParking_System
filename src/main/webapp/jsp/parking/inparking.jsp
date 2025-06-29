<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>입차 등록</title>
  <!-- Bootstrap CSS -->
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
      margin: 0 auto;
      padding: 30px;
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      margin-top: 80px;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
    }

    .form-label {
      font-weight: bold;
    }

    .submit-btn {
      width: 100%;
      padding: 12px;
      background-color: #198754;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 4px;
    }

    .submit-btn:hover {
      background-color: #157347;
    }
  </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<div class="container">
  <h1>입차 등록</h1>
  <form action="inparking_process.jsp" method="post">
    <div class="mb-3">
      <label for="carNumber" class="form-label">차량 번호</label>
      <input type="text" class="form-control" id="carNumber" name="carNumber" placeholder="예: 12가3456" required>
    </div>
    <div class="mb-3">
      <label for="carType" class="form-label">차량 종류</label>
      <select class="form-select" id="carType" name="carType" required>
        <option value="">선택하세요</option>
        <option value="승용차">승용차</option>
        <option value="SUV">SUV</option>
        <option value="트럭">트럭</option>
        <option value="오토바이">오토바이</option>
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
