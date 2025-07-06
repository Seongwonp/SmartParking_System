package com.opentime.smartparking_system.controller.car;

import com.opentime.smartparking_system.dao.ParkingDAO;
import com.opentime.smartparking_system.model.dto.AdminDTO_parkingrecord;
import com.opentime.smartparking_system.model.dto.CarDTO;
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
import java.util.List;

@WebServlet("/user/parking/history")
public class ParkingHistoryServlet extends HttpServlet {
    private final ParkingService parkingService = ParkingService.INSTANCE;
    private final CarService carService = CarService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDTO userDTO = (UserDTO) req.getSession().getAttribute("user");
        if (userDTO == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String carId = req.getParameter("carId");
        String limitParam = req.getParameter("limit");
        int limit = 0;
        if (limitParam != null && !limitParam.isEmpty()) {
            try {
                limit = Integer.parseInt(limitParam);
            } catch (NumberFormatException ignored) {
            }
        }

        if (carId != null && !carId.trim().isEmpty()) {
            List<AdminDTO_parkingrecord> parkingHistory = parkingService.historicalCarList(carId, limit);
            req.setAttribute("parkingHistory", parkingHistory);
        }

        // 차량 리스트도 보내줘야 차량 선택 드롭다운이 가능하니까
        List<CarDTO> carList = null;
        try {
            carList = carService.getCarList(userDTO.getUserId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("carList", carList);

        req.getRequestDispatcher("/WEB-INF/jsp/user/parking/parkingHistory.jsp").forward(req, resp);
    }
}
