<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 24. 12. 26.
  Time: 오후 4:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MainLoginPage</title>
</head>
<body>
<div class="container">
    <h1>상담 데이터 조회</h1>
    <table class="data-table">
        <thead>
        <tr>
            <th>일련번호</th>
            <th>등록일</th>
            <th>진행 단계</th>
            <th>최근 상담일</th>
            <th>참여자</th>
            <th>주민등록번호</th>
            <th>연락처</th>
            <th>마감</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="data" items="${datas}">
            <tr>
                <td>${data.participant_serial_number}</td>
                <td>${data.participant_registration_date}</td>
                <td>${data.participant_currentStage}</td>
                <td>${data.participant_initialCounselingElapsedMonths}</td>
                <td>${data.participant_participant}</td>
                <td>${data.participant_ssn}</td>
                <td>${data.participant_contact1}</td>
                <td>${data.participant_closure}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
