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
        int carId = Integer.parseInt(req.getParameter("carId"));
        log.info("carId: {}", carId);

        ParkingDTO parkingDTO = ParkingService.INSTANCE.processExit(carId);
        log.info("parkingDTO: {}", parkingDTO);

        if (parkingDTO != null) {
            parkingDTO.setExitTime(Timestamp.valueOf(LocalDateTime.now()));
            req.setAttribute("message", "출차가 완료되었습니다. 요금: " + parkingDTO.getFee() + "원");
            req.setAttribute("parkingDTO", parkingDTO);
//            resp.sendRedirect(req.getContextPath() + "/user/parkingCalc");
            req.getRequestDispatcher("/WEB-INF/jsp/user/parkingCalc.jsp").forward(req, resp);
        }
        else {
            // 실패 시
            req.setAttribute("error", "출차 처리에 실패했습니다.");
            req.getRequestDispatcher("/WEB-INF/jsp/user/error.jsp").forward(req, resp);
        }
    }
}
