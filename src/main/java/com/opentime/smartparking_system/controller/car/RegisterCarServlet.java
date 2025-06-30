package com.opentime.smartparking_system.controller.car;


import com.opentime.smartparking_system.model.dto.CarDTO;
import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.CarService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/user/myPageCarForm")
public class RegisterCarServlet extends HttpServlet {
    private final CarService carService = CarService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //차량 등록 페이지로 차량 정보 전달
        CarDTO carDTO = (CarDTO) req.getAttribute("carDTO");

        if (carDTO != null) {
            String carId = String.valueOf(carDTO.getCarId());
            try {
                CarDTO carinfo = carService.getCarInfo(carId);
                req.setAttribute("carinfo", carinfo);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        req.getRequestDispatcher("/WEB-INF/jsp/user/myPageCarForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 세션에서 userId 추출
        UserDTO userDTO = (UserDTO) req.getSession().getAttribute("user");
        if (userDTO == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
        String carNumber = req.getParameter("carNumber");
        String carModel = req.getParameter("carModel");
        String carType = req.getParameter("carType");

        //DTO 생성
        CarDTO carDTO = new CarDTO();
        carDTO.setUserId(userDTO.getUserId());
        carDTO.setCarNumber(carNumber);
        carDTO.setCarModel(carModel);
        carDTO.setCarType(carType);

        try {
            carService.addCar(carDTO);
            req.setAttribute("successMessage", "차량 등록이 완료되었습니다!");
            resp.sendRedirect(req.getContextPath() + "/jsp/user/myPageCarList");
        } catch (SQLException ex) {
            req.setAttribute("errorMessage", "차량 등록 실패!");
            req.getRequestDispatcher("/WEB-INF/jsp/user/myPageCarForm.jsp").forward(req, resp);
        }
    }
}