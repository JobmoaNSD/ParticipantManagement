# applicationContext.xml → Java Config 마이그레이션 작업 계획서

## 📋 프로젝트 개요

**프로젝트명**: Spring XML 설정의 Java Config 마이그레이션  
**목표**: XML 기반 설정을 Java 기반 설정으로 전환하여 유지보수성 및 타입 안정성 향상  
**기술 스택**: Spring Framework, Java Config, Annotation-based Configuration  
**예상 기간**: 2-3주

---

## 📅 작업 일정 및 단계별 Task

### Phase 1: 사전 분석 및 준비 (2-3일)

#### Day 1: 현재 XML 설정 분석
- [ ] **Task 1.1**: applicationContext.xml 내용 분석
```
확인 항목:
  - Bean 정의 목록 추출
  - 의존성 주입 패턴 파악
  - Property 설정 확인
  - AOP 설정 확인
  - Transaction 설정 확인
  - DataSource 설정 확인
  - MyBatis 설정 확인
  - Component Scan 범위 확인
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음
- 산출물: XML 설정 분석 문서

- [ ] **Task 1.2**: ds-servlet.xml 내용 분석
```
확인 항목:
  - MVC 설정
  - ViewResolver 설정
  - Interceptor 설정
  - MultipartResolver 설정
  - MessageConverter 설정
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 1.3**: web.xml 내용 분석
```
확인 항목:
  - Servlet 설정
  - Filter 설정
  - Listener 설정
  - Context Parameter
```

- 예상 시간: 1시간
- 담당자: Backend 개발자
- 우선순위: 높음

#### Day 2: 마이그레이션 전략 수립
- [ ] **Task 1.4**: Config 클래스 구조 설계
```
설계 내용:
  1. RootConfig (기존 applicationContext.xml)
     - DataSource 설정
     - MyBatis 설정
     - Transaction 설정
     - Service/DAO Bean 설정
  
  2. WebMvcConfig (기존 ds-servlet.xml)
     - MVC 설정
     - ViewResolver
     - Interceptor
     - MessageConverter
  
  3. WebSocketConfig (신규)
     - WebSocket 설정
     - STOMP 설정
  
  4. SecurityConfig (필요시)
     - Spring Security 설정
  
  5. WebAppInitializer (기존 web.xml)
     - Servlet 초기화
     - Filter 등록
     - Listener 등록
```

- 예상 시간: 4시간
- 담당자: Backend 개발자
- 우선순위: 높음
- 산출물: Config 클래스 구조 다이어그램

- [ ] **Task 1.5**: 마이그레이션 체크리스트 작성
```
- Bean 전환 체크리스트
  - 테스트 계획
  - 롤백 계획
  - 리스크 관리 계획
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 중간

#### Day 3: 개발 환경 준비
- [ ] **Task 1.6**: 의존성 확인 및 업데이트
```
pom.xml 확인:
  - Spring Framework 버전 확인
  - Jakarta EE API 버전 확인
  - 필요시 버전 업그레이드
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 1.7**: Git 브랜치 전략 수립
```
- feature/java-config-migration 브랜치 생성
  - 마일스톤 별 브랜치 정의
  - 코드 리뷰 프로세스 정의
```

- 예상 시간: 1시간
- 담당자: Backend 개발자
- 우선순위: 중간

- [ ] **Task 1.8**: 백업 및 롤백 준비
```
- 현재 XML 설정 파일 백업
  - 데이터베이스 백업
  - 롤백 스크립트 작성
```

- 예상 시간: 1시간
- 담당자: Backend 개발자
- 우선순위: 높음

---

### Phase 2: DataSource 및 MyBatis 설정 마이그레이션 (3-4일)

#### Day 4-5: RootConfig 기본 구조 생성
- [ ] **Task 2.1**: RootConfig 클래스 생성
```java
경로: src/main/java/com/jobmoa/app/config/RootConfig.java
  
  어노테이션:
  @Configuration
  @ComponentScan(basePackages = {
      "com.jobmoa.app.**.biz",
      "com.jobmoa.app.**.service"
  })
  @PropertySource("classpath:application.properties")
  @EnableTransactionManagement
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 2.2**: DataSource Bean 설정
```java
주요 Bean:
  - DataSource (HikariCP 또는 DBCP2)
  - Properties 파일에서 DB 정보 로드
  - 연결 풀 설정
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 2.3**: MyBatis 설정 마이그레이션
```java
주요 Bean:
  - SqlSessionFactory
  - SqlSessionTemplate
  - MapperScannerConfigurer
  
  설정 항목:
  - Mapper XML 위치
  - Type Alias 설정
  - MyBatis Configuration
```

- 예상 시간: 4시간
- 담당자: Backend 개발자
- 우선순위: 높음

#### Day 6: Transaction 설정
- [ ] **Task 2.4**: TransactionManager 설정
```java
주요 Bean:
  - DataSourceTransactionManager
  - @Transactional 어노테이션 활성화
  - Transaction Advisor 설정
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 2.5**: AOP 설정 마이그레이션 (필요시)
```java
- @EnableAspectJAutoProxy
  - Aspect Bean 설정
  - Pointcut 정의
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 중간

#### Day 7: 추가 Bean 설정
- [ ] **Task 2.6**: 기타 Service Bean 마이그레이션
```java
- 비즈니스 로직 Bean
  - 유틸리티 Bean
  - 외부 API 연동 Bean
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 중간

- [ ] **Task 2.7**: RootConfig 단위 테스트
```java
경로: src/test/java/com/jobmoa/app/config/RootConfigTest.java
  
  테스트 항목:
  - Context 로딩 테스트
  - Bean 생성 테스트
  - DataSource 연결 테스트
  - Transaction 동작 테스트
```

- 예상 시간: 4시간
- 담당자: Backend 개발자
- 우선순위: 높음

---

### Phase 3: Web MVC 설정 마이그레이션 (3-4일)

#### Day 8-9: WebMvcConfig 구현
- [ ] **Task 3.1**: WebMvcConfig 클래스 생성
```java
경로: src/main/java/com/jobmoa/app/config/WebMvcConfig.java
  
  어노테이션:
  @Configuration
  @EnableWebMvc
  @ComponentScan(basePackages = {
      "com.jobmoa.app.**.controller",
      "com.jobmoa.app.**.view"
  })
  
  구현:
  implements WebMvcConfigurer
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 3.2**: ViewResolver 설정
```java
주요 메서드:
  - configureViewResolvers()
  
  설정 항목:
  - InternalResourceViewResolver
  - Prefix: /WEB-INF/views/
  - Suffix: .jsp
  - Order 설정
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 3.3**: 정적 리소스 핸들링
```java
주요 메서드:
  - addResourceHandlers()
  
  설정:
  - /css/** → /css/
  - /js/** → /js/
  - /img/** → /img/
  - Cache 설정
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

#### Day 10: Interceptor 및 MessageConverter 설정
- [ ] **Task 3.4**: Interceptor 마이그레이션
```java
주요 메서드:
  - addInterceptors()
  
  설정 항목:
  - 로그인 체크 Interceptor
  - 권한 체크 Interceptor
  - 로깅 Interceptor
  - Path Pattern 설정
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 3.5**: MessageConverter 설정
```java
주요 메서드:
  - configureMessageConverters()
  
  설정:
  - MappingJackson2HttpMessageConverter
  - StringHttpMessageConverter
  - 인코딩 설정 (UTF-8)
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

#### Day 11: 추가 MVC 설정
- [ ] **Task 3.6**: MultipartResolver 설정
```java
Bean:
  - CommonsMultipartResolver 또는 StandardServletMultipartResolver
  
  설정:
  - maxUploadSize
  - maxInMemorySize
  - defaultEncoding
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 중간

- [ ] **Task 3.7**: CORS 설정 (필요시)
```java
주요 메서드:
  - addCorsMappings()
  
  설정:
  - Allowed Origins
  - Allowed Methods
  - Allowed Headers
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 중간

- [ ] **Task 3.8**: WebMvcConfig 단위 테스트
```java
테스트 항목:
  - Context 로딩 테스트
  - ViewResolver 동작 테스트
  - Interceptor 동작 테스트
  - 정적 리소스 접근 테스트
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음

---

### Phase 4: WebAppInitializer 구현 (2-3일)

#### Day 12-13: web.xml 대체
- [ ] **Task 4.1**: WebAppInitializer 클래스 생성
```java
경로: src/main/java/com/jobmoa/app/config/WebAppInitializer.java
  
  구현:
  implements WebApplicationInitializer
  
  또는
  
  extends AbstractAnnotationConfigDispatcherServletInitializer
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 4.2**: DispatcherServlet 설정
```java
주요 메서드:
  - getRootConfigClasses() → RootConfig.class
  - getServletConfigClasses() → WebMvcConfig.class
  - getServletMappings() → "/"
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 4.3**: Filter 설정
```java
주요 메서드:
  - getServletFilters()
  
  Filter 목록:
  - CharacterEncodingFilter (UTF-8)
  - HiddenHttpMethodFilter (REST 지원)
  - CorsFilter (필요시)
  - 커스텀 Filter
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음

#### Day 14: Listener 및 추가 설정
- [ ] **Task 4.4**: ContextLoaderListener 설정
```java
- Root ApplicationContext 로딩
  - Servlet ApplicationContext 로딩
  - Context 계층 구조 설정
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 4.5**: Session 설정
```java
주요 메서드:
  - onStartup()
  
  설정:
  - Session Timeout
  - Cookie 설정
  - HttpOnly, Secure 플래그
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 중간

- [ ] **Task 4.6**: Error Page 설정
```java
- 에러 코드별 페이지 매핑
  - Exception 타입별 페이지 매핑
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 중간

---

### Phase 5: WebSocket 설정 통합 (1-2일)

#### Day 15: WebSocket Config 마이그레이션
- [ ] **Task 5.1**: WebSocketConfig 클래스 생성 (이미 작성된 경우 통합)
```java
경로: src/main/java/com/jobmoa/app/config/WebSocketConfig.java
  
  어노테이션:
  @Configuration
  @EnableWebSocketMessageBroker
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 5.2**: STOMP Endpoint 설정
```java
주요 메서드:
  - configureMessageBroker()
  - registerStompEndpoints()
  
  설정:
  - Message Broker prefix
  - Application destination prefix
  - SockJS 설정
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 5.3**: WebSocket Interceptor 통합
```java
- HandshakeInterceptor 설정
  - ChannelInterceptor 설정
  - 인증/인가 로직 통합
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음

---

### Phase 6: 통합 테스트 및 검증 (3-4일)

#### Day 16-17: 단계별 통합 테스트
- [ ] **Task 6.1**: Context 로딩 테스트
```java
테스트 항목:
  - RootConfig Context 로딩
  - WebMvcConfig Context 로딩
  - Bean 의존성 주입 확인
  - Circular Dependency 확인
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 6.2**: 데이터베이스 연동 테스트
```java
테스트 항목:
  - DataSource 연결
  - MyBatis Mapper 동작
  - Transaction 커밋/롤백
  - CRUD 기본 동작
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 6.3**: MVC 동작 테스트
```java
테스트 항목:
  - Controller 매핑
  - ViewResolver 동작
  - Interceptor 동작
  - 정적 리소스 로딩
  - 파일 업로드
```

- 예상 시간: 4시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 6.4**: WebSocket 통합 테스트
```java
테스트 항목:
  - WebSocket 연결
  - STOMP 메시지 송수신
  - Interceptor 동작
  - 에러 핸들링
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음

#### Day 18-19: 기능 통합 테스트
- [ ] **Task 6.5**: 전체 기능 시나리오 테스트
```
테스트 시나리오:
  1. 로그인 → 메인 페이지
  2. CRUD 작업 수행
  3. 파일 업로드/다운로드
  4. 알림 수신
  5. 로그아웃
```

- 예상 시간: 6시간
- 담당자: QA 팀 + Backend 개발자
- 우선순위: 높음

- [ ] **Task 6.6**: 성능 테스트
```
테스트 항목:
  - 애플리케이션 시작 시간
  - 메모리 사용량
  - 응답 시간
  - 동시 접속자 처리
```

- 예상 시간: 4시간
- 담당자: Backend 개발자
- 우선순위: 중간

- [ ] **Task 6.7**: 에러 시나리오 테스트
```
테스트 항목:
  - Bean 생성 실패
  - DB 연결 실패
  - Transaction 롤백
  - Exception 핸들링
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 높음

---

### Phase 7: XML 파일 제거 및 정리 (1-2일)

#### Day 20: XML 파일 처리
- [ ] **Task 7.1**: XML 파일 백업
```
백업 위치:
  - src/main/resources/legacy-config/
  
  백업 파일:
  - applicationContext.xml
  - ds-servlet.xml
  - web.xml (필요시)
```

- 예상 시간: 1시간
- 담당자: Backend 개발자
- 우선순위: 높음

- [ ] **Task 7.2**: XML 파일 제거 (선택적)
```
제거 대상:
  - applicationContext.xml (또는 .bak로 변경)
  - ds-servlet.xml (또는 .bak로 변경)
  
  주의사항:
  - 완전한 테스트 완료 후 제거
  - 롤백 가능하도록 보관
```

- 예상 시간: 1시간
- 담당자: Backend 개발자
- 우선순위: 중간

- [ ] **Task 7.3**: web.xml 처리
```
옵션 1: 완전 제거 (Servlet 3.0+)
  옵션 2: 최소 설정만 유지
  옵션 3: 하이브리드 (일부 설정 유지)
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 중간

#### Day 21: 코드 정리 및 문서화
- [ ] **Task 7.4**: Import 정리
```
- 불필요한 import 제거
  - Deprecated API 제거
  - Code Formatting
```

- 예상 시간: 2시간
- 담당자: Backend 개발자
- 우선순위: 낮음

- [ ] **Task 7.5**: JavaDoc 작성
```
문서화 대상:
  - Config 클래스
  - Bean 메서드
  - 주요 설정 옵션
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 중간

- [ ] **Task 7.6**: 마이그레이션 가이드 문서 작성
```
내용:
  - 변경 사항 요약
  - Before/After 비교
  - 트러블슈팅 가이드
  - 롤백 절차
```

- 예상 시간: 3시간
- 담당자: Backend 개발자
- 우선순위: 중간

---

### Phase 8: 배포 및 모니터링 (2일)

#### Day 22: 스테이징 배포
- [ ] **Task 8.1**: 스테이징 환경 설정
```
- 환경별 Properties 설정
  - Profile 설정 (dev, staging, prod)
  - 로깅 설정 확인
```

- 예상 시간: 2시간
- 담당자: DevOps + Backend 개발자
- 우선순위: 높음

- [ ] **Task 8.2**: 스테이징 배포 및 검증
```
검증 항목:
  - 애플리케이션 정상 구동
  - 모든 기능 동작 확인
  - 로그 확인
  - 에러 모니터링
```

- 예상 시간: 4시간
- 담당자: DevOps + QA 팀
- 우선순위: 높음

- [ ] **Task 8.3**: 스모크 테스트
```
- 주요 기능 빠른 점검
  - 성능 확인
  - 에러 로그 점검
```

- 예상 시간: 2시간
- 담당자: QA 팀
- 우선순위: 높음

#### Day 23: 운영 배포
- [ ] **Task 8.4**: 배포 전 체크리스트 확인
```
- [ ] 모든 테스트 통과
  - [ ] 코드 리뷰 완료
  - [ ] 문서화 완료
  - [ ] 롤백 계획 수립
  - [ ] 모니터링 설정
  - [ ] 팀원 공유
```

- 예상 시간: 1시간
- 담당자: 프로젝트 매니저
- 우선순위: 높음

- [ ] **Task 8.5**: 운영 환경 배포
```
배포 절차:
  1. 데이터베이스 백업
  2. 애플리케이션 중단 (또는 무중단 배포)
  3. 새 버전 배포
  4. 헬스체크
  5. 로그 모니터링
```

- 예상 시간: 2시간
- 담당자: DevOps
- 우선순위: 높음

- [ ] **Task 8.6**: 배포 후 모니터링
```
모니터링 항목:
  - 애플리케이션 로그
  - 에러 발생 여부
  - 성능 메트릭
  - 사용자 피드백
  
  모니터링 기간: 최소 24-48시간
```

- 예상 시간: 지속적
- 담당자: DevOps + Backend 개발자
- 우선순위: 높음

---

## 📂 생성될 Config 클래스 구조

```
src/main/java/com/jobmoa/app/config/
├── RootConfig.java                    # 핵심 Bean 설정
├── WebMvcConfig.java                  # Spring MVC 설정
├── WebSocketConfig.java               # WebSocket 설정
├── WebAppInitializer.java             # Servlet 초기화
├── DataSourceConfig.java              # DataSource 설정 (선택)
├── MyBatisConfig.java                 # MyBatis 설정 (선택)
├── TransactionConfig.java             # Transaction 설정 (선택)
└── SecurityConfig.java                # Security 설정 (필요시)
```


---

## 🔄 마이그레이션 매핑 테이블

| XML 설정 | Java Config | 비고 |
|----------|-------------|------|
| `<context:component-scan>` | `@ComponentScan` | 패키지 경로 동일 |
| `<context:property-placeholder>` | `@PropertySource` | Properties 파일 로드 |
| `<bean id="..." class="...">` | `@Bean` 메서드 | Bean 정의 |
| `<mvc:annotation-driven>` | `@EnableWebMvc` | MVC 설정 활성화 |
| `<mvc:interceptors>` | `addInterceptors()` | Interceptor 등록 |
| `<mvc:resources>` | `addResourceHandlers()` | 정적 리소스 |
| `<tx:annotation-driven>` | `@EnableTransactionManagement` | Transaction 활성화 |
| `<aop:aspectj-autoproxy>` | `@EnableAspectJAutoProxy` | AOP 활성화 |
| `web.xml - <servlet>` | `WebApplicationInitializer` | Servlet 등록 |
| `web.xml - <filter>` | `getServletFilters()` | Filter 등록 |

---

## 📊 코드 예시

### 1. RootConfig.java
```java
package com.jobmoa.app.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import lombok.RequiredArgsConstructor;

@Configuration
@ComponentScan(basePackages = {
    "com.jobmoa.app.**.biz",
    "com.jobmoa.app.**.service"
})
@MapperScan(
    basePackages = "com.jobmoa.app.**.dao",
    sqlSessionFactoryRef = "sqlSessionFactory"
)
@PropertySource("classpath:application.properties")
@EnableTransactionManagement
@RequiredArgsConstructor
public class RootConfig {

    private final Environment env;

    @Bean
    public DataSource dataSource() {
        HikariConfig config = new HikariConfig();
        config.setDriverClassName(env.getProperty("jdbc.driver"));
        config.setJdbcUrl(env.getProperty("jdbc.url"));
        config.setUsername(env.getProperty("jdbc.username"));
        config.setPassword(env.getProperty("jdbc.password"));
        config.setMaximumPoolSize(20);
        config.setMinimumIdle(5);
        config.setConnectionTimeout(30000);
        config.setIdleTimeout(600000);
        config.setMaxLifetime(1800000);
        
        return new HikariDataSource(config);
    }

    @Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        
        // MyBatis Config
        sessionFactory.setConfigLocation(
            new PathMatchingResourcePatternResolver()
                .getResource("classpath:sql-map-config.xml")
        );
        
        // Mapper XML 위치
        sessionFactory.setMapperLocations(
            new PathMatchingResourcePatternResolver()
                .getResources("classpath:mappings/**/*-mapping.xml")
        );
        
        return sessionFactory.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate() throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory());
    }

    @Bean
    public PlatformTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }
}
```


### 2. WebMvcConfig.java
```java
package com.jobmoa.app.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.List;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {
    "com.jobmoa.app.**.controller",
    "com.jobmoa.app.**.view"
})
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        resolver.setOrder(1);
        registry.viewResolver(resolver);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**")
                .addResourceLocations("/css/")
                .setCachePeriod(3600);
        
        registry.addResourceHandler("/js/**")
                .addResourceLocations("/js/")
                .setCachePeriod(3600);
        
        registry.addResourceHandler("/img/**")
                .addResourceLocations("/img/")
                .setCachePeriod(86400);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // Interceptor 추가 예시
        // registry.addInterceptor(new LoginCheckInterceptor())
        //         .addPathPatterns("/**")
        //         .excludePathPatterns("/login", "/css/**", "/js/**");
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(new MappingJackson2HttpMessageConverter());
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver();
        resolver.setMaxUploadSize(52428800); // 50MB
        resolver.setMaxInMemorySize(1048576); // 1MB
        resolver.setDefaultEncoding("UTF-8");
        return resolver;
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("*")
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowedHeaders("*")
                .maxAge(3600);
    }
}
```


### 3. WebAppInitializer.java
```java
package com.jobmoa.app.config;

import jakarta.servlet.Filter;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { RootConfig.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { WebMvcConfig.class, WebSocketConfig.class };
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }

    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
        encodingFilter.setEncoding("UTF-8");
        encodingFilter.setForceEncoding(true);
        
        HiddenHttpMethodFilter httpMethodFilter = new HiddenHttpMethodFilter();
        
        return new Filter[] { encodingFilter, httpMethodFilter };
    }
}
```


---

## ⚠️ 주의사항

### 1. 하이브리드 접근 (권장)
```
초기 마이그레이션 시:
- 핵심 Bean은 Java Config로 전환
- 복잡한 설정은 XML 유지 (일시적)
- 단계적으로 완전 전환
```


### 2. 테스트 전략
```
- 각 Config 클래스별 단위 테스트 필수
- 통합 테스트 반드시 수행
- 롤백 계획 항상 준비
```


### 3. 팀 커뮤니케이션
```
- 마이그레이션 일정 공유
- 코드 리뷰 철저히 진행
- 문제 발생 시 즉시 공유
```


---

## 🎯 우선순위별 작업 분류

### P0 (최우선 - 핵심 기능)
- RootConfig (DataSource, MyBatis, Transaction)
- WebMvcConfig (기본 MVC 설정)
- WebAppInitializer

### P1 (높음 - 중요 기능)
- Interceptor 마이그레이션
- Filter 마이그레이션
- 통합 테스트

### P2 (중간 - 선택적)
- WebSocketConfig 통합
- 성능 최적화
- 추가 설정 마이그레이션

### P3 (낮음 - 부가 기능)
- XML 파일 완전 제거
- 문서화
- 코드 정리

---

## 📝 체크리스트

### 마이그레이션 전
- [ ] 현재 XML 설정 완전 이해
- [ ] Bean 의존성 그래프 작성
- [ ] 백업 완료
- [ ] 롤백 계획 수립

### 마이그레이션 중
- [ ] 각 Config 클래스 단위 테스트
- [ ] Context 로딩 확인
- [ ] Bean 생성 확인
- [ ] 의존성 주입 확인

### 마이그레이션 후
- [ ] 전체 기능 테스트 통과
- [ ] 성능 테스트 완료
- [ ] 문서화 완료
- [ ] 팀원 교육 완료

---

## 📞 리소스 및 역할

**Backend 개발자 (1-2명)**: 전체 마이그레이션 작업  
**QA 엔지니어 (1명)**: 테스트 및 검증  
**DevOps (0.5명)**: 배포 지원  
**예상 공수**: 15-20 Man-days

---

**작성일**: 2025-11-10  
**문서 버전**: 1.0  
**상태**: 초안