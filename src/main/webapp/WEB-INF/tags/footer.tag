<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag language="java" pageEncoding="UTF-8" %>

<script>
    $(document).ready(function () {
        let APP_URL = window.location.href; // 현재 페이지 URL
        let email = "namsd@jobmoa.com"; // 수신 이메일
        let subject = APP_URL + " 해당 페이지에 대해 문의 드립니다."; // 이메일 제목
        let body = "로그인 정보";

        // 줄바꿈 추가
        body += "\n"; // 줄바꿈
        body += "ID : ${JOBMOA_LOGIN_DATA.memberUserID}"; // 사용자 ID
        body += "\n\n"; // 줄바꿈
        body += "지점 : ${JOBMOA_LOGIN_DATA.memberBranch}"; // 사용자 지점
        body += "\n\n"; // 줄바꿈
        body += "문의 사항"; // 추가 설명
        body += "\n"; // 줄바꿈

        // 이메일 태그에 동적으로 href 속성 설정
        let emailTag = $("#email-a-tag");

        // mailto 링크 생성
        emailTag.attr("href", "mailto:" + email + "?subject=" + encodeURIComponent(subject) + "&body=" + encodeURIComponent(body));
    });
</script>
<!--begin::Footer-->
<footer class="app-footer">
    <!--begin::To the end-->
    <div class="float-end d-none d-sm-inline">기업 전화번호 : <a href="tel:02-2607-9119">02-2607-9119 (609)</a></div>
    <!--end::To the end-->
    <!--begin::Copyright-->
    <strong>
        사이트 관리자
<%--        <a href="mailto:namsd@jobmoa.com?subject=문의사항&body=문의사항 내용 작성" class="text-decoration-none email-a-tag">남상도</a>.--%>
        <a class="text-decoration-none" id="email-a-tag">남상도</a>.
    </strong>

    <!--end::Copyright-->
</footer>
<!--end::Footer-->
