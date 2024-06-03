<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="conn.Conn" %>

<%
    String studentId = (String) session.getAttribute("user");
    String enrollIdParam = request.getParameter("enrollId");

    Conn conn = new Conn();
    ResultSet rs = null;

    try {
        int updatedCreditLimit = conn.cancelEnroll(studentId, enrollIdParam);
        System.out.println(updatedCreditLimit);
        if(updatedCreditLimit > -1) {
            session.setAttribute("creditLimit", updatedCreditLimit);
        }
        rs = conn.getEnrollInfoSuccess(studentId);

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
    <td class="table__cell">
        <button class="default__button cancel__enroll__button"
                data-enrollid="<%= rs.getString("ENROLL_ID")%>"
                data-course-name="<%= rs.getString("COURSE_NAME")%>"
                data-course-no="<%= rs.getInt("COURSE_NO")%>">
            취소
        </button>
    </td>
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
