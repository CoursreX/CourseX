<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="conn.Conn" %>

<%
    String courseId = request.getParameter("courseId");
    String courseNoStr = request.getParameter("courseNo");
    Integer courseNo = null;

    if (courseNoStr != null && !courseNoStr.isEmpty()) {
        courseNo = Integer.parseInt(courseNoStr);
    } else {
        // courseNo가 null이거나 빈 문자열인 경우 처리할 내용
        String errorMessage = "잘못된 요청입니다. 과목 번호가 누락되었습니다.";
        out.print(errorMessage);
    }

    Conn conn = new Conn();

    String studentId = (String) session.getAttribute("user");

    String result=conn.enrollCourse(studentId, courseId, courseNo);
    out.print(result);
%>
