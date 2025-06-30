package com.opentime.smartparking_system.controller.notice;

import com.opentime.smartparking_system.model.dto.NoticeDTO;
import com.opentime.smartparking_system.service.NoticeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value="/notice/Info")
public class NoticeInfoServlet extends HttpServlet {

    private final NoticeService noticeService = NoticeService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("noticeId");
        if (idStr == null || idStr.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/notice/list");
            return;
        }

        try {
            int noticeId = Integer.parseInt(idStr);
            NoticeDTO notice = noticeService.getNotice(noticeId);

            if (notice == null) {
                req.setAttribute("errorMsg", "존재하지 않는 공지사항입니다.");
                req.getRequestDispatcher("/WEB-INF/views/error/NOT_FOUND.jsp").forward(req, resp);
                return;
            }
            noticeService.addView(noticeId);
            req.setAttribute("notice", notice);
            req.getRequestDispatcher("/WEB-INF/views/notice/noticeInfo.jsp").forward(req, resp);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/notice/list");
        }
    }
}