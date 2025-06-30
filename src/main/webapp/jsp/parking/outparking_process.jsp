<%@ page import="com.opentime.smartparking_system.model.dto.ParkingDTO" %>
<%@ page import="com.opentime.smartparking_system.service.ParkingService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  request.setCharacterEncoding("UTF-8");

  int carId = Integer.parseInt(request.getParameter("carId"));

  ParkingDTO resultDTO = ParkingService.INSTANCE.processExit(carId);

  if (resultDTO != null) {
    request.setAttribute("entryTime", resultDTO.getEntryTime());
    request.setAttribute("exitTime", resultDTO.getExitTime());
    request.setAttribute("fee", resultDTO.getFee());
    request.getRequestDispatcher("outparking.jsp").forward(request, response);
  } else {
    response.sendRedirect("outparking.jsp?error=true");
  }
%>