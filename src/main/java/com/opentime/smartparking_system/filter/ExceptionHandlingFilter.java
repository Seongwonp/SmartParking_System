package com.opentime.smartparking_system.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter("/*")
public class ExceptionHandlingFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        try {
            filterChain.doFilter(servletRequest, servletResponse);
        } catch (Exception e) {
            // 콘솔 로그 찍고
            e.printStackTrace();

            // 예외 객체를 request에 담아 에러 페이지로 전달
            servletRequest.setAttribute("error", e);
            servletRequest.getRequestDispatcher("/WEB-INF/views/error/SERVER_ERROR.jsp").forward(servletRequest, servletResponse);
        }
    }
}
