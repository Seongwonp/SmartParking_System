package com.opentime.smartparking_system.controller;

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
public class NoticeInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int limit = req.getParameter("limit") != null ? Integer.parseInt(req.getParameter("limit")) : 10;
        int offset = req.getParameter("offset") != null ? Integer.parseInt(req.getParameter("offset")) : 0;
        List<NoticeDTO> noticeList = NoticeService.INSTANCE.getAllNotice(limit, offset);
        req.setAttribute("noticeList", noticeList);
        req.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp").forward(req, resp);
    }
}
