package conn;

import java.sql.*;
import java.util.*;

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
            System.out.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
            e.printStackTrace();
        }
        return rs;
    }

    public void cancelEnroll(String enrollId) {
        String sql = "DELETE FROM ENROLL WHERE ENROLL_ID = ?";

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            PreparedStatement pstmt = myConn.prepareStatement(sql);

            pstmt.setString(1, enrollId);
            pstmt.executeQuery();
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
            e.printStackTrace();
        }
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
            System.out.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
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
            System.out.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
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
            System.out.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
            e.printStackTrace();
        }
        return rs;
    }

    //createCourse_post.jsp
    private Connection conn;
    public Conn() {
        try {
            // JDBC 드라이버 로드
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(driver);
        return DriverManager.getConnection(url, user, password);
    }

    public void close() throws SQLException {
        if (conn != null) {
            conn.close();
        }
    }

    //addSeats.jsp 검색 기능
    public List<Map<String, Object>> add_searchCourse(String searchOption, String search) {
        List<Map<String, Object>> courseResult = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection(); // conn 초기화
            String sql = "";
            System.out.println("db연결 완료.");


            if ("id".equals(searchOption)) { //searchById
                sql = "SELECT c.*, (c.COURSE_CAP - c.COURSE_ENROLLED) AS course_seats, f.FACULTY_NAME " +
                        "FROM COURSE c JOIN FACULTY f ON c.FACULTY_ID = f.FACULTY_ID " +
                        "WHERE c.COURSE_ID = ?";
            } else if ("name".equals(searchOption)) { //searchByName
                sql = "SELECT c.*, (c.COURSE_CAP - c.COURSE_ENROLLED) AS course_seats, f.FACULTY_NAME " +
                        "FROM COURSE c JOIN FACULTY f ON c.FACULTY_ID = f.FACULTY_ID " +
                        "WHERE c.COURSE_NAME LIKE ?"; // LIKE으로 해야 "검색어"랑 똑같지 않아도 포함되면 출력됨
            }
            pstmt = conn.prepareStatement(sql);

            if ("id".equals(searchOption)) { // searchById
                pstmt.setString(1, search);
            } else if ("name".equals(searchOption)) { // searchByName
                pstmt.setString(1, "%" + search + "%"); //그 글자 들은거 다 찾기
            }

            rs = pstmt.executeQuery();

            while (rs.next()) { // DB에서 검색어에 맞는 정보 묶기
                Map<String, Object> courseSearch = new HashMap<>();
                courseSearch.put("course_id", rs.getString("course_id"));
                courseSearch.put("course_name", rs.getString("course_name"));
                courseSearch.put("course_no", rs.getInt("course_no"));
                courseSearch.put("course_credit", rs.getInt("course_credit"));
                courseSearch.put("faculty_name", rs.getString("faculty_name"));
                courseSearch.put("course_room", rs.getString("course_room"));
                courseSearch.put("course_time", rs.getString("course_time"));
                courseSearch.put("course_cap", rs.getInt("course_cap"));
                courseSearch.put("course_enrolled", rs.getInt("course_enrolled"));
                courseSearch.put("course_seats", rs.getInt("course_seats"));
                courseResult.add(courseSearch);
            }
        } catch(Exception e){
                e.printStackTrace();
        } finally{
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return courseResult;
    }
}
