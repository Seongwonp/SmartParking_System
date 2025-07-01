package com.opentime.smartparking_system.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value="/user/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 세션 무효화
        req.getSession().invalidate();

        // 로그아웃 후 메인 페이지로 리다이렉트
        resp.sendRedirect(req.getContextPath() + "/index");
    }
}