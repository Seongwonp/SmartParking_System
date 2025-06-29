package com.opentime.smartparking_system.controller.user;

import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(value="/login")
public class LoginServlet extends HttpServlet {

    private final UserService userService = UserService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 로그인 페이지 보여주기
        req.getRequestDispatcher("/WEB-INF/jsp/user/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");

        UserDTO user = userService.loginUser(userName, password);

        if (user != null) {
            // 로그인 성공 - 세션에 저장
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            resp.sendRedirect(req.getContextPath() + "/jsp/user/index_user.jsp"); // 로그인 후 메인 페이지로
        } else {
            // 로그인 실패 - 에러 메시지와 함께 로그인 페이지 다시 보여주기
            req.setAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
            req.getRequestDispatcher("/WEB-INF/jsp/user/login.jsp").forward(req, resp);
        }
    }
}