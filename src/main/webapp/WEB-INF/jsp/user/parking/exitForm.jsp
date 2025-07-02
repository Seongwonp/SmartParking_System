<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.opentime.smartparking_system.dao.CarDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.opentime.smartparking_system.model.dto.CarDTO" %>
<%@ page import="java.sql.SQLException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>출차등록</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        body{
            background-color: #f9f9f9;
            font-family: sans-serif;
            margin:0 auto;
        }
        .container {
            padding: 20px;
            margin-top: 150px;
            background-color: white;
            max-width: 800px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 100px;
        }
        .container h2 {
            text-align: center;
            margin: 40px 0;
            color: #333;
        }
        .container h4 {
            color: #2c3e50;
            font-size: 22px;
            margin-top: 30px;
            margin-bottom: 20px;
            border-left: 6px solid #4a97d8;
            padding-left: 14px;
        }
        .button-group {
            margin-top: 24px;
            display: flex;
            justify-content: space-between;
        }

        input[type="submit"], input[type="button"] {
            width: 48%;
            padding: 12px;
            background-color: #4a97d8;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #3a7fc1;
        }
    </style>
</head>
<body>
<%@ include file="/jsp/include/header.jsp" %>

<%
    UserDTO userDTO = (UserDTO) session.getAttribute("user");
    if (userDTO == null) {
        response.sendRedirect("/login");
        return;
    }

    CarDAO carDAO = new CarDAO();
    List<CarDTO> carList;
    try {
        carList = carDAO.getCarsByUserId(userDTO.getUserId());
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("차량 정보를 불러오는 중 오류가 발생했습니다.");
        return;
    }
%>

<div class="container">
    <h2>출차 등록</h2>
    <form action="/user/parking/exitForm" method="post">
        <h4>출차등록할 차량을 선택하세요</h4>
        <select class="form-select" id="carId" name="carId" required>
            <option value="">차량선택</option>
            <%
                for (CarDTO car : carList) {
            %>
            <option value="<%=car.getCarId()%>"><%=car.getCarNumber()%> - <%=car.getCarType()%>
            </option>
            <%
                }
            %>
        </select><br>

        <div class="button-group">
            <input type="submit" value="등록">
            <input type="button" value="취소" onclick="history.back();">
        </div>
    </form>
</div>
<%@include file="/jsp/include/footer.jsp" %>

</body>
<c:if test="${not empty errorMessage}">
    <script>
        alert("${errorMessage}");
    </script>
</c:if>
</html>
