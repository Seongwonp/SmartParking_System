package com.opentime.smartparking_system.controller.admin.feePolicy;

import com.opentime.smartparking_system.model.dto.FeePolicyDTO;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;
import java.util.List;

@Log4j2
@WebServlet(value="/admin/feePolicy/list")
public class FeePolicyListServlet extends HttpServlet {

    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<FeePolicyDTO> feeList = adminService.getListFeePolicy();
        req.setAttribute("feeList", feeList);
        req.setAttribute("currentPage", "feePolicyList"); // 사이드바 설정
        req.getRequestDispatcher("/WEB-INF/jsp/admin/feePolicyList.jsp").forward(req, resp);
    }
}
