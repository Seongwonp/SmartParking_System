package com.opentime.smartparking_system.controller.admin;

import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.AdminService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/admin/register")
public class AdminRegisterServlet extends HttpServlet {

    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/admin/adminSignup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        if (!password.equals(passwordConfirm)) {
            request.setAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
            request.getRequestDispatcher("/WEB-INF/jsp/admin/adminSignup.jsp").forward(request, response);
            return;
        }

        UserDTO userDTO = new UserDTO();
        userDTO.setUserName(userName);
        userDTO.setPassword(password);
        userDTO.setName(name);
        userDTO.setPhone(phone);

        boolean success = adminService.insertAdmin(userDTO);
        request.setAttribute("currentPage", "List"); // 사이드바 설정
        if(success) {
            request.setAttribute("successMessage", "관리자 추가가 완료되었습니다!");
            response.sendRedirect(request.getContextPath() + "/admin/List");
        } else {
            request.setAttribute("errorMessage", "관리자 등록 실패!");
            request.getRequestDispatcher("/WEB-INF/jsp/admin/adminSignup.jsp").forward(request, response);
        }
    }
}