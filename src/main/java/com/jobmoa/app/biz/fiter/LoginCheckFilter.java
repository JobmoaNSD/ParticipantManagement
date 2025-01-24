/*
package com.jobmoa.app.biz.fiter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Slf4j
@WebFilter(urlPatterns = "*.login")
public class LoginCheckFilter extends OncePerRequestFilter {


    public boolean loginCheck(HttpSession session){
        //session에 로그인 정보가 없다 false
        boolean flag = session.getAttribute("JOBMOA_LOGIN_DATA") != null;
        log.info("loginCheck Flag : [{}]", flag);
        return flag;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        log.info("-----------------------------------");
        log.info("---Start LoginFilter---");

        // 요청 URI, 컨텍스트 경로
        String uri = request.getRequestURI();
        String cp = request.getContextPath();

        // 요청 명령어 추출
        String command = uri.substring(cp.length());

        if (!command.equals("/login.do")) {
            if (!loginCheck(request.getSession())) {
                log.info("---login Fail---");
                response.sendRedirect(cp + "/login.do");
                return;
            }
            log.info("---login Success---");
        }

        log.info("---End LoginFilter---");
        log.info("-----------------------------------");
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        log.info("LoginFilter destroy");
    }
}
*/
