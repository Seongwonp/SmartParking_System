<%@ page import="com.opentime.smartparking_system.model.dto.ParkingDTO" %>
<%@ page import="com.opentime.smartparking_system.service.ParkingService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.time.LocalDateTime" %>

<%
  request.setCharacterEncoding("UTF-8");

  int carId = Integer.parseInt(request.getParameter("carId"));
  String entryTimeStr = request.getParameter("entryTime");
  LocalDateTime entryTime = LocalDateTime.parse(entryTimeStr.replace("T", " ") + ":00"); // :00 보완
  Timestamp entryTimestamp = Timestamp.valueOf(entryTime);

  ParkingDTO dto = ParkingDTO.builder()
          .carId(carId)
          .entryTime(entryTimestamp)
          .build();

  boolean result = ParkingService.INSTANCE.registerEntry(dto);
  if (result) {
    response.sendRedirect("inParking.jsp?success=true");
  } else {
    response.sendRedirect("inParking.jsp?error=true");
  }
%>
