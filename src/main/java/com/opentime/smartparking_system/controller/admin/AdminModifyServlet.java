package com.opentime.smartparking_system.controller.admin;

import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

@Log4j2
@WebServlet("/admin/modify")
public class AdminModifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userId"));

        // DB에서 해당 관리자 정보 조회
        UserDTO admin = AdminService.INSTANCE.getAdminById(userId);

        req.setAttribute("admin", admin);
        req.getRequestDispatcher("/WEB-INF/jsp/admin/adminModify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int userId = Integer.parseInt(req.getParameter("userId"));
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");

        UserDTO admin = new UserDTO();
        admin.setUserId(userId);
        admin.setUserName(userName);
        admin.setPassword(password);
        admin.setName(name);
        admin.setPhone(phone);

        AdminService.INSTANCE.updateAdmin(admin);

        resp.sendRedirect(req.getContextPath() + "/admin/List");
    }

}
