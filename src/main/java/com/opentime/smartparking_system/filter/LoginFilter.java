package com.opentime.smartparking_system.filter;

import com.opentime.smartparking_system.model.dto.UserDTO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        HttpSession session = req.getSession(false);

        String uri = req.getRequestURI();

        // 공개 접근 허용 URL 체크
        if (isPublicUri(uri)) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        UserDTO user = null;
        if (session != null) {
            user = (UserDTO) session.getAttribute("user");
        }

        if (user != null) {
            // 로그인 되어 있음 → 요청 계속 처리
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            // 로그인 안 되어 있음 → 로그인 메시지 세션에 저장 후 리다이렉트
            HttpSession newSession = req.getSession(true);
            newSession.setAttribute("loginMessage", "로그인이 필요합니다.");
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }

    private boolean isPublicUri(String uri) {
        return uri.equals("/index")                    // 메인 페이지는 공개
                || uri.equals("/")
                || uri.equals("/jsp/include/header.jsp")          // 해더 푸터 파일
                || uri.equals("/jsp/include/footer.jsp")
                || uri.startsWith("/login")            // 로그인 페이지
                || uri.equals("/user/signup")          // 일반 회원가입 페이지
                || uri.startsWith("/resources/")       // 정적 리소스(css, js 등)
                || uri.startsWith("/css/")
                || uri.startsWith("/Info/")        // 공개 컨텐츠
                || uri.startsWith("/contact/")         // 공개 컨텐츠
                || uri.startsWith("/notice/")
                || uri.startsWith("/fee/");
    }
}
