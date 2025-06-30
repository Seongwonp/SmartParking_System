package com.opentime.smartparking_system.controller.admin.feePolicy;

import com.opentime.smartparking_system.dao.FeePolicyDAO;
import com.opentime.smartparking_system.model.dto.FeePolicyDTO;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/feePolicy/add")
public class FeePolicyAddServlet extends HttpServlet {

    private FeePolicyDAO feePolicyDAO = new FeePolicyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 등록 폼 페이지로 포워딩
        request.getRequestDispatcher("/WEB-INF/jsp/admin/feePolicyAdd.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 폼에서 넘어온 파라미터 받기
        String policyName = request.getParameter("policyName");
        String baseTimeStr = request.getParameter("baseTime");
        String baseFeeStr = request.getParameter("baseFee");
        String additionalTimeStr = request.getParameter("additionalTime");
        String additionalFeeStr = request.getParameter("additionalFee");
        String dailyMaxFeeStr = request.getParameter("dailyMaxFee");

        // 기본 유효성 검사
        if (policyName == null || policyName.isEmpty()) {
            request.setAttribute("error", "정책명을 입력해주세요.");
            request.getRequestDispatcher("/WEB-INF/jsp/admin/feePolicyAdd.jsp").forward(request, response);
            return;
        }

        try {
            int baseTime = Integer.parseInt(baseTimeStr);
            int baseFee = Integer.parseInt(baseFeeStr);
            int additionalTime = Integer.parseInt(additionalTimeStr);
            int additionalFee = Integer.parseInt(additionalFeeStr);
            int dailyMaxFee = Integer.parseInt(dailyMaxFeeStr);

            FeePolicyDTO feePolicy = new FeePolicyDTO();
            feePolicy.setPolicyName(policyName);
            feePolicy.setBaseTime(baseTime);
            feePolicy.setBaseFee(baseFee);
            feePolicy.setAdditionalTime(additionalTime);
            feePolicy.setAdditionalFee(additionalFee);
            feePolicy.setDailyMaxFee(dailyMaxFee);

            // DAO를 통해 DB에 저장
            AdminService.INSTANCE.insertFee(feePolicy);

            // 저장 후 리스트 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/admin/feePolicy/list");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "숫자 형식이 올바르지 않습니다.");
            request.getRequestDispatcher("/WEB-INF/jsp/admin/feePolicyAdd.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "서버 오류가 발생했습니다.");
            request.getRequestDispatcher("/WEB-INF/jsp/admin/feePolicyAdd.jsp").forward(request, response);
        }
    }
}