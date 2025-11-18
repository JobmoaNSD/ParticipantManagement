package com.jobmoa.app.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

/**
 * WebSocket 설정
 * STOMP 프로토콜을 사용한 메시지 브로커 설정
 */
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    /**
     * 메시지 브로커 설정
     * - /topic: 구독(subscribe) 엔드포인트
     * - /app: 애플리케이션 목적지 prefix
     */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        // Simple broker를 활성화하고 destination prefix 설정
        config.enableSimpleBroker("/topic", "/queue");

        // 클라이언트에서 보내는 메시지의 prefix 설정
        config.setApplicationDestinationPrefixes("/app");
    }

    /**
     * STOMP 엔드포인트 등록
     * WebSocket 연결을 위한 엔드포인트 설정
     */
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // WebSocket 엔드포인트 등록
        registry.addEndpoint("/ws")
                // ⚠️  운영 환경에서는 반드시 특정 도메인으로 제한해야 합니다!
                // 개발: .setAllowedOriginPatterns("*")
                // 운영: .setAllowedOrigins("https://yourdomain.com", "https://www.yourdomain.com")
                .setAllowedOriginPatterns("*")  // TODO: 운영 환경에서는 특정 도메인으로 변경
                .withSockJS();  // SockJS fallback 옵션 활성화

        // 추가 엔드포인트 (필요시)
        registry.addEndpoint("/ws-notification")
                .setAllowedOriginPatterns("*")  // TODO: 운영 환경에서는 특정 도메인으로 변경
                .withSockJS();
    }

    /**
     * 메시지 변환 설정 (선택사항)
     * 필요시 커스텀 메시지 컨버터 추가 가능
     */
    // @Override
    // public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
    //     return true;
    // }

    /**
     * Inbound Channel 설정 (선택사항)
     * 메시지 처리 쓰레드 풀 설정
     */
    // @Override
    // public void configureClientInboundChannel(ChannelRegistration registration) {
    //     registration.interceptors(new CustomChannelInterceptor());
    //     registration.taskExecutor()
    //         .corePoolSize(4)
    //         .maxPoolSize(8);
    // }

    /**
     * Outbound Channel 설정 (선택사항)
     */
    // @Override
    // public void configureClientOutboundChannel(ChannelRegistration registration) {
    //     registration.taskExecutor()
    //         .corePoolSize(4)
    //         .maxPoolSize(8);
    // }
}
