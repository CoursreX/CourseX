<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="./resources/css/index.css" />
    <link rel="stylesheet" href="./resources/css/forgetPwd.css" />
</head>
<body>
<div class="forget__layout">
    <div class="forget__container">
        <p class="forgot-password">Forgot Password</p>
        <p class="forgot-msg">학번을 입력하시면 학번에 저장된 이메일로 인증번호를 보내드립니다.</p>
        <%
            String errorMessage = (String)request.getAttribute("errorMessage");
            if(errorMessage != null) {
        %>
        <p style="color: red;"><%= errorMessage %></p>
        <% } %>

        <!-- 이곳에 로그인 폼 등의 내용 추가 -->
        <form method="post" action="pwd_verify.jsp">
            <input type="text" name="user" placeholder="학번">
            <input type="submit" name="Submit" value="Send">
            <input type="button" name="button" value="Back to login" onclick="location.href='login.jsp';">
        </form>

    </div>
</div>
</body>
</html>