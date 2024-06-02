<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, conn.Conn" %>

<%
    // 파라미터 받기
    String courseId = request.getParameter("courseId");
    String studentId = "S001"; // 학생 ID는 세션에서 가져오는 것으로 가정

    // Conn 객체 생성
    Conn conn = new Conn();
    Connection myConn = null;
    CallableStatement cstmt = null;

    try {
        // 데이터베이스 연결
        myConn = conn.getConnection();

        // 저장 프로시저 호출
        String sql = "{call insertEnroll(?, ?)}";
        cstmt = myConn.prepareCall(sql);
        cstmt.setString(1, studentId);
        cstmt.setString(2, courseId);
        cstmt.execute();

        // 수강신청 성공 메시지 출력
        out.println("<script>alert('수강신청이 완료되었습니다.'); location.href='enroll.jsp';</script>");
    } catch (Exception e) {
        e.printStackTrace();
        // 수강신청 실패 메시지 출력
        out.println("<script>alert('수강신청에 실패했습니다.'); history.back();</script>");
    } finally {
        // 자원 해제
        if (cstmt != null) cstmt.close();
        if (myConn != null) myConn.close();
    }
%>