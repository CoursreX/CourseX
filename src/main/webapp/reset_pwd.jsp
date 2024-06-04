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
        .container input[type="student_id"],
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
            text-align: left; /* 텍스트를 왼쪽 정렬 */
            font-size: 15px; /* 글꼴 크기를 작게 설정 */
            margin-top: -25px; /* 위쪽 여백 설정 */
            color: #ccc;
            margin-left: 100px; //* 추가 메시지의 색상 설정 */
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
    <p class="forgot-password">Reset Password</p>
    <p class="forgot-msg">새로운 비밀번호를 설정하세요</p>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.naming.*" %>
    <%@ page import="javax.sql.*" %>
    <%
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");
        String studentID = (String) session.getAttribute("studentID");
        String message = null;

        if (newPassword != null && confirmPassword != null && newPassword.equals(confirmPassword)) {
            try {
                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Connect to the database
                String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
                String username = "coursex";
                String password = "0000";
                Connection conn = DriverManager.getConnection(dbURL, username, password);

                // Define the SQL query to update the password
                String sql = "UPDATE STUDENT SET student_pw = ? WHERE student_id = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newPassword);
                pstmt.setString(2, studentID);

                // Execute the query
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    message = "비밀번호가 성공적으로 변경되었습니다.";
                    response.sendRedirect("login.jsp");
                } else {
                    message = "비밀번호 변경에 실패했습니다.";
                }

                // Close the connection and statement
                pstmt.close();
                conn.close();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                message = "비밀번호 변경에 실패했습니다.";
            }
        } else {
            message = "입력한 비밀번호가 일치하지 않습니다.";
        }
    %>

    <!-- 이곳에 로그인 폼 등의 내용 추가 -->
    <form method="post" action="reset_pwd.jsp">
        <input type="password" name="new_password" placeholder="새로운 비밀번호">
        <input type="password" name="confirm_password" placeholder="새로운 비밀번호 재확인">
        <input type="submit" name="Submit" value="Send">
        <input type="button" name="button" value="Back to login" onclick="location.href='login.jsp';">
    </form>

</div>
</body>

</html>