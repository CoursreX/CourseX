<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8"); // 한글 오류 해결
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");
        String userID = (String) session.getAttribute("user");

        if (newPassword != null && confirmPassword != null && newPassword.equals(confirmPassword)) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Connect to the database
                String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
                String username = "coursex";
                String password = "0000";
                conn = DriverManager.getConnection(dbURL, username, password);

                // 관리자도 비밀번호 변경 가능
                String sql;
                if (userID.startsWith("AD")) {
                    sql = "UPDATE ADMIN SET admin_pw = ? WHERE admin_id = ?";
                } else {
                    sql = "UPDATE STUDENT SET student_pw = ? WHERE student_id = ?";
                }
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, newPassword);
                pstmt.setString(2, userID);

                // Execute the query
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    session.removeAttribute("user"); // 세션에서 user 속성 삭제
%>
<script>
    alert('비밀번호가 성공적으로 변경되었습니다.');
    window.location.href = 'login.jsp';
</script>
<%
} else {
%>
<script>
    alert('비밀번호 변경에 실패했습니다. 사용자 등록이 안 되어있습니다.');
    history.back();
</script>
<%
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        String errorMessage = e.getMessage();
%>
<script>
    alert('비밀번호 변경에 실패했습니다. 오류: <%= errorMessage %>');
    history.back();
</script>
<%
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
} else {
%>
<script>
    alert('입력한 비밀번호가 일치하지 않습니다.');
    history.back();
</script>
<%
        }
    }
%>
