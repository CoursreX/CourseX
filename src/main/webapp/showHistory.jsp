<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, conn.Conn, java.text.SimpleDateFormat" %>
<%
    Object user = session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<div class="content__left">
    <div class="show__list">
        <table class="table">
            <thead class="table__header">
             <tr>
                <th class="table__cell">증원순서</th>
                 <th class="table__cell">증원 아이디</th>
                 <th class="table__cell">과목번호</th>
                 <th class="table__cell">분반</th>
                 <th class="table__cell">과목명</th>
                 <th class="table__cell">교수명</th>
                 <th class="table__cell">증원 전 인원</th>
                 <th class="table__cell">증원 후 인원</th>
                 <th class="table__cell">수행일시</th>
             </tr>
        </thead>
        <tbody class="add_table__body">
    <%
        Conn dbConn = new Conn();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        SimpleDateFormat showDateform = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            conn = dbConn.getConnection();
            String sql = "SELECT * FROM ADD_HISTORY_VIEW ORDER BY History_ID";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String dateWithTime = showDateform.format(rs.getDate("INCREASE_DATE"));
    %>
            <tr>
                <td class="table__cell"><%= rs.getString("HISTORY_ID") %></td>
                <td class="table__cell"><%= rs.getString("EXPANDED_NO") %></td>
                <td class="table__cell"><%= rs.getString("COURSE_ID") %></td>
                <td class="table__cell"><%= rs.getString("COURSE_NO") %></td>
                <td class="table__cell"><%= rs.getString("COURSE_NAME") %></td>
                <td class="table__cell"><%= rs.getString("FACULTY_NAME") %></td>
                <td class="table__cell"><%= rs.getInt("BEFORE_CAP") %></td>
                <td class="table__cell"><%= rs.getInt("UPDATE_CAP") %></td>
                <td class="table__cell"><%= dateWithTime %></td>
            </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    %>
            </tbody>
        </table>
    </div>
</div>
<div id="content__right">
    <%@ include file="/components/adminInfo.jsp" %>
</div>