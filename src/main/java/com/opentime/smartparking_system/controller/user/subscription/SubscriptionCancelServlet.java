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
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Objects;

@WebServlet("/user/subscription/cancel")
public class SubscriptionCancelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserDTO user = (UserDTO) session.getAttribute("user");
        if (user == null) {
            session.setAttribute("message", "로그인 정보가 만료되었습니다.");
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.setAttribute("userId", user.getUserId());
        // userId로 활성 멤버십 조회
        SubscriptionDTO subscription = SubscriptionService.INSTANCE.getActiveSubscriptionByUserId(user.getUserId());
        if (subscription == null) {
            // 가입된 멤버십이 없을 경우
            session.setAttribute("message", "가입된 멤버십이 없습니다.");
            resp.sendRedirect(req.getContextPath() + "/user/subscription/join");
            return;
        }
        CarDTO car = null;
        try {
          car = CarService.INSTANCE.getCarInfo(String.valueOf(subscription.getCarId()));
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/user/subscription/join");
        }
        req.setAttribute("subscription", subscription);
        req.setAttribute("carInfo",car);
        LocalDate today = LocalDate.now();
        req.setAttribute("today", today); 
        LocalDate endDate;
        if(subscription.getType()== SubscriptionType.annual){
            endDate = today.plusYears(1);
        }else if(subscription.getType() == SubscriptionType.monthly){
            endDate = today.plusMonths(1);
        }else{
            endDate = today;
        }
        req.setAttribute("endDate", endDate);



        req.getRequestDispatcher("/WEB-INF/jsp/user/subscription/subscriptionCancel.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            // 1. userId 파라미터 받아오기
            int userId = Integer.parseInt(request.getParameter("userId"));
            SubscriptionDTO subscription = SubscriptionService.INSTANCE.getActiveSubscriptionByUserId(userId);
            if (subscription == null) {
                session.setAttribute("message", "가입된 멤버십이 없습니다.");
                response.sendRedirect(request.getContextPath() + "/user/myPageHome");
                return;
            }

            // 3. subscription에서 carId 추출 후 상태를 CANCEL로 변경
            int carId = subscription.getCarId();
            boolean result = SubscriptionService.INSTANCE.updateStatus(carId, SubscriptionStatus.cancelled) && UserService.INSTANCE.updateSubscription(userId,null,null);
            if (result) {
                session.setAttribute("message", "멤버십 해지에 성공했습니다.");
                response.sendRedirect(request.getContextPath() + "/user/myPageHome");
            } else {
                session.setAttribute("message", "멤버십 해지에 실패했습니다.");
            }
        } catch (NumberFormatException e) {
            session.setAttribute("message", "잘못된 사용자 ID입니다.");
            response.sendRedirect(request.getContextPath() + "/user/subscription/join");
        }
    }
}