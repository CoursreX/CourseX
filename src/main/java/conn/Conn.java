package conn;

import java.sql.*;

public class Conn {
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "coursex";
    String password = "0000";
    public Connection myConn = null;

    public void check_conn() {
        try {
            Class.forName(driver);
            System.out.println("COURSEX jdbc driver 로딩 성공");
            myConn = DriverManager.getConnection(url, user, password);
            System.out.println("COURSEX 오라클 연결 성공");
            myConn.createStatement();
        } catch(ClassNotFoundException e) {
            System.out.println("jdbc driver 로딩 실패");
        }catch(SQLException e) {
            System.out.println("오라클 연결 실패");
        }
    }
}
