<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>CourseX_로그인</title>
  <link rel="stylesheet" href="./resources/css/index.css" />
  <link rel="stylesheet" href="./resources/css/login.css" />
</head>
<body>
<div class="login__layout">
  <div class="login__container">
    <div class="login__logo">
      <img src="${pageContext.request.contextPath}/resources/assets/logo.svg" alt="로고">
      <div class="login__title">
        <h1>CourseX</h1>
        <p>수강신청 서비스</p>
      </div>
    </div>

    <form method="post" action="login_verify.jsp">
      <input type="text" name="userID" placeholder="Id">
      <input type="password" name="userPassword" placeholder="PassWord">
      <input type="submit" name="Submit" value="Login">
    </form>
    <div class="forget-password-button" onclick="location.href='forget_pwd.jsp';">Forget Password?</div>
  </div>
  </div>
</div>
</body>
</html>
