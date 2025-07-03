package com.opentime.smartparking_system.controller.user.subscription;

import com.opentime.smartparking_system.model.dto.CarDTO;
import com.opentime.smartparking_system.model.dto.SubscriptionDTO;
import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.CarService;
import com.opentime.smartparking_system.service.SubscriptionService;
import com.opentime.smartparking_system.service.UserService;
import com.opentime.smartparking_system.util.SubscriptionStatus;
import com.opentime.smartparking_system.util.SubscriptionType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(value = "/user/subscription/join")
public class SubscriptionJoinServlet extends HttpServlet {

    private final SubscriptionService subscriptionService = SubscriptionService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user.isSubscription()) {
            response.sendRedirect(request.getContextPath() + "/user/subscription/cancel");
            return;
        }
        int userId  = user.getUserId();
        List<CarDTO> carList;
        try {
            carList = CarService.INSTANCE.getCarList(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("myCarList",carList);
        request.setAttribute("userId", user.getUserId());
        // WEB-INF 경로의 JSP로 포워딩
        request.getRequestDispatcher("/WEB-INF/jsp/user/subscription/subscriptionJoin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String membershipType = request.getParameter("membershipType");
        String agree1 = request.getParameter("agree1");
        String agree2 = request.getParameter("agree2");

        if (agree1 == null || agree2 == null) {
            request.setAttribute("errorMsg", "필수 동의 항목을 모두 체크해 주세요.");
            request.getRequestDispatcher("/WEB-INF/jsp/user/subscription/subscriptionJoin.jsp").forward(request, response);
            return;
        }


        Date startDate = Date.valueOf(LocalDate.now());
        SubscriptionType type;
        try {
            type = SubscriptionType.valueOf(membershipType.toLowerCase());
        } catch (IllegalArgumentException e) {
            request.setAttribute("errorMsg", "존재하지 않는 멤버십입니다.");
            request.getRequestDispatcher("/WEB-INF/jsp/user/subscription/subscriptionJoin.jsp").forward(request, response);
            return;
        }



        int userId = Integer.parseInt(request.getParameter("userId"));
        int carId = Integer.parseInt(request.getParameter("carId"));
        int fee;
        Date endDate;
        if (type == SubscriptionType.annual) {
            fee = 1_000_000;
            endDate = Date.valueOf(LocalDate.now().plusYears(1));
        } else if (type == SubscriptionType.monthly) {
            fee = 120_000;
            endDate = Date.valueOf(LocalDate.now().plusMonths(1));
        } else {
            request.setAttribute("errorMsg", "존재하지 않는 멤버십입니다.");
            request.getRequestDispatcher("/WEB-INF/jsp/user/subscription/subscriptionJoin.jsp").forward(request, response);
            return;
        }
        boolean success = subscriptionService.addSubscription(
                SubscriptionDTO.builder()
                        .carId(carId)
                        .type(type)
                        .startDate(startDate)
                        .endDate(endDate)
                        .fee(fee)
                        .status(SubscriptionStatus.active)
                        .build()
        ) && UserService.INSTANCE.updateSubscription(userId,startDate,endDate);

        if (success) {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("user");
            user.setSubscription(true);
            session.setAttribute("user",user);
            response.sendRedirect(request.getContextPath() + "/user/myPageHome");
        } else {
            request.setAttribute("errorMsg", "멤버십 가입에 실패했습니다.");
            request.getRequestDispatcher("/WEB-INF/jsp/user/subscription/subscriptionJoin.jsp").forward(request, response);
        }
    }
}