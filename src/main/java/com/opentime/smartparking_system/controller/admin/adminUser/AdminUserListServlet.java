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

@WebServlet(value = "/admin/user/list")
public class AdminUserListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");
        String keyword = req.getParameter("keyword");
        String orderBy = req.getParameter("orderBy");

        if (orderBy == null ||
                (!orderBy.equalsIgnoreCase("ASC") && !orderBy.equalsIgnoreCase("DESC"))) {
            orderBy = "DESC";
        }

        // 서비스 호출
        List<UserDTO> userList = AdminService.INSTANCE.getListUsers(op, keyword, orderBy);

        // request 에 데이터 담기
        req.setAttribute("userList", userList);
        req.setAttribute("op", op);
        req.setAttribute("keyword", keyword);
        req.setAttribute("orderBy", orderBy);

        req.setAttribute("currentPage", "memberManage"); // 사이드바 설정
        // JSP로 이동
        req.getRequestDispatcher("/WEB-INF/jsp/admin/user/userList.jsp").forward(req, resp);
    }

}
