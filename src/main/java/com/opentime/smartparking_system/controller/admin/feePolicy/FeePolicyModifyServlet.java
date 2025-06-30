package com.opentime.smartparking_system.controller.admin.feePolicy;

import com.opentime.smartparking_system.model.dto.FeePolicyDTO;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/feePolicy/modify")
public class FeePolicyModifyServlet extends HttpServlet {

    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int policyId = Integer.parseInt(req.getParameter("policyId"));
        FeePolicyDTO feePolicy = adminService.getFeePolicyById(policyId);
        req.setAttribute("feePolicy", feePolicy);
        req.getRequestDispatcher("/WEB-INF/jsp/admin/feePolicyModify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int policyId = Integer.parseInt(req.getParameter("policyId"));
        String policyName = req.getParameter("policyName");
        int baseTime = Integer.parseInt(req.getParameter("baseTime"));
        int baseFee = Integer.parseInt(req.getParameter("baseFee"));
        int additionalTime = Integer.parseInt(req.getParameter("additionalTime"));
        int additionalFee = Integer.parseInt(req.getParameter("additionalFee"));
        int dailyMaxFee = Integer.parseInt(req.getParameter("dailyMaxFee"));

        FeePolicyDTO dto = FeePolicyDTO.builder()
                .policyId(policyId)
                .policyName(policyName)
                .baseTime(baseTime)
                .baseFee(baseFee)
                .additionalTime(additionalTime)
                .additionalFee(additionalFee)
                .dailyMaxFee(dailyMaxFee)
                .build();

        boolean result = adminService.updateFeePolicy(dto);
        if (result) {
            resp.sendRedirect(req.getContextPath() + "/admin/feePolicy/list");
        } else {
            req.setAttribute("error", "수정 실패");
            req.setAttribute("feePolicy", dto);
            req.getRequestDispatcher("/WEB-INF/jsp/admin/feePolicyModify.jsp").forward(req, resp);
        }
    }
}

