package com.jobmoa.app.config;

import jakarta.servlet.Filter;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * web.xml을 대체하는 Java 기반 웹 애플리케이션 초기화 클래스
 * Servlet 3.0+ 환경에서 동작
 */
public class WebAppInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        // 1. Root ApplicationContext 생성 (비즈니스 로직 레이어)
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(RootConfig.class);

        // 2. ContextLoaderListener 등록
        servletContext.addListener(new ContextLoaderListener(rootContext));

        // 3. Servlet ApplicationContext 생성 (웹 레이어)
        AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
        servletAppContext.register(WebMvcConfig.class, WebSocketConfig.class);

        // 4. DispatcherServlet 등록 및 매핑
        DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("ds", dispatcherServlet);
        dispatcher.setLoadOnStartup(1);
        dispatcher.addMapping("*.do");
        dispatcher.addMapping("*.login");
        dispatcher.addMapping("*.api");
        dispatcher.addMapping("/jobPlacement/*");

        // 5. Character Encoding Filter 등록 (UTF-8)
        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        encodingFilter.setEncoding("UTF-8");
        encodingFilter.setForceEncoding(true);

        servletContext.addFilter("characterEncodingFilter", encodingFilter)
                .addMappingForUrlPatterns(null, false, "/*");

        // 6. Session 설정
        servletContext.getSessionCookieConfig().setMaxAge(360 * 60); // 360분 = 6시간

        // 7. Error Page 설정 (선택사항 - JSP에서 처리하는 것이 더 일반적)
        // servletContext의 error page 설정은 프로그래밍 방식으로는 제한적
        // web.xml의 error-page 설정은 유지하거나,
        // @ControllerAdvice를 통한 전역 예외 처리 권장
    }
}
