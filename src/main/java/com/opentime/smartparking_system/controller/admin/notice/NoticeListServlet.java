package com.opentime.smartparking_system.controller.admin.notice;

import com.opentime.smartparking_system.model.dto.NoticeDTO;
import com.opentime.smartparking_system.model.vo.NoticeVO;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value="/admin/notice/list")
public class NoticeListServlet extends HttpServlet {

    private final AdminService adminService = AdminService.INSTANCE;

    private static final int PAGE_SIZE = 10;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");

        List<NoticeDTO> noticeList = adminService.getNoticeList(keyword);

        req.setAttribute("noticeList", noticeList);
        req.setAttribute("keyword", keyword);

        req.getRequestDispatcher("/WEB-INF/jsp/admin/notice/noticeList.jsp").forward(req, resp);
    }
}