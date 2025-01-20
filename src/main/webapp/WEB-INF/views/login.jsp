<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 24. 12. 26.
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>JobmoaLoginPage</title>
    <link rel="stylesheet" href="/css/loginPage.css">
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h2>Login</h2>
        <form action="/login.do" method="POST">
            <div class="input-group">
                <label for="member_userid">Username</label>
                <input type="text" id="member_userid" name="member_userid" placeholder="아이디를 입력해주세요" required>
            </div>
            <div class="input-group">
                <label for="member_userpw">Password</label>
                <input type="password" id="member_userpw" name="member_userpw" placeholder="패스워드를 입력해주세요" required>
            </div>
            <div class="button-group">
                <button type="submit" class="btn">Login</button>
            </div>
            <div class="link-group">
                <a href="#">Forgot Password?</a>
                <a href="#">Sign Up</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
