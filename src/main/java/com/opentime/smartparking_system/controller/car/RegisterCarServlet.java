package com.opentime.smartparking_system.controller.car;

import com.opentime.smartparking_system.dao.CarDAO;
import com.opentime.smartparking_system.dao.ConnectionUtill;
import com.opentime.smartparking_system.model.dto.CarDTO;
import com.opentime.smartparking_system.model.dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/user/myPageCarForm")
public class RegisterCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
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

            // 등록 후 차량 목록으로 이동
            resp.sendRedirect(req.getContextPath() + "/user/myPageCarList");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "서버 오류가 발생했습니다.");
        }
    }
}
