package com.opentime.smartparking_system.controller.user;

import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/user/signup")
public class RegisterServlet extends HttpServlet {

    private final UserService userService = UserService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 회원가입 폼 페이지로 포워딩
        req.getRequestDispatcher("/WEB-INF/jsp/user/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 요청 인코딩 설정 (필요하면)
        req.setCharacterEncoding("UTF-8");

        // 폼에서 데이터 받기
        String userName = req.getParameter("userName");  // 이메일
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");

        // DTO에 담기
        UserDTO user = new UserDTO();
        user.setUserName(userName);
        user.setPassword(password);
        user.setName(name);
        user.setPhone(phone);

        try {
            boolean result = userService.addUser(user);
            if (result) {
                // 회원가입 성공 시 로그인 페이지 또는 메인으로 리다이렉트
                resp.sendRedirect(req.getContextPath() + "/login?success=true");
            } else {
                // 실패 시 회원가입 페이지로 다시 (실패 메시지 등 추가 가능)
                req.setAttribute("errorMessage", "회원가입에 실패했습니다.");
                req.getRequestDispatcher("/WEB-INF/jsp/user/signup.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "서버 오류가 발생했습니다.");
            req.getRequestDispatcher("/WEB-INF/jsp/user/signup.jsp").forward(req, resp);
        }
    }
}