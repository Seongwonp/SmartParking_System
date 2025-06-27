package com.opentime.smartparking_system.controller;

import com.opentime.smartparking_system.model.dto.FeePolicyDTO;
import com.opentime.smartparking_system.model.dto.DiscountPolicyDTO;
import com.opentime.smartparking_system.service.FeePolicyService;
import com.opentime.smartparking_system.service.DiscountPolicyService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;
import java.util.List;

@Log4j2
@WebServlet(value="/fee/list")
public class FeeInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<FeePolicyDTO> feePolicies = FeePolicyService.INSTANCE.getAllFeePolicies();
        req.setAttribute("feeList", feePolicies);

        List<DiscountPolicyDTO> discountPolicies = DiscountPolicyService.INSTANCE.getAllDiscountPolicies();
        req.setAttribute("discountList", discountPolicies);

        req.getRequestDispatcher("/WEB-INF/views/fee/feeList.jsp").forward(req, resp);
    }
}
