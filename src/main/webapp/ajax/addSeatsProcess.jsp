<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.io.*, java.util.*, conn.Conn" %>
<%
    request.setCharacterEncoding("UTF-8"); // 한글 오류 해결
    // 증원하기 버튼을 눌렀을 때 프론트에서 보낸 정보(과목번호, 분반, 증원인원) 받기
    String courseId = request.getParameter("courseId");
    String courseNo = request.getParameter("course_no");
    String increaseAmount = request.getParameter("increaseAmount");

    Conn dbConn = new Conn();
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try { // DB와 통신을 해서 course_cap에 사용자가 입력한 증원 인원 더하기
        conn = dbConn.getConnection();
        conn.setAutoCommit(false); // 자동 커밋 비활성화


        String increaseCapSql = "SELECT COURSE_CAP FROM COURSE WHERE COURSE_ID = ? AND COURSE_NO = ?";
        pstmt = conn.prepareStatement(increaseCapSql);
        pstmt.setString(1, courseId);
        pstmt.setString(2, courseNo);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            int exCourseCap = rs.getInt("COURSE_CAP");
            int newCourseCap = exCourseCap + Integer.parseInt(increaseAmount);

            rs.close();
            pstmt.close();

            String updateCapSql = "UPDATE COURSE SET COURSE_CAP = ? WHERE COURSE_ID = ? AND COURSE_NO = ?";
            pstmt = conn.prepareStatement(updateCapSql);
            pstmt.setInt(1, newCourseCap);
            pstmt.setString(2, courseId);
            pstmt.setString(3, courseNo);
            pstmt.executeUpdate();

            conn.commit(); // 트랜잭션 커밋
        } else {
            conn.rollback(); // 롤백
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

%>

