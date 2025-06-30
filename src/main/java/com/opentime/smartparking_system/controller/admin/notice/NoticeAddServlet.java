package com.opentime.smartparking_system.controller.admin.notice;

import com.opentime.smartparking_system.model.dto.NoticeDTO;
import com.opentime.smartparking_system.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

@Log4j2
@WebServlet(value="/admin/notice/add")
public class NoticeAddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 폼에서 넘어온 값 받기
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String writer = request.getParameter("writer");
        String isPinnedParam = request.getParameter("isPinned");
        boolean pinned = isPinnedParam != null && isPinnedParam.equals("1");

        NoticeDTO notice = new NoticeDTO();
        notice.setTitle(title);
        notice.setContent(content);
        notice.setWriter(writer);
        notice.setPinned(pinned);

        boolean success = AdminService.INSTANCE.insertNotice(notice);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/notice/list");
        } else {
            request.setAttribute("error", "공지사항 등록에 실패했습니다.");
            request.getRequestDispatcher("/WEB-INF/jsp/admin/notice/noticeAdd.jsp").forward(request, response);
        }
    }
}
