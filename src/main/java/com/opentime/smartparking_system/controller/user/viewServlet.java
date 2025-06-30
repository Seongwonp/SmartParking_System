package com.opentime.smartparking_system.controller.user;

import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

@Log4j2
@WebServlet("/jsp/user/myPageHome")
public class viewServlet extends HttpServlet {
    private final UserService userService = UserService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 세션에서 사용자 ID 가져오기 (예시)
        HttpSession session = req.getSession(false);
        if(session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // 2. 사용자 정보 DB 에서 조회
        UserDTO userDTO = (UserDTO) req.getSession().getAttribute("user");
        String userName = userDTO.getUserName(); //사용자 ID
        UserDTO userinfo = userService.getUserInfo(userName); 
        req.setAttribute("userinfo", userinfo); 
        // 3. 마이페이지 JSP 로 포워딩
        req.getRequestDispatcher("/WEB-INF/jsp/user/myPageHome.jsp").forward(req, resp);
    }
}
