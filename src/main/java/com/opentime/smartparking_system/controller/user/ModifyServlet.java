package com.opentime.smartparking_system.controller.user;

import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

@Log4j2
@WebServlet("/user/myPageModify")
public class ModifyServlet extends HttpServlet {
    private final UserService userService = UserService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //수정 페이지로 사용자 정보를 전달
        log.info("/user/myPageModify doGet");

        UserDTO userDTO = (UserDTO) req.getSession().getAttribute("user");
        String userName = userDTO.getUserName(); //사용자 ID
        UserDTO userinfo = userService.getUserInfo(userName); //DB 조회
        req.setAttribute("userinfo", userinfo); //JSP 로 전달
        req.getRequestDispatcher("/WEB-INF/jsp/user/myPageModify.jsp").forward(req, resp);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //폼으로부터 전달받은 사용자 정보를 바탕으로 updateUser() 실행 후 다른 페이지로 리디렉션
        log.info("/WEB-INF/jsp/user/myPageModify doPost");

        UserDTO userDTO = UserDTO.builder()
                .userName(req.getParameter("userName"))
                .password(req.getParameter("password"))
                .name(req.getParameter("name"))
                .phone(req.getParameter("phone"))
                .build();

        log.info("userDTO: {}", userDTO);
        userService.updateUser(userDTO);
        resp.sendRedirect(req.getContextPath() + "/jsp/user/myPageHome");


    }


}
