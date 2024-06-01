<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="conn.Conn" %>

<div class="content__left">
    <form id="searchForm" class="search__filter">
        <div class="search__filter__element">
            <label for="year">학년도</label>
            <select id="year" name="year">
                <option value="none" disabled>학년도</option>
                <option value="2024">2024</option>
                <option value="2023">2023</option>
                <option value="2022">2022</option>
                <option value="2021">2021</option>
                <option value="2020">2020</option>
                <option value="2019">2019</option>
            </select>
        </div>
        <div class="search__filter__element">
            <label for="semester">학기</label>
            <select id="semester" name="semester">
                <option value="none" disabled>학기</option>
                <option value="1">1</option>
                <option value="2">2</option>
            </select>
        </div>
        <button class="search__button">검색</button>
    </form>
    <div class="search__result">
        <table class="table">
            <thead class="table__header">
            <tr>
                <th class="table__cell">과목번호</th>
                <th class="table__cell">과목명</th>
                <th class="table__cell">분반</th>
                <th class="table__cell">학점</th>
                <th class="table__cell">교수님</th>
                <th class="table__cell">강의실</th>
                <th class="table__cell">강의시간</th>
                <th class="table__cell">정원</th>
                <th class="table__cell">신청결과</th>
            </tr>
            </thead>
            <tbody class="table__body">
                <%
                    // 학년도와 학기 정보가 없을 경우 기본 값 설정
                    Calendar cal = Calendar.getInstance();
                    int year = cal.get(Calendar.YEAR);
                    int currentMonth = cal.get(Calendar.MONTH) + 1; // Calendar.MONTH는 0부터 시작하므로 1을 더해줌
                    int semester = currentMonth >= 2 && currentMonth <= 7 ? 1 : 2;

                    Conn conn = new Conn();
                    ResultSet rs = null;

                    try {
                        rs = conn.getEnrollInfo(year, semester);
                        while (rs.next()) {
                %>
                <tr>
                    <td class="table__cell"><%= rs.getString("COURSE_ID") %></td>
                    <td class="table__cell"><%= rs.getString("COURSE_NAME") %></td>
                    <td class="table__cell"><%= rs.getString("COURSE_NO") %></td>
                    <td class="table__cell"><%= rs.getInt("COURSE_CREDIT") %></td>
                    <td class="table__cell"><%= rs.getString("FACULTY_NAME") %></td>
                    <td class="table__cell"><%= rs.getString("COURSE_ROOM") %></td>
                    <td class="table__cell"><%= rs.getString("COURSE_DAY") %> <%= rs.getString("COURSE_TIME") %></td>
                    <td class="table__cell"><%= rs.getInt("COURSE_CAP") %></td>
                    <td class="table__cell"><%= rs.getString("ENROLL_STAT") %></td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
<div id="content__right">
    <%@ include file="/views/userInfo.jsp" %>
</div>