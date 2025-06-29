package com.opentime.smartparking_system.controller.notice;

import com.opentime.smartparking_system.service.NoticeService;
import com.opentime.smartparking_system.model.dto.NoticeDTO;
import lombok.extern.log4j.Log4j2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Log4j2
@WebServlet("/notice/list")
public class NoticeListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int page = req.getParameter("page") != null ? Integer.parseInt(req.getParameter("page")) : 1;
        int size = req.getParameter("size") != null ? Integer.parseInt(req.getParameter("size")) : 10;
        int offset = (page - 1) * size;

        String keyword = req.getParameter("keyword");

        List<NoticeDTO> noticeList;
        int totalCount;

        if (keyword != null && !keyword.isEmpty()) {
            noticeList = NoticeService.INSTANCE.searchNotice(offset, size, keyword);
            totalCount = NoticeService.INSTANCE.getSearchNoticeCount(keyword);
        } else {
            noticeList = NoticeService.INSTANCE.getAllNotice(offset, size);
            totalCount = NoticeService.INSTANCE.getTotalNoticeCount();
        }

        int totalPages = (totalCount + size - 1) / size;

        req.setAttribute("noticeList", noticeList);
        req.setAttribute("currentPage", page);
        req.setAttribute("size", size);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("keyword", keyword);

        req.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp").forward(req, resp);
    }
}
