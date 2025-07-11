package com.opentime.smartparking_system.controller.user;

import com.opentime.smartparking_system.model.dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(value="/index")
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false); // 세션이 없으면 null 반환

        UserDTO user = null;
        if (session != null) {
            user = (UserDTO) session.getAttribute("user");
        }

        if (user != null) {
            // 로그인된 경우
            req.getRequestDispatcher("/index/home").forward(req, resp);
        } else {
            // 로그인 안 된 경우
            req.getRequestDispatcher("/WEB-INF/views/index_public.jsp").forward(req, resp);
        }
    }
}