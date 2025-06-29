package com.opentime.smartparking_system.controller.admin;


import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;
import java.util.List;

@Log4j2
@WebServlet(value="/updateAdmin/main")
public class AdminMainPageServlet extends HttpServlet {
    private final UserService userService = UserService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int totalMembers = userService.getTotalMemberCount();
        int subscriptionMembers = userService.getSubscriptionMemberCount();
        List<UserDTO> recentMembers = userService.getRecentMembers();

        req.setAttribute("totalMembers", totalMembers);
        req.setAttribute("subscriptionMembers", subscriptionMembers);
        req.setAttribute("recentMembers", recentMembers);

        req.getRequestDispatcher("/WEB-INF/views/updateAdmin/adminMain.jsp").forward(req, resp);
    }

}
