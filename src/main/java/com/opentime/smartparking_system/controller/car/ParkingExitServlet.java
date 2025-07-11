package com.opentime.smartparking_system.controller.car;

import com.opentime.smartparking_system.model.dto.ParkingDTO;
import com.opentime.smartparking_system.service.ParkingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Log4j2
@WebServlet("/user/parking/exitForm")
public class ParkingExitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/user/parking/exitForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String carIdParam = req.getParameter("carId");
        if (carIdParam == null || carIdParam.isEmpty()) {
            req.setAttribute("errorMessage", "차량 정보가 누락되었습니다.");
            req.getRequestDispatcher("/WEB-INF/jsp/user/parking/exitForm.jsp").forward(req, resp);
            return;
        }

        int carId;
        try {
            carId = Integer.parseInt(carIdParam);
        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "잘못된 차량 정보입니다.");
            req.getRequestDispatcher("/WEB-INF/jsp/user/parking/exitForm.jsp").forward(req, resp);
            return;
        }

        ParkingDTO parkingDTO = ParkingService.INSTANCE.processExit(carId);

        if (parkingDTO == null) {
            // 출차 실패 상세 원인 확인 가능하면 구체 메시지로 교체
            req.setAttribute("errorMessage", "출차 처리에 실패했습니다. 차량이 이미 출차되었거나 존재하지 않습니다.");
            req.getRequestDispatcher("/WEB-INF/jsp/user/parking/exitForm.jsp").forward(req, resp);
            return;
        }

        parkingDTO.setExitTime(Timestamp.valueOf(LocalDateTime.now()));
        req.setAttribute("message", "출차가 완료되었습니다. 요금: " + parkingDTO.getFee() + "원");
        req.setAttribute("parkingDTO", parkingDTO);
        req.getRequestDispatcher("/WEB-INF/jsp/user/parkingCalc.jsp").forward(req, resp);
    }
}
