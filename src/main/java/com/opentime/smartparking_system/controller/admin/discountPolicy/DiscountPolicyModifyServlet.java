package com.opentime.smartparking_system.controller.admin.discountPolicy;

import com.opentime.smartparking_system.model.dto.DiscountPolicyDTO;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/discountPolicy/modify")
public class DiscountPolicyModifyServlet extends HttpServlet {

    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int discountId = Integer.parseInt(req.getParameter("discountId"));
        DiscountPolicyDTO discountPolicy = adminService.getDiscountPolicyById(discountId);
        req.setAttribute("discountPolicy", discountPolicy);
        req.getRequestDispatcher("/WEB-INF/jsp/admin/discountPolicyModify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int discountId = Integer.parseInt(req.getParameter("discountId"));
        String type = req.getParameter("type");
        String description = req.getParameter("description");
        int rate = Integer.parseInt(req.getParameter("rate"));

        DiscountPolicyDTO dto = DiscountPolicyDTO.builder()
                .discountId(discountId)
                .type(type)
                .description(description)
                .rate(rate)
                .build();

        boolean result = adminService.updateDiscountPolicy(dto);
        if (result) {
            resp.sendRedirect(req.getContextPath() + "/admin/discountPolicy/list");
        } else {
            req.setAttribute("error", "수정 실패");
            req.setAttribute("discountPolicy", dto);
            req.getRequestDispatcher("/WEB-INF/jsp/admin/discountPolicyModify.jsp").forward(req, resp);
        }
    }
}
