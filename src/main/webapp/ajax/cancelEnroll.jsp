<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="conn.Conn" %>

<%
    String enrollIdParam = request.getParameter("enrollId");

    Conn conn = new Conn();
    ResultSet rs = null;

    conn.cancelEnroll(enrollIdParam);

    try {
        String studentId = (String) session.getAttribute("user");
        rs = conn.getCancelEnrollInfo(studentId);
        while (rs.next()) {
%>
<tr>
    <td class="table__cell"><%= rs.getString("COURSE_ID") %></td>
    <td class="table__cell"><%= rs.getString("COURSE_NAME") %></td>
    <td class="table__cell"><%= rs.getString("COURSE_NO") %></td>
    <td class="table__cell"><%= rs.getInt("COURSE_CREDIT") %></td>
    <td class="table__cell"><%= rs.getString("FACULTY_NAME") %></td>
    <td class="table__cell"><%= rs.getString("COURSE_ROOM") %></td>
    <td class="table__cell"><%= rs.getString("COURSE_TIME") %></td>
    <td class="table__cell"><%= rs.getInt("COURSE_CAP") %></td>
    <td class="table__cell"><%= rs.getString("CANCEL_DATE") %></td>
    <td class="table__cell">
        <%
            if(rs.getInt("ENROLL_STAT") == 2) {
        %>
        취소완료
        <%
            } else {
        %>
        <button class="cancel__enroll__button" data-enrollid="<%= rs.getString("ENROLL_ID")%>">취소</button>
        <%
            }
        }
        %>
    </td>
</tr>
<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
