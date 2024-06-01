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
        String adminSQL = "SELECT admin_id FROM Admin WHERE admin_id = ? AND admin_pw = ?";
        pstmt = myConn.prepareStatement(adminSQL);
        pstmt.setString(1, userID);
        pstmt.setString(2, userPassword);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // 관리자인 경우
            session.setAttribute("user", userID);
            System.out.println("로그인 성공: 관리자 세션 저장됨. 관리자 ID: " + userID);
            response.sendRedirect("admin_index.jsp");
        } else {
            // 학생인지 확인
            String studentSQL = "SELECT student_id FROM STUDENT WHERE student_id = ? AND student_pw = ?";
            pstmt = myConn.prepareStatement(studentSQL);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPassword);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 학생인 경우
                session.setAttribute("user", userID);
                System.out.println("로그인 성공: 학생 세션 저장됨. 학생 ID: " + userID);
                response.sendRedirect("index.jsp");
            } else {
                // 잘못된 사용자 ID 또는 비밀번호
                System.out.println("로그인 실패: 잘못된 사용자 ID 또는 비밀번호.");
                response.sendRedirect("login.jsp");
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
