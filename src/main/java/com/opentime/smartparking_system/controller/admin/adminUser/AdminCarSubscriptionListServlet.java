package com.opentime.smartparking_system.controller.admin.adminUser;

import com.opentime.smartparking_system.model.dto.UserSubscriptionDTO;
import com.opentime.smartparking_system.service.AdminService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/subscription/car/list")
public class AdminCarSubscriptionListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        String status = req.getParameter("status");

        // 통합된 서비스 메서드 사용
        List<UserSubscriptionDTO> list = AdminService.INSTANCE.getSubscriptions(type, status, null);

        req.setAttribute("filteredList", list);

        List<UserSubscriptionDTO> expiredList = AdminService.INSTANCE.getSubscriptions(null, null, true);
        req.setAttribute("expiredList", expiredList);

        req.setAttribute("currentPage", "memberManage"); // 사이드바 설정
        req.getRequestDispatcher("/WEB-INF/jsp/admin/user/carList.jsp").forward(req, resp);
    }


    // JSP에서는 filteredList를 사용하여 출력

    // select 박스 변경시 form 제출하도록 수정 필요 (JSP쪽)
}
