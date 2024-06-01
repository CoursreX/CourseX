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
}
