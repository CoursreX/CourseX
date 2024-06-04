<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 인증</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 900px;
            height: 600px;
            background-color: #042131;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .container input[type="text"] {
            width: 71%;
            padding: 20px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            background-color: rgba(255, 255, 255, 0.1);
        }
        .container input[type="submit"] {
            width: 45%;
            padding: 20px;
            margin: 15px 0;
            border: none;
            border-radius: 5px;
            background-color:rgba(255, 255, 255, 0.1);
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-left:110px;
        }
        .container input[type="submit"]:hover {
            background-color: #ec971f;
        }
        .container input[type="button"] {
            width: 45%;
            padding: 20px;
            margin: 15px;
            border: none;
            border-radius: 5px;
            background-color: #3F5A7A;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-right:110px;
        }
        .container input[type="button"]:hover {
            background-color: #ec971f;
        }
        .forgot-password {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            margin-top: -50px;
            margin-left: -420px;
        }
        .forgot-msg {
            text-align: left;
            font-size: 15px;
            margin-top: -25px;
            color: #ccc;
            margin-left: 120px;
        }
        .verify-msg {
            text-align: center;
            font-size: 15px;
            margin-top: -25px;
            color: #ccc;
            margin-left: -420px;
        }
    </style>
    <script>
        function showAlert() {
            alert("인증번호를 다시 입력하세요.");
        }


        function resetStudentID() {
            // reset_session.jsp로 이동하여 세션 초기화
            window.location.href = 'reset_session.jsp';
        }
    </script>
</head>
<body>

<%
    // Retrieve student ID from the request
    String studentID = request.getParameter("student_id");
    boolean studentIDError = false;

    // Store the student ID in the session if not already set
    if (session.getAttribute("studentID") == null && studentID != null) {
        session.setAttribute("studentID", studentID);
    } else {
        studentID = (String) session.getAttribute("studentID");
    }

    String userEmail = "";
    String resetToken = "";
    boolean checkpwd = false;
    boolean resend = "true".equals(request.getParameter("resend"));

    // Generate a random reset token and store in session if not already set or if resend is requested
    if (session.getAttribute("resetToken") == null || resend) {
        Random random = new Random();
        resetToken = String.format("%06d", random.nextInt(1000000));
        session.setAttribute("resetToken", resetToken);
        session.setAttribute("emailSent", false); // 이메일 전송 플래그 초기화
    } else {
        resetToken = (String) session.getAttribute("resetToken");
    }

    // JDBC를 사용하여 데이터베이스에서 사용자 이메일 가져오기
    try {
        String dbdriver = "oracle.jdbc.driver.OracleDriver";
        String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbuser = "coursex";
        String dbpasswd = "0000";

        Class.forName(dbdriver);
        Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);

        PreparedStatement pstmt = conn.prepareStatement("SELECT student_email FROM STUDENT WHERE student_id = ?");
        pstmt.setString(1, studentID);

        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            userEmail = rs.getString("student_email");
        } else {
            studentIDError = true;
            session.removeAttribute("studentID");
            session.removeAttribute("resetToken");
            session.removeAttribute("emailSent");
            response.sendRedirect("forget_pwd.jsp?error=1"); // 에러 코드를 전달하여 다시 입력 페이지로 이동
            return; // Redirect 후 더 이상 코드를 더 실행하지 않도록 리턴
        }

        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // 이메일 보내기
    if (!userEmail.isEmpty() && (session.getAttribute("emailSent") == null || !(Boolean) session.getAttribute("emailSent"))) {
        String host = "smtp.naver.com";
        String port = "465";
        String from = "0buta@naver.com"; // 본인의 네이버 이메일 주소
        String pass = "U53R6XZL7UVT"; // 네이버 앱 비밀번호

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);

        Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("Password Reset Verification");
            message.setText("Your verification code is: " + resetToken);

            Transport.send(message);
            session.setAttribute("emailSent", true); // 이메일이 전송되었음을 세션에 저장
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // Verify token
    String inputToken = request.getParameter("reset_token");
    if (inputToken != null) {
        String sessionToken = (String) session.getAttribute("resetToken");
        if (!inputToken.equals(sessionToken)) {
            checkpwd = true;
        } else {
            session.removeAttribute("resetToken");
            session.removeAttribute("emailSent");
            response.sendRedirect("reset_pwd.jsp");
            return; // Redirect 후 더 이상 코드를 더 실행하지 않도록 리턴
        }
    }
%>

<div class="container">
    <p class="forgot-password">Forgot Password</p>
    <% if (!userEmail.isEmpty()) { %>
    <h2 class="forgot-msg"><%= userEmail %>로 인증번호를 보냈습니다</h2>
    <h2 class="forgot-msg"><%= resetToken %>로 인증번호를 보냈습니다</h2>
    <% } %>

    <form method="post" action="pwd_verify.jsp">
        <input type="text" name="reset_token" placeholder="인증번호">

        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">
            <input type="button" name="button" value="인증번호 재전송" onclick="location.href='pwd_verify.jsp?resend=true';" style="margin-left:110px; margin-right: 0px;">
            <input type="submit" name="button" value="확인" style="margin-right: 20px; ">
            <input type="button" name="button" value="학번 재입력" onclick="resetStudentID();" >


        </div>
    </form>
    <% if (checkpwd) { %>
    <script>
        showAlert("인증번호를 다시 입력하세요.");
    </script>
    <% } %>
</div>

</body>
</html>