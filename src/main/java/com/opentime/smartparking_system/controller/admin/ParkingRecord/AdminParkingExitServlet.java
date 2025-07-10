package com.opentime.smartparking_system.controller.admin.ParkingRecord;

import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

@Log4j2
@WebServlet(value="/admin/parkingList/exit")
public class AdminParkingExitServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            String carIdStr = req.getParameter("carId");
            int carId = Integer.parseInt(carIdStr);

            boolean result = AdminService.INSTANCE.adminExitCar(carId);

            if (result) {
                req.setAttribute("successMessage", "출차 처리가 완료되었습니다.");
            } else {
                req.setAttribute("errorMessage", "출차 처리에 실패했습니다.");
            }
            resp.sendRedirect(req.getContextPath() + "/admin/parkingList");
        }
}
