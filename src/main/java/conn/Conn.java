package conn;

import java.sql.*;

public class Conn {
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "coursex";
    String password = "0000";

    public ResultSet getEnrollInfoAll(String studentId, int year, int semester) {
        ResultSet rs = null;
        String sql = "{call GET_ENROLL_INFO(?, ?, ?, ?)}";

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            CallableStatement cstmt = myConn.prepareCall(sql);

            cstmt.setString(1, studentId);
            cstmt.setInt(2, year == 0 ? 2024 : year);
            cstmt.setInt(3, semester == 0 ? 1 : semester);
            cstmt.registerOutParameter(4, Types.REF_CURSOR);

            cstmt.execute();

            rs = (ResultSet) cstmt.getObject(4);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("getEnrollInfoAll - 수강정보 가져오기 실패");
            e.printStackTrace();
        }
        return rs;
    }

    public int cancelEnroll(String studentId, String enrollId) {
        int updatedCreditLimit = -1;
        String sql = "{? = call CANCEL_ENROLL(?, ?)}";

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            CallableStatement cstmt = myConn.prepareCall(sql);

            cstmt.registerOutParameter(1, Types.NUMERIC);
            cstmt.setString(2, studentId);
            cstmt.setString(3, enrollId);

            cstmt.execute();
            updatedCreditLimit = cstmt.getInt(1);
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("cancelEnroll - 수강취소 실패");
            e.printStackTrace();
        }
        return updatedCreditLimit;
    }

    public ResultSet getEnrollInfoSuccess(String studentId) {
        ResultSet rs = null;
        String sql = "SELECT " +
                "E.ENROLL_ID AS ENROLL_ID, " +
                "C.COURSE_ID AS COURSE_ID, " +
                "C.COURSE_NAME AS COURSE_NAME, " +
                "C.COURSE_NO AS COURSE_NO, " +
                "C.COURSE_CREDIT AS COURSE_CREDIT, " +
                "F.FACULTY_NAME AS FACULTY_NAME, " +
                "C.COURSE_ROOM AS COURSE_ROOM, " +
                "C.COURSE_DAY || ' ' || C.COURSE_TIME AS COURSE_TIME, " +
                "C.COURSE_CAP AS COURSE_CAP " +
                "FROM " +
                "ENROLL E " +
                "INNER JOIN " +
                "COURSE C ON E.COURSE_ID = C.COURSE_ID AND E.COURSE_NO = C.COURSE_NO " +
                "INNER JOIN " +
                "FACULTY F ON C.FACULTY_ID = F.FACULTY_ID " +
                "WHERE " +
                "E.STUDENT_ID = ? " +
                "AND E.ENROLL_YEAR = EXTRACT(YEAR FROM SYSDATE) " +
                "AND E.ENROLL_SEM = CASE " +
                "WHEN EXTRACT(MONTH FROM SYSDATE) BETWEEN 2 AND 7 THEN 1 " +
                "ELSE 2 " +
                "END " +
                "AND E.ENROLL_STAT = 1";

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            PreparedStatement pstmt = myConn.prepareStatement(sql);

            pstmt.setString(1, studentId);
            rs = pstmt.executeQuery();
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("getEnrollInfoSuccess - 수강신청 성공 정보 가져오기 실패");
            e.printStackTrace();
        }
        return rs;
    }

    public void dropEnroll(String enrollId) {
        String sql = "UPDATE ENROLL " +
                "SET ENROLL_CANCEL = SYSDATE, " +
                "ENROLL_STAT = 2" +
                "WHERE ENROLL_ID = ?";

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            PreparedStatement pstmt = myConn.prepareStatement(sql);

            pstmt.setString(1, enrollId);
            pstmt.executeUpdate();
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("dropEnroll - 수강포기 실패");
            e.printStackTrace();
        }
    }

    public ResultSet getEnrollDropInfo(String studentId) {
        ResultSet rs = null;
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

            pstmt.setString(1, studentId);
            rs = pstmt.executeQuery();
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("getEnrollDropInfo - 수강포기 정보 가져오기 실패");
            e.printStackTrace();
        }
        return rs;
    }
}
