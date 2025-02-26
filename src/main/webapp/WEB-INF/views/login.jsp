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
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
                <a href="#">Forgot Password?</a>
                <a href="#">Sign Up</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
