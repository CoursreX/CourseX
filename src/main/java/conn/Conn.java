package conn;

import java.sql.*;
import java.util.*;
import java.util.Date;

public class Conn {
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "coursex";
    String password = "0000";

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

    //수강신청 가능 과목 정보 조회 메소드
    public ResultSet getCourseInfo(String searchType, String searchValue) {
        ResultSet rs = null;
        String sql = "{call GET_COURSE_INFO(?, ?, ?)}";

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            CallableStatement cstmt = myConn.prepareCall(sql);

            cstmt.setString(1, searchType);
            cstmt.setString(2, searchValue);
            cstmt.registerOutParameter(3, Types.REF_CURSOR);

            cstmt.execute();

            rs = (ResultSet) cstmt.getObject(3);
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
            e.printStackTrace();
        }
        return rs;
    }

    public String enrollCourse(String studentId, String courseId, Integer courseNo) {
        String sql = "{call InsertEnroll(?, ?, ?)}";
        String result = "";

        try {
            Class.forName(driver);
            try (Connection myConn = DriverManager.getConnection(url, user, password);
                 CallableStatement cstmt = myConn.prepareCall(sql)) {
                cstmt.setString(1, studentId);
                cstmt.setString(2, courseId);
                cstmt.setInt(3, courseNo);

                cstmt.execute();
                result = "수강신청이 완료되었습니다.";
            }
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            int errorCode = e.getErrorCode();
            switch (errorCode) {
                case 20001:
                    result = "최대학점을 초과하였습니다.";
                    break;
                case 20002:
                    result = "이미 등록된 과목을 신청하였습니다.";
                    break;
                case 20003:
                    result = "수강신청 인원이 초과되어 등록이 불가능합니다.";
                    break;
                case 20004:
                    result = "이미 등록된 과목 중 중복되는 시간이 존재합니다.";
                    break;
                default:
                    result = "예상치 못한 오류가 발생했습니다.";
                    break;
            }
            System.err.println("SQLState: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            e.printStackTrace();
        }
        return result;
    }


    public ResultSet searchEnroll(String studentId, int year, int semester) {

        Connection conn;
        CallableStatement cstmt = null;
        ResultSet rs = null;
        String sql = "{call SEARCH_ENROLL(?, ?, ?, ?)}";

        try {
            conn = getConnection();
            cstmt = conn.prepareCall(sql);

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

    public void cancelEnroll(String studentId, String enrollId) {
        String sql = "{call CANCEL_ENROLL(?, ?)}";

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            CallableStatement cstmt = myConn.prepareCall(sql);

            cstmt.setString(1, studentId);
            cstmt.setString(2, enrollId);
            cstmt.execute();
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("cancelEnroll - 수강취소 실패");
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
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("getEnrollInfoSuccess - 수강신청 성공 정보 가져오기 실패");
            e.printStackTrace();
        }
        return rs;
    }

    public void dropEnroll(String studentId, String enrollId) {
        Connection conn = null;
        CallableStatement cstmt = null;
        String sql = "{CALL DROP_ENROLL(?, ?)}";

        try {
            conn = getConnection();
            cstmt = conn.prepareCall(sql);

            cstmt.setString(1, studentId);
            cstmt.setString(2, enrollId);
            cstmt.executeUpdate();
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("dropEnroll - 수강포기 실패");
            e.printStackTrace();
        }
    }

    public ResultSet getEnrollInfoAll(String studentId) {
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
                "NVL(TO_CHAR(E.ENROLL_DROP_DATE, 'YYYY.MM.DD'), '없음') AS DROP_DATE " +
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
                "END";
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

    public boolean checkEnrollDropPeriod() {
        String sql = "{? = call CHECK_ENROLL_DROP_PERIOD()}";
        boolean isPeriod = false;

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            CallableStatement cstmt = myConn.prepareCall(sql);

            cstmt.registerOutParameter(1, Types.NUMERIC);
            cstmt.execute();
            int result = cstmt.getInt(1);

            if (result == 1) {
                isPeriod = true;
            } else {
                isPeriod = false;
            }

        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("checkEnrollDropPeriod - 수강포기 기간 검사 오류");
            e.printStackTrace();
        }

        return isPeriod;
    }

    public boolean checkEnrollPeriod() {
        String sql = "{? = call CHECK_ENROLL_PERIOD()}";
        boolean isPeriod = false;

        try {
            Class.forName(driver);
            Connection myConn = DriverManager.getConnection(url, user, password);
            CallableStatement cstmt = myConn.prepareCall(sql);

            cstmt.registerOutParameter(1, Types.NUMERIC);
            cstmt.execute();
            int result = cstmt.getInt(1);

            if (result == 1) {
                isPeriod = true;
            } else {
                isPeriod = false;
            }

        } catch (ClassNotFoundException e) {
            System.err.println("JDBC 드라이버 로딩 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("checkEnrollPeriod - 수강신청 기간 검사 오류");
            e.printStackTrace();
        }

        return isPeriod;
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

    public int getCreditLimit(String userId){
        int limitCredit=0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection(); // conn 초기화
            String sql = "select credit_limit from student where student_id=?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();
            if(rs.next()){
                limitCredit = rs.getInt("credit_limit");
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
        return limitCredit;
    }

    public String getMajor(String majorId) {
        String majorName="";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection(); // conn 초기화
            String sql = "select major_name from major where major_id=?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, majorId);

            rs = pstmt.executeQuery();
            if(rs.next()){
                majorName = rs.getString("major_name");
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
        return majorName;
    }
}
