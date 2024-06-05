<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");

    String dbdriver = "oracle.jdbc.driver.OracleDriver";
    String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbuser = "coursex";
    String dbpasswd = "0000";

    Connection myConn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName(dbdriver);
        myConn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
        System.out.println("DB연결 완료!");

        // 관리자인지 확인
        String adminSQL = "SELECT admin_id, admin_name, admin_dept FROM Admin WHERE admin_id = ? AND admin_pw = ?";
        pstmt = myConn.prepareStatement(adminSQL);
        pstmt.setString(1, userID);
        pstmt.setString(2, userPassword);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 관리자인 경우
            String adminName = rs.getString("admin_name");
            String adminDept = rs.getString("admin_dept");

            session.setAttribute("user", userID);
            session.setAttribute("adminName", adminName);
            session.setAttribute("adminDept", adminDept);
%>
<script>
            alert('로그인 성공: 관리자 세션 저장됨. 관리자 ID: <%=userID%>');
            window.location.href = ("admin_index.jsp");
</script>
<%
        } else {
            // 학생인지 확인
            String studentSQL = "SELECT student_id, STUDENT_NAME, MAJOR_ID, STUDENT_SEM, CREDIT_LIMIT  FROM STUDENT WHERE student_id = ? AND student_pw = ?";
            pstmt = myConn.prepareStatement(studentSQL);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPassword);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String studentName = rs.getString("STUDENT_NAME");
                String studentMajor = rs.getString("MAJOR_ID");
                int studentSem = rs.getInt("STUDENT_SEM");
                int creditLimit = rs.getInt("CREDIT_LIMIT");

                session.setAttribute("userName", studentName);
                session.setAttribute("major", studentMajor);
                session.setAttribute("semester", studentSem);
                session.setAttribute("creditLimit", creditLimit);
                session.setAttribute("user", userID);
%>

<script>
    alert('로그인 성공: 학생 세션 저장됨. 학생 ID: <%=userID%>');
    window.location.href = ("index.jsp");
</script>
<%
            } else {
                // 잘못된 사용자 ID 또는 비밀번호
%>
<script>
    alert('로그인 실패: 잘못된 사용자 ID 또는 비밀번호.');
    window.location.href = ("login.jsp");
</script>
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (myConn != null) myConn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
