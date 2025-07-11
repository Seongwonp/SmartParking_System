package com.opentime.smartparking_system.controller.admin.adminUser;

import com.opentime.smartparking_system.model.dto.UserDTO;
import com.opentime.smartparking_system.service.AdminService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/user/subscriptionList")
public class AdminUserSubscriptionListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 파라미터 받기
        String op = req.getParameter("op");
        String keyword = req.getParameter("keyword");
        String orderBy = req.getParameter("orderBy");

        // 기본 orderBy 설정
        if (orderBy == null || (!orderBy.equalsIgnoreCase("ASC") && !orderBy.equalsIgnoreCase("DESC"))) {
            orderBy = "DESC";
        }

        // 서비스 호출 - 정기권 회원만 조회
        List<UserDTO> subscriptionUsers = AdminService.INSTANCE.getSubscriptionUsers(op, keyword, orderBy);

        // request에 결과 담기
        req.setAttribute("userList", subscriptionUsers);
        req.setAttribute("op", op);
        req.setAttribute("keyword", keyword);
        req.setAttribute("orderBy", orderBy);

        req.setAttribute("currentPage", "memberManage"); // 사이드바 설정
        // JSP forward
        req.getRequestDispatcher("/WEB-INF/jsp/admin/user/subscriptionUserList.jsp").forward(req, resp);
    }
}