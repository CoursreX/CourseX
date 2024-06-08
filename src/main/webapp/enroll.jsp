<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="conn.Conn" %>

<%
    Object user = session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }

    Conn conn = new Conn();

    if(!conn.checkEnrollPeriod()) {
%>
<div class="content__left">수강신청 기간이 아닙니다.</div>
<%
} else {
%>
<div class="content__left">

    <div class="enroll__filter">
        <form class="enroll__filter__radio" onchange="handleRadio(event)">
            <div class="enroll__radio">
                <input type="radio" id="searchByCode" name="searchType" value="code" checked>
                <label for="searchByCode">과목코드로 검색</label>
                <input type="radio" id="searchByName" name="searchType" value="name">
                <label for="searchByName">과목명으로 검색</label>
                <input type="radio" id="searchByCategory" name="searchType" value="category">
                <label for="searchByCategory">카테고리 선택</label>
            </div>
        </form>
        <form id="searchCode" class="enroll__filter__container"  method="get" data-search-type='COURSE_ID' style="display: block;">
            <div class="enroll__filter__element" id="searchCodeInput">
                <label for="code">과목코드</label>
                <input class="enroll_input" type="text" id="code" name="searchValue" placeholder="과목코드 입력">
                <input type="hidden" name="searchType" value="code">
                <button class = "enroll_search__button" type="submit">검색</button>
            </div>
        </form>

        <form id="searchName" class="enroll__filter__container"  method="get" data-search-type='COURSE_NAME' style="display: none;">
            <div class="enroll__filter__element" id="searchNameInput">
                <label for="name">과목명</label>
                <input class="enroll_input" type="text" id="name" name="searchValue" placeholder="과목명 입력">
                <input type="hidden" name="searchType" value="name">
                <button class = "enroll_search__button" type="submit">검색</button>
            </div>
        </form>

        <form id="searchCategory" class="enroll__filter__container"  method="get" data-search-type='COURSE_CATEGORY' style="display: none;">
            <div class="enroll__filter__element" id="searchCategorySelect">
                <label for="category">카테고리</label>
                <select id="category" name="searchValue">
                    <option value="">카테고리 선택</option>
                    <option value="교양필수">교양필수</option>
                    <option value="교양선택">교양선택</option>
                    <option value="전공">전공</option>
                    <option value="교직">교직</option>
                </select>
                <input type="hidden" name="searchType" value="category">
                <button class = "enroll_search__button" type="submit">검색</button>
            </div>
        </form>
    </div>

    <!-- 검색 결과 테이블-->
    <div class="content__left__container">
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
                <th class="table__cell">카테고리</th>
                <th class="table__cell">개설여부</th>
                <th class="table__cell">신청</th>
            </tr>
            </thead>
            <tbody class="table__body">
            <%
                ResultSet rs = null;

                String searchType = request.getParameter("searchType");
                String searchValue = request.getParameter("searchValue");

                try {
                    rs = conn.getCourseInfo(searchType, searchValue);
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
                <td class="table__cell"><%= rs.getInt("COURSE_CAP") %></td> <!--인원수에따라 정원감소기능넣을것-->
                <td class="table__cell"><%= rs.getString("COURSE_CATEGORY") %></td>
                <%
                    int isOpened = rs.getInt("IS_OPENED");
                    String openedStatus = (isOpened == 0) ? "개설" : "미개설";
                    String colorClass = (isOpened == 0) ? "opened" : "closed";
                %>
                <td class="table__cell <%= colorClass %>"><%= openedStatus %></td>
                <td class="table__cell">
                    <button id="enrollButton" class="enrollButton" data-enroll-id="" data-enroll-no="" data-student-id="" onclick="handleEnrollButtonClick('<%= rs.getString("COURSE_ID") %>', '<%= rs.getString("COURSE_NO") %>', '<%= session.getAttribute("user") %>')">수강신청</button>
                </td>
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
<%
    }
%>
<div class="content__right">
    <jsp:include page="/components/userInfo.jsp" />
</div>