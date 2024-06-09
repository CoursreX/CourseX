<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Object user = session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="./resources/css/index.css" />
    <link rel="stylesheet" href="./resources/css/restPwd.css" />
    <script>
        function validateForm() {
            var newPassword = document.forms["resetForm"]["new_password"].value;
            var confirmPassword = document.forms["resetForm"]["confirm_password"].value;
            if (newPassword != confirmPassword) {
                alert("입력한 비밀번호가 일치하지 않습니다.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="reset__layout">
    <div class="reset__container">
        <p class="forgot-password">Reset Password</p>
        <p class="forgot-msg">새로운 비밀번호를 설정하세요</p>

        <!-- 이곳에 로그인 폼 등의 내용 추가 -->
        <form name="resetForm" method="post" action="reset_pwd_post.jsp" onsubmit="return validateForm();">
            <input type="password" name="new_password" placeholder="새로운 비밀번호">
            <input type="password" name="confirm_password" placeholder="새로운 비밀번호 재확인">
            <input type="submit" name="Submit" value="Send">
            <input type="button" name="button" value="Back to login" onclick="location.href='login.jsp';">
        </form>

    </div>
</div>
</body>

</html>