package com.opentime.smartparking_system.controller;

import com.opentime.smartparking_system.model.dto.ParkingDTO;
import com.opentime.smartparking_system.service.ParkingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@WebServlet(name = "ParkingServlet", urlPatterns = {"/parking/in", "/parking/out"})
public class ParkingServlet extends HttpServlet {

    private final ParkingService parkingService = ParkingService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        if (path.equals("/parking/in")) {
            req.getRequestDispatcher("/WEB-INF/jsp/parking/inparking.jsp").forward(req, resp);
        } else if (path.equals("/parking/out")) {
            req.getRequestDispatcher("/WEB-INF/jsp/parking/outparking.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();

        if (path.equals("/parking/in")) {
            try {
                String carIdStr = req.getParameter("carId");
                String entryTimeStr = req.getParameter("entryTime");

                if (carIdStr == null || carIdStr.isBlank()) {
                    req.setAttribute("errorMessage", "차량 ID를 입력하세요.");
                    req.getRequestDispatcher("/WEB-INF/jsp/parking/inparking.jsp").forward(req, resp);
                    return;
                }

                int carId = Integer.parseInt(carIdStr);
                Timestamp entryTime = (entryTimeStr != null && !entryTimeStr.isBlank())
                        ? Timestamp.valueOf(entryTimeStr.replace("T", " ") + ":00")
                        : Timestamp.valueOf(LocalDateTime.now());

                ParkingDTO parkingDTO = ParkingDTO.builder()
                        .carId(carId)
                        .entryTime(entryTime)
                        .build();

                boolean result = parkingService.registerEntry(parkingDTO);

                if (result) {
                    resp.sendRedirect(req.getContextPath() + "/jsp/parking/inparking.jsp?success=true");
                } else {
                    req.setAttribute("errorMessage", "입차 등록 실패");
                    req.getRequestDispatcher("/WEB-INF/jsp/parking/inparking.jsp").forward(req, resp);
                }
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("errorMessage", "서버 오류가 발생했습니다.");
                req.getRequestDispatcher("/WEB-INF/jsp/parking/inparking.jsp").forward(req, resp);
            }

        } else if (path.equals("/parking/out")) {
            try {
                String carIdStr = req.getParameter("carId");

                if (carIdStr == null || carIdStr.isBlank()) {
                    req.setAttribute("errorMessage", "차량 ID를 입력하세요.");
                    req.getRequestDispatcher("/WEB-INF/jsp/parking/outparking.jsp").forward(req, resp);
                    return;
                }

                int carId = Integer.parseInt(carIdStr);

                ParkingDTO result = parkingService.processExit(carId);

                if (result != null) {
                    req.setAttribute("carId", result.getCarId());
                    req.setAttribute("entryTime", result.getEntryTime());
                    req.setAttribute("exitTime", result.getExitTime());
                    req.setAttribute("fee", result.getFee());
                    req.getRequestDispatcher("/WEB-INF/jsp/parking/outparking.jsp").forward(req, resp);
                } else {
                    req.setAttribute("errorMessage", "출차 가능한 차량 기록이 없습니다.");
                    req.getRequestDispatcher("/WEB-INF/jsp/parking/outparking.jsp").forward(req, resp);
                }
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("errorMessage", "서버 오류가 발생했습니다.");
                req.getRequestDispatcher("/WEB-INF/jsp/parking/outparking.jsp").forward(req, resp);
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
