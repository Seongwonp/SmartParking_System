package com.opentime.smartparking_system.controller.car;

import com.opentime.smartparking_system.dao.ParkingDAO;
import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.ParkingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet("/user/myPageHome")
public class ParkingStatusServlet extends HttpServlet {
    private final ParkingService parkingService  = ParkingService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false); // 세션이 없으면 null 반환

        UserDTO user = (UserDTO) req.getSession().getAttribute("user");

        if (session != null) {
            user = (UserDTO) session.getAttribute("user");
        }

        if (user != null) {
            int userId = user.getUserId();
            List<Map<String, Object>> parkingStatusList;
            try {
                parkingStatusList = parkingService.getParkingStatusList(user.getUserId());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("parkingStatusList", parkingStatusList);
            req.getRequestDispatcher("/WEB-INF/jsp/user/myPageHome.jsp").forward(req, resp);
        } else {
            // 로그인 안 된 경우
            resp.sendRedirect("/login");
        }
    }
}
