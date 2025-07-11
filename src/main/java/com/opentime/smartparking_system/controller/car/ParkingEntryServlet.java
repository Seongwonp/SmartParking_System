package com.opentime.smartparking_system.controller.car;

import com.opentime.smartparking_system.dao.ParkingDAO;
import com.opentime.smartparking_system.model.dto.CarDTO;
import com.opentime.smartparking_system.model.dto.ParkingDTO;
import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.CarService;
import com.opentime.smartparking_system.service.ParkingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/user/parking/entryForm")
public class ParkingEntryServlet extends HttpServlet {
    private final ParkingService parkingService = ParkingService.INSTANCE;
    private final CarService carService = CarService.INSTANCE;
    private final ParkingDAO parkingDAO = new ParkingDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/user/parking/entryForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 로그인한 사용자 확인
        UserDTO userDTO = (UserDTO) req.getSession().getAttribute("user");
        if (userDTO == null) {
            resp.sendRedirect("/login");
            return;
        }

        //2. 사용자 ID로 차량 조회
        int userId = userDTO.getUserId();
        List<CarDTO> carList;
        try {
            carList = carService.getCarList(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        String carIdParam = req.getParameter("carId");
        if (carIdParam == null) {
            req.setAttribute("carList", carList);
            req.getRequestDispatcher("/WEB-INF/jsp/user/myPageCarForm.jsp").forward(req, resp);
            return;
        }

        if(parkingService.countParkedCars() >= 10){
            req.setAttribute("errorMessage", "만차입니다! 잠시만 기다려주십시오!");
            req.getRequestDispatcher("/WEB-INF/jsp/user/parking/entryForm.jsp").forward(req, resp);
            return;
        }


        //3.입차 등록처리
        int carId = Integer.parseInt(carIdParam);
        ParkingDTO parkingDTO = new ParkingDTO();
        parkingDTO.setCarId(carId);
        parkingDTO.setEntryTime(Timestamp.valueOf(LocalDateTime.now()));

        //4. 결과전달
        boolean success = parkingService.registerEntry(parkingDTO); 
        if (!success) {
            req.setAttribute("errorMessage", "이미 입차된 차량입니다.");
            req.getRequestDispatcher("/WEB-INF/jsp/user/parking/entryForm.jsp").forward(req, resp);
            return;
        }
        req.setAttribute("successMessage", "입차 등록이 완료되었습니다!");
        resp.sendRedirect(req.getContextPath() + "/user/myPageHome");
    }
}
