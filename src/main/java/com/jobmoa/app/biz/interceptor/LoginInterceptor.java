package com.jobmoa.app.biz.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("-----------------------------------");
        log.info("---Start LoginInterceptor---");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("JOBMOA_LOGIN_DATA") == null) {
            log.info("---Login Fail: Redirecting to login page---");
            response.sendRedirect(request.getContextPath() + "/login.do");
            return false;
        }

        log.info("---Login Success---");
        log.info("-----------------------------------");
        return true; // 컨트롤러 실행을 허용
    }

}
