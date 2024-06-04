<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Conn" %>
<%@ page import="java.util.*" %>
<%
    try {
        // addSeats.jsp에서 사용자가 입력한 값 받아옴(라디오버튼, 검색어)
    String searchOption = request.getParameter("searchOption");
    String search = request.getParameter("search");

    // 가져온 정보의 list 형태의 저장
    List<Map<String, Object>> courseResult = new ArrayList<>();
    if (searchOption != null && search != null && !search.trim().isEmpty()) {
        Conn conn = new Conn();
        courseResult = conn.add_searchCourse(searchOption, search);
    }
    // 결과가 없을 때
    if (courseResult.isEmpty()) {
        System.out.print("");
    } else { // 사용자 검색 기반의 결과 출력
        for (Map<String, Object> course : courseResult) {
%>
    <tr>
        <td class="table__cell"><%= course.get("course_id") %></td>
        <td class="table__cell"><%= course.get("course_name") %></td>
        <td class="table__cell"><%= course.get("course_no") %></td>
        <td class="table__cell"><%= course.get("course_credit") %></td>
        <td class="table__cell"><%= course.get("faculty_name") %></td>
        <td class="table__cell"><%= course.get("course_room") %></td>
        <td class="table__cell"><%= course.get("course_time") %></td>
        <td class="table__cell"><%= course.get("course_cap") %></td>
        <td class="table__cell"><%= course.get("course_seats") %></td>
        <td class="table__cell"><button class="add__button" onclick="addSeatsConfirm('<%= course.get("course_id") %>', '<%= course.get("course_no") %>', '<%= course.get("faculty_name") %>')" >증원하기</button></td>
    </tr>
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        System.out.print("Error: " + e.getMessage());
    }

%>