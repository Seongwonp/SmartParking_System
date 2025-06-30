package com.opentime.smartparking_system.controller.admin.discountPolicy;

import com.opentime.smartparking_system.model.dto.DiscountPolicyDTO;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

@Log4j2
@WebServlet(value = "/admin/discountPolicy/register")
public class DiscountPolicyAddServlet extends HttpServlet {

    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/jsp/admin/discountPolicyAdd.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String rateStr = request.getParameter("rate");

        int rate = 0;
        try {
            rate = Integer.parseInt(rateStr);
        } catch (NumberFormatException e) {
            log.error("할인율 숫자 변환 실패", e);
            request.setAttribute("error", "할인율은 숫자여야 합니다.");
            request.getRequestDispatcher("/admin/discountPolicyAdd.jsp").forward(request, response);
            return;
        }

        DiscountPolicyDTO discountPolicyDTO = new DiscountPolicyDTO();
        discountPolicyDTO.setType(type);
        discountPolicyDTO.setDescription(description);
        discountPolicyDTO.setRate(rate);

        boolean success = adminService.insertDiscountPolicy(discountPolicyDTO);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/discountPolicy/list");
        } else {
            request.setAttribute("error", "할인 정책 추가에 실패했습니다.");
            request.getRequestDispatcher("/admin/discountPolicyAdd.jsp").forward(request, response);
        }
    }
}