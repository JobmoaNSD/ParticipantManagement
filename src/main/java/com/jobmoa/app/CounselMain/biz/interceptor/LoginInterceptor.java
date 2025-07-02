package com.jobmoa.app.CounselMain.biz.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

@Slf4j // 로깅 기능을 제공하는 Lombok 애노테이션
public class LoginInterceptor implements HandlerInterceptor { // 스프링 MVC의 HandlerInterceptor 구현 클래스

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 요청이 컨트롤러에 도달하기 전에 실행되는 메서드

        log.info("-----------------------------------"); // 로그 구분 라인
        log.info("---Start LoginInterceptor---"); // 인터셉터 시작 로그 출력

        boolean flag = true;

        HttpSession session = request.getSession(false);
        // 현재 HTTP 요청에 연관된 세션을 가져옴.
        // `false` 옵션: 기존 세션이 없으면 새로운 세션을 생성하지 않고 null을 반환함.

        if (session == null || session.getAttribute("JOBMOA_LOGIN_DATA") == null) {
            // 세션이 없거나, 특정 로그인 데이터("JOBMOA_LOGIN_DATA") 속성이 없는 경우
            log.info("---Login Fail: Redirecting to login page---");
            // 로그인을 실패했다고 로그 출력

            response.sendRedirect("/login.do");
            // 로그인 페이지("/login.do")로 리다이렉트

            flag = false;
            // 컨트롤러 실행을 중단하고 요청 처리를 여기서 종료
        }

        log.info("---Login Success---");
        // 세션 정보가 있고, 로그인 데이터가 포함되어 있으므로 로그인을 성공했다고 출력

        log.info("-----------------------------------"); // 로그 구분 라인

        return flag; // 정상적으로 요청을 처리하도록 컨트롤러 실행을 허용
    }

}
