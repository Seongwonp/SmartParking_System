package com.opentime.smartparking_system.controller.admin.ParkingRecord;

import com.opentime.smartparking_system.model.dto.AdminDTO_parkingrecord;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value="/admin/parking/history")
public class AdminParkingRecordList extends HttpServlet {
    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 파라미터 꺼내기
        String isExitedParam = req.getParameter("isExited");
        Boolean isExited = null;
        if (isExitedParam != null && !isExitedParam.isBlank()) {
            isExited = Boolean.parseBoolean(isExitedParam);
        }

        String carNumberKeyword = req.getParameter("carNumberKeyword");
        String userNameKeyword = req.getParameter("userNameKeyword");

        // 2. 서비스 호출
        List<AdminDTO_parkingrecord> list =
                adminService.getHistory(isExited, carNumberKeyword, userNameKeyword);

        int count = adminService.countParkingSpace();
        // 3. JSP로 전달
        req.setAttribute("parkingRecords", list);
        req.setAttribute("parkingCount", count);
        req.setAttribute("currentPage", "parkingRecords"); // 사이드바 설정

        req.getRequestDispatcher("/WEB-INF/jsp/admin/parking/parkingRecordList.jsp")
                .forward(req, resp);
    }
}