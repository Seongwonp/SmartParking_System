package com.opentime.smartparking_system.controller.admin.ParkingRecord;

import com.opentime.smartparking_system.model.dto.AdminDTO_parkingrecord;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;
import java.util.List;

@Log4j2
@WebServlet(value="/admin/parkingList")
public class AdminParkingStatusServlet extends HttpServlet {

    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String carNumberKeyword = req.getParameter("carNumberKeyword");
        String userNameKeyword = req.getParameter("userNameKeyword");
        try {
            List<AdminDTO_parkingrecord> parkingList = adminService.getParkingList(carNumberKeyword,userNameKeyword);
            int count = adminService.countParkingSpace();
            req.setAttribute("parkingRecords", parkingList);
            req.setAttribute("count", count);
            req.setAttribute("currentPage", "parkingStatus"); // 사이드바 설정
            req.getRequestDispatcher("/WEB-INF/jsp/admin/parking/parkingStatus.jsp").forward(req, resp);
        } catch (Exception e) {
            log.error("Error fetching active parking list", e);
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to load parking list.");
        }
    }
}
