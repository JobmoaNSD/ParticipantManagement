<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 24. 12. 26.
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<html>
<head>
    <title>잡모아</title>
    <!-- Jobmoa 로고 탭 이미지 -->
    <mytag:Logo/>

    <link rel="stylesheet" href="/css/loginPage.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- mouse pointer 모양 bootstrap 5 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h2>Login</h2>
        <form action="/login.do" method="POST">
            <div class="input-group">
                <label for="memberUserID">Username</label>
                <input type="text" id="memberUserID" name="memberUserID" placeholder="아이디를 입력해주세요" required>
            </div>
            <div class="input-group">
                <label for="memberUserPW">Password</label>
                <input type="password" id="memberUserPW" name="memberUserPW" placeholder="패스워드를 입력해주세요" required>
            </div>
            <div class="button-group">
                <button type="submit" class="btn">Login</button>
            </div>
            <div class="link-group">
                <a href="#" onclick="alert('준비중인 서비스입니다.')">Forgot Password?</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
