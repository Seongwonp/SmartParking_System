package com.opentime.smartparking_system.controller.car;

import com.opentime.smartparking_system.model.dto.CarDTO;
import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.CarService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@Log4j2
@WebServlet("/user/myPageCarList")
public class CarListServlet extends HttpServlet {
    private final CarService carService = CarService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 세션에서 로그인한 사용자 정보 가져오기
        UserDTO user = (UserDTO) req.getSession().getAttribute("user");
        log.info("user: {}", user);

        int userId = user.getUserId(); //로그인한 사용자의 사용자 ID 추출

        try {
            //2. 해당 사용자 ID로 차량 목록 조회
            List<CarDTO> dtoList = carService.getCarList(userId);
            //3. 차량 목록을 JSP로 포워딩
            req.setAttribute("carList", dtoList);
            req.getRequestDispatcher("/WEB-INF/jsp/user/myPageCarList.jsp").forward(req, resp);
        } catch (SQLException e) {
            req.setAttribute("errorMessage", "차량 목록 조회중 오류 발생!");
            req.getRequestDispatcher("/WEB-INF/jsp/user/myPageHome.jsp").forward(req, resp);
        }
    }
}
