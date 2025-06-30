package com.opentime.smartparking_system.controller.admin;

import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

@Log4j2
@WebServlet(value="/admin/delete")
public class AdminDeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int userId =Integer.parseInt(req.getParameter("userId"));

            // DB에서 해당 ID 삭제
            AdminService.INSTANCE.deleteAdmin(userId);

            // 삭제 후 목록으로 이동
            resp.sendRedirect(req.getContextPath() + "/admin/List");

    }
}
