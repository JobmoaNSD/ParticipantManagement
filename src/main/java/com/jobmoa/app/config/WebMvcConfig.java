package com.jobmoa.app.config;

import com.jobmoa.app.CounselMain.biz.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.ArrayList;
import java.util.List;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {
    "com.jobmoa.app.CounselMain.view.login",
    "com.jobmoa.app.CounselMain.view.participant",
    "com.jobmoa.app.CounselMain.view.dashboard",
    "com.jobmoa.app.CounselMain.view.ajaxPackage",
    "com.jobmoa.app.CounselMain.view.management",
    "com.jobmoa.app.CounselMain.view.function",
    "com.jobmoa.app.CounselMain.view.report",
    "com.jobmoa.app.CounselMain.view.chatBot",
    "com.jobmoa.app.CounselMain.view.branchManagement",
    "com.jobmoa.app.CounselMain.view.participantRandomAssignment",
    "com.jobmoa.app.CounselMain.view.mailSend",
    "com.jobmoa.app.CounselMain.view.mypage",
    "com.jobmoa.app.jobPlacement.view.jobPlacement",
    "com.jobmoa.app.jobPlacement.view.async"
})
public class WebMvcConfig implements WebMvcConfigurer {

    /**
     * ViewResolver 설정
     * JSP 뷰를 렌더링하기 위한 설정
     */
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/");
        viewResolver.setSuffix(".jsp");
        viewResolver.setOrder(1);
        return viewResolver;
    }

    /**
     * Interceptor 설정
     * 모든 요청에 대해 로그인 체크 인터셉터 적용
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/**");
    }

    /**
     * RequestMappingHandlerAdapter 설정
     * Jackson MessageConverter를 사용한 JSON 변환 설정
     */
    @Bean
    public RequestMappingHandlerAdapter requestMappingHandlerAdapter() {
        RequestMappingHandlerAdapter adapter = new RequestMappingHandlerAdapter();

        List<HttpMessageConverter<?>> messageConverters = new ArrayList<>();
        messageConverters.add(new MappingJackson2HttpMessageConverter());

        adapter.setMessageConverters(messageConverters);
        return adapter;
    }
}
