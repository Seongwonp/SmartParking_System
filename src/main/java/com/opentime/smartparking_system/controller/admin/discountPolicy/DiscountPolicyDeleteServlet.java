package com.opentime.smartparking_system.controller.admin.discountPolicy;

import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/discountPolicy/delete")
public class DiscountPolicyDeleteServlet extends HttpServlet {

    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String discountIdStr = request.getParameter("discountId");

        if (discountIdStr == null) {
            response.sendRedirect(request.getContextPath() + "/admin/discountPolicy/list");
            return;
        }

        try {
            int discountId = Integer.parseInt(discountIdStr);

            // ID 1인 경우 삭제 제한
            if (discountId == 1) {
                request.setAttribute("error", "기본 할인 정책은 삭제할 수 없습니다.");
                request.getRequestDispatcher("/admin/discountPolicy/list").forward(request, response);
                return;
            }

            boolean success = adminService.deleteDiscountPolicy(discountId);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/discountPolicy/list");
            } else {
                request.setAttribute("error", "삭제에 실패했습니다.");
                request.getRequestDispatcher("/admin/discountPolicy/list").forward(request, response);
            }

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/discountPolicy/list");
        }
    }
}