<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F5; /* 페이지 배경색 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 900px; /* 너비를 크게 설정 */
            height: 600px; /* 높이를 크게 설정 */
            background-color: #042131; /* 더 짙은 남색 배경 */
            border-radius: 15px; /* 모서리 둥글게 */
            padding: 30px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            color: white; /* 텍스트 색상을 흰색으로 변경 */
            text-align: center; /* 텍스트 중앙 정렬 */
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .container input[type="text"],
        .container input[type="password"] {
            width: 70%;
            padding: 20px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            font-size: 16px; /* 글꼴 크기를 조금 더 크게 설정 */
            display: block;
            margin-left: auto;
            margin-right: auto;
            background-color: rgba(255, 255, 255, 0.1);
        }
        .container input[type="submit"] {
            width: 75%;
            padding: 20px;
            margin: 10px 5%;
            border: none;
            border-radius: 5px;
            background-color: #3F5A7A; /* 버튼 색깔 */
            color: white;
            font-size: 16px; /* 버튼 글꼴 크기를 조금 더 크게 설정 */
            cursor: pointer;
        }
        .container input[type="submit"]:hover {
            background-color: #ec971f; /* 버튼 hover 색상 */
        }

        .container input[type="button"] {
            width: 75%;
            padding: 20px;
            margin: 10px 5%;
            border: none;
            border-radius: 5px;
            background-color:  rgba(255, 255, 255, 0.1); /* 버튼 색깔 */
            color: white;
            font-size: 16px; /* 버튼 글꼴 크기를 조금 더 크게 설정 */
            cursor: pointer;
        }
        .container input[type="button"]:hover {
            background-color: #ec971f; /* 버튼 hover 색상 */
        }

        .forgot-password {
            text-align: center; /* 텍스트를 왼쪽 정렬 */
            font-size: 30px; /* 글꼴 크기를 키움 */
            font-weight: bold; /* 볼드체로 설정 */
            margin-top: -50px;
            margin-left: -420px; /* 하단 여백 설정 */
        }
        .forgot-msg {
            text-align: center; /* 텍스트를 왼쪽 정렬 */
            font-size: 15px; /* 글꼴 크기를 작게 설정 */
            margin-top: -25px; /* 위쪽 여백 설정 */
            color: #ccc;
            margin-left: -200px; //* 추가 메시지의 색상 설정 */
        }
        .verify-msg {
            text-align: center; /* 텍스트를 왼쪽 정렬 */
            font-size: 15px; /* 글꼴 크기를 작게 설정 */
            margin-top: -25px; /* 위쪽 여백 설정 */
            color: #ccc;
            margin-left: -200px; //* 추가 메시지의 색상 설정 */
        }

    </style>
</head>
<body>
<div class="container">
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
        <input type="text" name="student_id" placeholder="학번">
        <input type="submit" name="Submit" value="Send">
        <input type="button" name="button" value="Back to login" onclick="location.href='login.jsp';">
    </form>

</div>
</body>
</html>