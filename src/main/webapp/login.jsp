<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>수강신청 시스템 로그인</title>
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
      width: 40%;
      padding: 20px;
      margin: 10px 0;
      border: none;
      border-radius: 5px;
      font-size: 16px; /* 글꼴 크기를 조금 더 크게 설정 */
      display: block;
      margin-left: auto;
      margin-right: auto;
    }
    .container input[type="submit"] {
      width: 30%;
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
    .course-text {
      font-size: 55px; /* CourseX 폰트 크기를 키움 */
      font-family: "Arial, sans-serif"; /* 글꼴 변경 */
      margin-top: -10px; /* CourseX를 로고와 맞추기 위해 위로 조정 */
    }
  </style>
</head>
<body>
<div class="container">
  <div class="logo">
    <img src="./resources/assets/logo.svg" alt="로고" style="width: 80px; height: auto;margin-bottom: -30px;">
    <span class="course-text">CourseX</span>
  </div>

  <section style="margin-bottom: 40px;">
    수강신청 서비스
  </section>
  <form method="post" action="login_verify.jsp">
    <input type="text" name="userID" placeholder="Id">
    <input type="password" name="userPassword" placeholder="PassWord">
    <input type="submit" name="Submit" value="Login">
  </form>
</div>
</body>
</html>
