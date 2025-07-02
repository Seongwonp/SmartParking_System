package com.opentime.smartparking_system.controller;

import com.opentime.smartparking_system.service.ParkingService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(value="/index/home")
public class HomeServlet extends HttpServlet {

    // HomeServlet에 doGet 메서드 추가하여 주차 현황 데이터를 JSP로 전달
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int totalCapacity = 10;
        int available = ParkingService.INSTANCE.countAvailableParking();
        int parkingNow = totalCapacity - available;
        int yesterdayEntry = ParkingService.INSTANCE.countEntriesByDate(LocalDate.now().minusDays(1));
        int yesterdayExit = ParkingService.INSTANCE.countExitsByDate(LocalDate.now().minusDays(1));

        req.setAttribute("parkingNow", parkingNow);
        req.setAttribute("available", available);
        req.setAttribute("yesterdayEntry", yesterdayEntry);
        req.setAttribute("yesterdayExit", yesterdayExit);

        req.getRequestDispatcher("/WEB-INF/jsp/user/index_loginHome.jsp").forward(req, resp);
    }
}
