<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.io.*, java.util.*, conn.Conn" %>
<%
    request.setCharacterEncoding("UTF-8"); // 한글 오류 해결
   if ("POST".equalsIgnoreCase(request.getMethod())) {
        String courseId = request.getParameter("course_id").toUpperCase();
        String courseNo = request.getParameter("course_no");
        String facultyName = request.getParameter("faculty_name");
        String facultyId = request.getParameter("faculty_id").toUpperCase();
        String courseName = request.getParameter("course_name");
        String courseCategory = request.getParameter("category");
        String selectedDays = request.getParameter("selectedDays");
        String courseCredit = request.getParameter("course_credit");
        String courseCap = request.getParameter("course_cap");
        String building = request.getParameter("building");
        String courseRoom = request.getParameter("course_room");
        String startHour = request.getParameter("startHour");
        String startMin = request.getParameter("startMin");
        String endHour = request.getParameter("endHour");
        String endMin = request.getParameter("endMin");

        // 강의실 정보와 강의 시간 결합
        String courseLocation = building + courseRoom;
        String startTime = String.format("%02d", Integer.parseInt(startHour)) + ":" + String.format("%02d", Integer.parseInt(startMin));
        String endTime = String.format("%02d", Integer.parseInt(endHour)) + ":" + String.format("%02d", Integer.parseInt(endMin));
        String courseTime = startTime + "-" + endTime;

        Conn dbConn = new Conn();
        Connection conn = null;
        PreparedStatement pstmt = null;
        CallableStatement cstmt = null;
        ResultSet rs = null;
        //출력할 에러 메시지
        List<String> errorMessages = new ArrayList<>();
        String expandedId = null;

    try {
        conn = dbConn.getConnection();

        // 분반 - 새로 등록하는 과목번호의 분반은 1부터 시작하도록 제한
        String checkCourseNoSql = "SELECT COUNT(*) FROM COURSE WHERE COURSE_ID = ?";
        pstmt = conn.prepareStatement(checkCourseNoSql);
        pstmt.setString(1, courseId);
        rs = pstmt.executeQuery();
        if (rs.next() && rs.getInt(1) == 0 ) {
            if (Integer.parseInt(courseNo) != 1)
                errorMessages.add("처음 등록하는 과목의 분반은 1번부터 시작해야합니다.");
        }
        rs.close();
        pstmt.close();

        // 과목명 - 동일한 과목명이 있는 과목번호 확인
        String checkCourseNameSql = "SELECT COURSE_ID FROM COURSE WHERE COURSE_NAME = ?";
        pstmt = conn.prepareStatement(checkCourseNameSql);
        pstmt.setString(1, courseName);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String exCourseId = rs.getString("COURSE_ID");
            if (!exCourseId.equals(courseId)) {
                errorMessages.add("동일한 과목명을 가진 과목번호가 이미 존재합니다.");
            }
        }
        rs.close();
        pstmt.close();

        // 동일한 과목명 확인이 선행조건
        if (errorMessages.isEmpty()) {
            // 과목번호 - 동일한 과목번호에 대해 분반, 과목명, 유형, 학점 확인
            String checkCourseIdSql = "SELECT course_no, course_name, course_category, course_credit FROM COURSE WHERE course_id = ?";
            pstmt = conn.prepareStatement(checkCourseIdSql);
            pstmt.setString(1, courseId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int exCourseNo = rs.getInt("course_no");
                String exCourseName = rs.getString("course_name");
                String exCourseCategory = rs.getString("course_category");
                int exCourseCredit = rs.getInt("course_credit");

                if (exCourseNo == Integer.parseInt(courseNo)) {
                    errorMessages.add("같은 과목에 대한 동일한 분반이 존재합니다.");
                }
                if (!exCourseName.equals(courseName)) {
                    errorMessages.add("같은 과목에 대한 과목명이 일치하지 않습니다.");
                }
                if (!exCourseCategory.equals(courseCategory)) {
                    errorMessages.add("같은 과목에 대한 강의 유형이 일치하지 않습니다.");
                }
                if (exCourseCredit != Integer.parseInt(courseCredit)) {
                    errorMessages.add("같은 과목에 대한 학점이 일치하지 않습니다.");
                }
            }
            rs.close();
            pstmt.close();
        }


        // 교번 - 교번 존재 및 일치 확인
        String checkFacultySql = "SELECT FACULTY_NAME FROM FACULTY WHERE FACULTY_ID = ?";
        pstmt = conn.prepareStatement(checkFacultySql);
        pstmt.setString(1, facultyId);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String exFacultyName = rs.getString("FACULTY_NAME");
            if (!exFacultyName.equals(facultyName)) {
                errorMessages.add("교번과 교수명이 일치하지 않습니다.");
            }
        } else {
            errorMessages.add("존재하지 않는 교번입니다.");
        }
        rs.close();
        pstmt.close();

        // 시간 확인 - 시작시간이 종료시간보다 빨라야 함
        // 저장 function 호출
        String checkTimeSql = "{ ? = call CHECK_TIME(?, ?)}";
        cstmt = conn.prepareCall(checkTimeSql);
        cstmt.registerOutParameter(1, Types.NUMERIC);
        cstmt.setString(2, startTime);
        cstmt.setString(3, endTime);
        cstmt.execute();

        int isVaild = cstmt.getInt(1);
        if (isVaild == 0) {
            errorMessages.add("강의 시간 설정을 확인해주세요.");
        }
        rs.close();
        pstmt.close();


        // 에러 메시지가 존재하면 한줄씩 출력하기
        if (!errorMessages.isEmpty()) {
            StringBuilder errorMessageBuilder = new StringBuilder();
            for (int i = 0; i < errorMessages.size(); i++) {
                errorMessageBuilder.append(i + 1).append(". ").append(errorMessages.get(i)).append("\\n");
            }
            String errorMessagesFull = errorMessageBuilder.toString();

%>

<script>
    alert('입력한 정보를 확인해주세요!:\n <%= errorMessagesFull %>');
    history.back();
</script>

<%
} else {

    // IS_EXPANDED 고유 값 생성
    String expandedIdSql = "SELECT 'CA' || TO_CHAR(my_sequence.NEXTVAL, 'FM000') AS expandedId FROM dual";
    pstmt = conn.prepareStatement(expandedIdSql);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        expandedId = rs.getString("expandedId");
    }
    rs.close();
    pstmt.close();

    // 최종 COURSE 테이블에 정보 저장하기
    String sql = "INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, courseId);
    pstmt.setInt(2, Integer.parseInt(courseNo));
    pstmt.setString(3, facultyId);
    pstmt.setString(4, courseName);
    pstmt.setInt(5, Integer.parseInt(courseCredit));
    pstmt.setInt(6, Integer.parseInt(courseCap));
    pstmt.setString(7, selectedDays);
    pstmt.setString(8, courseTime);
    pstmt.setString(9, courseLocation);
    pstmt.setString(10, courseCategory);
    pstmt.setInt(11, 0);
    pstmt.setString(12, expandedId);
    pstmt.setInt(13, 0);

    // 쿼리 실행
    int rows = pstmt.executeUpdate();

    if (rows > 0) {
%>
<script>
    alert('강의가 성공적으로 등록되었습니다.');
    window.location.href = 'admin_index.jsp';
</script>
<%
} else {
%>
<script>
    alert('강의 등록에 실패하였습니다.');
    history.back();
</script>
<%
        }
    }
} catch (Exception e) {
    e.printStackTrace();
%>
<script>
    alert('오류가 발생하였습니다: <%= e.getMessage() %>');
    history.back();
</script>
<%
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>
