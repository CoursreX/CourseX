<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="conn.Conn" %>

<%
    String searchType = request.getParameter("searchType");
    String searchValue = request.getParameter("searchValue");

    Conn conn = new Conn();
    ResultSet rs = null;

    try {
        // Conn 클래스의 getCourseInfo 메서드를 호출하여 course 테이블 조회
        rs = conn.getCourseInfo(searchType, searchValue);
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
    <td class="table__cell"><%= rs.getString("COURSE_CATEGORY") %></td>
    <%
        int isOpened = rs.getInt("IS_OPENED");
        String openedStatus = (isOpened == 0) ? "개설" : "미개설";
        String colorClass = (isOpened == 0) ? "opened" : "closed";
    %>
    <td class="table__cell <%= colorClass %>"><%= openedStatus %></td>
    <td class="table__cell">
        <button id="enrollButton" class="enrollButton"
                data-course-id="<%= rs.getString("COURSE_ID") %>"
                data-course-no="<%= rs.getString("COURSE_NO") %>"
                data-student-id="<%= session.getAttribute("user") %>">수강신청</button></tr>
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