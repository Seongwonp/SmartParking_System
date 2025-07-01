package com.opentime.smartparking_system.controller.admin.notice;

import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet (value = "/admin/notice/delete")
public class NoticeDeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        try {
            int noticeId = Integer.parseInt(req.getParameter("noticeId"));

            boolean success = AdminService.INSTANCE.deleteNotice(noticeId);

            String message;
            if (success) {
                message = URLEncoder.encode("삭제가 완료되었습니다.", StandardCharsets.UTF_8);
                resp.sendRedirect(req.getContextPath() + "/admin/notice/list?successMessage=" + message);
            } else {
                message = URLEncoder.encode("삭제에 실패했습니다.", StandardCharsets.UTF_8);
                resp.sendRedirect(req.getContextPath() + "/admin/notice/list?errorMessage=" + message);
            }
        } catch (Exception e) {
            e.printStackTrace();
            String message = URLEncoder.encode("잘못된 요청입니다.", StandardCharsets.UTF_8);
            resp.sendRedirect(req.getContextPath() + "/admin/notice/list?errorMessage=" + message);
        }
    }
}