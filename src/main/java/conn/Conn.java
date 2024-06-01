package conn;

import java.sql.*;

public class Conn {
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "coursex";
    String password = "0000";

    public ResultSet getEnrollInfo(int year, int semester) {
        ResultSet rs = null; // ResultSet을 초기화합니다.
        String student_id = "S001";
        String sql = "{call GET_ENROLL_INFO(?, ?, ?, ?)}";

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            CallableStatement cstmt = myConn.prepareCall(sql);

            cstmt.setString(1, student_id);
            cstmt.setInt(2, year == 0 ? 2024 : year);
            cstmt.setInt(3, semester == 0 ? 1 : semester);
            cstmt.registerOutParameter(4, Types.REF_CURSOR);

            cstmt.execute();

            rs = (ResultSet) cstmt.getObject(4);
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
            e.printStackTrace();
        }
        return rs; // 항상 ResultSet을 반환합니다.
    }

    public void cancelEnroll(String enroll_id) {
        String sql = "UPDATE ENROLL " +
                "SET ENROLL_CANCEL = SYSDATE, " +
                "ENROLL_STAT = 2" +
                "WHERE ENROLL_ID = ?";

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            PreparedStatement pstmt = myConn.prepareStatement(sql);

            pstmt.setString(1, enroll_id);
            pstmt.executeUpdate();
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
            e.printStackTrace();
        }
    }

    public ResultSet getCancelEnrollInfo() {
        ResultSet rs = null;
        String student_id = "S001";
        String sql = "SELECT " +
                "E.ENROLL_ID AS ENROLL_ID, " +
                "E.ENROLL_STAT AS ENROLL_STAT, " +
                "C.COURSE_ID AS COURSE_ID, " +
                "C.COURSE_NAME AS COURSE_NAME, " +
                "C.COURSE_NO AS COURSE_NO, " +
                "C.COURSE_CREDIT AS COURSE_CREDIT, " +
                "F.FACULTY_NAME AS FACULTY_NAME, " +
                "C.COURSE_ROOM AS COURSE_ROOM, " +
                "C.COURSE_DAY || ' ' || C.COURSE_TIME AS COURSE_TIME, " +
                "C.COURSE_CAP AS COURSE_CAP, " +
                "CASE " +
                "WHEN E.ENROLL_CANCEL IS NULL THEN '없음' " +
                "ELSE TO_CHAR(E.ENROLL_CANCEL, 'YYYY.MM.DD') " +
                "END AS CANCEL_DATE " +
                "FROM " +
                "ENROLL E " +
                "JOIN " +
                "COURSE C ON E.COURSE_ID = C.COURSE_ID AND E.COURSE_NO = C.COURSE_NO " +
                "JOIN " +
                "FACULTY F ON C.FACULTY_ID = F.FACULTY_ID " +
                "WHERE E.STUDENT_ID = ? " +
                "AND E.ENROLL_YEAR = EXTRACT(YEAR FROM SYSDATE) " +
                "AND E.ENROLL_SEM = CASE " +
                "WHEN TO_NUMBER(TO_CHAR(SYSDATE, 'MM')) BETWEEN 2 AND 7 THEN 1 " +
                "ELSE 2 " +
                "END " +
                "AND E.ENROLL_STAT IN (1, 2)";
        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            PreparedStatement pstmt = myConn.prepareStatement(sql);

            pstmt.setString(1, student_id);
            rs = pstmt.executeQuery();
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
            e.printStackTrace();
        }
        return rs;
    }
}
