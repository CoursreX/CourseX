<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="conn.Conn" %>

<%
    Object user = session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }

    Conn conn = new Conn();

    if(!conn.checkEnrollDropPeriod()) {
%>
<div class="content__left">수강포기 기간이 아닙니다.</div>
<%
    } else {
%>
<div class="content__left">
    <div class="content__left__container">
        <table class="table">
            <thead class="table__header">
            <tr>
                <th class="table__cell">과목번호</th>
                <th class="table__cell">과목명</th>
                <th class="table__cell">분반</th>
                <th class="table__cell">학점</th>
                <th class="table__cell">교수님</th>
                <th class="table__cell">강의실</th>
                <th class="table__cell">강의시간</th>
                <th class="table__cell">정원</th>
                <th class="table__cell">포기일자</th>
                <th class="table__cell">포기신청</th>
            </tr>
            </thead>
            <tbody class="table__body">
                <%
                    ResultSet rs = null;
                    String studentId = (String) session.getAttribute("user");

                    try {
                        rs = conn.getEnrollDropInfo(studentId);
                        if(!rs.next()) {
                %>
                <tr>
                    <td class="table__cell" colspan="10">수강신청된 과목이 없습니다.</td>
                </tr>
                <%
                        } else {
                            do {
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
                        포기완료
                    <%
                                } else {
                    %>
                        <button class="default__button drop__enroll__button"
                                data-enroll-id="<%= rs.getString("ENROLL_ID")%>"
                                data-course-name="<%= rs.getString("COURSE_NAME")%>"
                                data-course-no="<%= rs.getInt("COURSE_NO")%>">
                            포기
                        </button>
                    <%
                                }
                            } while(rs.next());
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
            </tbody>
        </table>
    </div>
</div>
<%
    }
%>
<div class="content__right">
    <jsp:include page="/views/userInfo.jsp" />
</div>