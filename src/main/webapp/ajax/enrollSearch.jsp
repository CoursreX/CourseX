<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="conn.Conn" %>

<%
    String yearParam = request.getParameter("year");
    String semesterParam = request.getParameter("semester");
    String sql = "{call GET_ENROLL_INFO(?, ?, ?, ?)}";

    int year = Integer.parseInt(yearParam);
    int semester = Integer.parseInt(semesterParam);

    Conn conn = new Conn();
    ResultSet rs = null;

    try {
        rs = conn.getEnrollInfo(sql, year, semester);
        while (rs.next()) {
%>
<tr>
    <td class="table__cell"><%= rs.getString("COURSE_ID") %></td>
    <td class="table__cell"><%= rs.getString("COURSE_NAME") %></td>
    <td class="table__cell"><%= rs.getString("COURSE_NO") %></td>
    <td class="table__cell"><%= rs.getInt("COURSE_CREDIT") %></td>
    <td class="table__cell"><%= rs.getString("FACULTY_NAME") %></td>
    <td class="table__cell"><%= rs.getString("COURSE_ROOM") %></td>
    <td class="table__cell"><%= rs.getString("COURSE_DAY") %> <%= rs.getString("COURSE_TIME") %></td>
    <td class="table__cell"><%= rs.getInt("COURSE_CAP") %></td>
    <td class="table__cell"><%= rs.getString("ENROLL_STAT") %></td>
</tr>
<%
        }
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
