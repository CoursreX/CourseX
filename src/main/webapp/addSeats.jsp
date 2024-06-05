<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="conn.Conn" %>
<%@ page import="java.util.*" %>
<%
    Object user = session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%
    String searchOption = request.getParameter("searchOption");
    String search = request.getParameter("search");

    List<Map<String, Object>> courseResult = new ArrayList<>();
    if (searchOption != null && search != null && !search.trim().isEmpty()) {
        Conn conn = new Conn();
        courseResult = conn.add_searchCourse(searchOption, search);
    }
%>

<div class="content__left">
    <form id="addSeats_search_form" class="add_search__filter">
    	<div class="add_search__filter__element">
    		<input type="radio" id="searchById" name="searchOption" value="id" checked>
    		<label for="searchById">과목코드 검색</label>
    		<input type="radio" id="searchByName" name ="searchOption" value="name">
    		<label for="searchByName">과목명 검색</label>
    	</div>
    	<div class="add_input-container">
    		<input class="add_input" type="text" name="add_search" placeholder="내용을 입력해주세요.">
        	<button class="add_search__button" type="submit">검색</button>
        </div>
    </form>
    <div class="add__list">
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
                <th class="table__cell">여석</th>
                <th class="table__cell">증원</th>
            </tr>
            </thead>
            <tbody class="add_table__body">
            <!-- 검색 결과 표시-->
            </tbody>
        </table>
    </div>
</div>
<div id="content__right">
    <%@ include file="/views/adminInfo.jsp" %>
</div>
