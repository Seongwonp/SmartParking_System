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

@WebServlet(value="/admin/List")
public class AdminListServlet extends HttpServlet {

    private final AdminService adminService = AdminService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // 검색 키워드 파라미터 받기
        String keyword = request.getParameter("keyword");

        // 검색 또는 전체 목록 조회
        List<UserDTO> adminList = adminService.searchUser(keyword);

        // JSP에 데이터 전달
        request.setAttribute("adminList", adminList);
        request.setAttribute("keyword", keyword);
        request.setAttribute("currentPage", "List"); // 사이드바 설정
        request.getRequestDispatcher("/WEB-INF/jsp/admin/adminList.jsp")
                .forward(request, response);
    }
}