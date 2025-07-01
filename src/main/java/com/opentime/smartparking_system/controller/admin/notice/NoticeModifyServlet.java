package com.opentime.smartparking_system.controller.admin.notice;

import com.opentime.smartparking_system.model.dto.NoticeDTO;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(value="/admin/notice/modify")
public class NoticeModifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int noticeId = Integer.parseInt(req.getParameter("noticeId"));
        NoticeDTO noticeDTO = AdminService.INSTANCE.getNoticeById(noticeId);
        req.setAttribute("notice", noticeDTO);
        req.getRequestDispatcher("/WEB-INF/jsp/admin/notice/noticeModify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int noticeId = Integer.parseInt(req.getParameter("noticeId"));
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String writer = req.getParameter("writer");
        boolean isPinned = false;
        String isPinnedParam = req.getParameter("isPinned");
        if ("1".equals(isPinnedParam)) {
            isPinned = true;
        }

        NoticeDTO noticeDTO = new NoticeDTO();
        noticeDTO.setNoticeId(noticeId);
        noticeDTO.setTitle(title);
        noticeDTO.setContent(content);
        noticeDTO.setWriter(writer);
        noticeDTO.setPinned(isPinned);

        boolean success = AdminService.INSTANCE.updateNotice(noticeDTO);

        if (success) {
            String message = URLEncoder.encode("수정이 완료되었습니다.", StandardCharsets.UTF_8);
            resp.sendRedirect(req.getContextPath() + "/admin/notice/list?successMessage=" + message);
        } else {
            req.setAttribute("error", "공지사항 수정에 실패했습니다.");
            req.setAttribute("noticeDTO", noticeDTO);
            req.getRequestDispatcher("/WEB-INF/jsp/admin/notice/noticeModify.jsp").forward(req, resp);
        }
    }
}
