<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="conn.Conn" %>
<%@ page import="oracle.jdbc.OracleTypes" %>

<%
    String studentId = (String) session.getAttribute("user");
    String studentName = (String) session.getAttribute("userName");
    String yearParam = request.getParameter("year");
    String semesterParam = request.getParameter("semester");

    int year = Integer.parseInt(yearParam);
    int semester = Integer.parseInt(semesterParam);

    Conn conn = new Conn();
    Connection dbConnection = null;
    ResultSet rs = null;
    CallableStatement cstmt = null;
    boolean hasResults = false;

    try {
        dbConnection = conn.getConnection();
        // PL/SQL 블록 실행
        String sql = "{call sumCredit(?, ?, ?, ?, ?)}";
        cstmt = dbConnection.prepareCall(sql);
        cstmt.setString(1, studentId);
        cstmt.setInt(2, year);
        cstmt.setInt(3, semester);
        cstmt.registerOutParameter(4, Types.INTEGER); // 결과값 - 총합
        cstmt.registerOutParameter(5, Types.INTEGER); // 결과값 - 조회 결과 여부

        cstmt.execute(); // 실행

        cstmt.execute(); // 실행
        int totalCredits = cstmt.getInt(4);
        int hasResultVal = cstmt.getInt(5);

        hasResults = (hasResultVal == 1); // 1이면 true, 0이면 false

        System.out.println("Total Credits: " + totalCredits); // 터미널 출력
        System.out.println("Has Result: " + hasResults);

        rs = conn.getEnrollInfoAll(studentId, year, semester);
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
    <%
        String enrollStat = rs.getString("ENROLL_STAT"); // ENROLL_STAT 값 가져오기
        String colorClass = ""; // 초기 클래스 값

        // ENROLL_STAT 값에 따라 클래스 선택
        if (enrollStat.equals("신청완료")) {
            colorClass = "enroll__success";
        }
    %>
    <td class="table__cell <%= colorClass %>"><%= rs.getString("ENROLL_STAT") %></td>
</tr>
<script> // getEnrollInfo.js에 신청완료 상태의 총 합, 조회 결과 여부 보내기
var totalCredits = <%= totalCredits %>;
var hasResults = <%= hasResults %>;
var studentName = '<%= studentName %>';
</script>
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