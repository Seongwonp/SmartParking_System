package com.opentime.smartparking_system.controller.car;

import com.opentime.smartparking_system.model.dto.AdminDTO_parkingrecord;
import com.opentime.smartparking_system.model.dto.CarDTO;
import com.opentime.smartparking_system.model.dto.ParkingDTO;
import com.opentime.smartparking_system.model.dto.UserDTO;

import com.opentime.smartparking_system.service.ParkingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Log4j2
@WebServlet("/user/parkingCalc")
public class ParkingCalcServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDTO user = (UserDTO) req.getSession().getAttribute("user");
        //1. 사용자의 출차한 차량을 조회
        //2. 해당 차량이 주차한 시간과 주차비 계산결과를 불러옴
        //3. 결과를 parkingCalc 로 전달
        if (user == null) {
            resp.sendRedirect("/login");
        } else {
            ParkingDTO parkingDTO = (ParkingDTO) req.getAttribute("parkingDTO");
            req.getRequestDispatcher("/WEB-INF/jsp/user/parkingCalc.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
