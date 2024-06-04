<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="enroll__radio" onclick="handleRadioClick(event)">
                <input type="radio" id="searchByCode" name="searchType" value="code" checked>
                <label for="searchByCode">과목코드로 검색</label>
                <input type="radio" id="searchByName" name="searchType" value="name">
                <label for="searchByName">과목명으로 검색</label>
                <input type="radio" id="searchByCategory" name="searchType" value="category">
                <label for="searchByCategory">카테고리 선택</label>
            </div>
        </form>
        <form class="enroll__filter__container">
            <div class="enroll__filter__element" id="searchCodeInput" style="display: none;">
                <label for="code">과목코드</label>
                <input type="text" id="code" name="code" placeholder="과목코드 입력">
                <button type="submit">검색</button>
            </div>
            <div class="enroll__filter__element" id="searchNameInput" style="display: none;">
                <label for="name">과목명</label>
                <input type="text" id="name" name="name" placeholder="과목명 입력">
                <button type="submit">검색</button>
            </div>
            <div class="enroll__filter__element" id="searchCategorySelect" style="display: none;">
                <label for="category">카테고리</label>
                <select id="category" name="category">
                    <option value="none">카테고리 선택</option>
                    <option value="교양필수">교양필수</option>
                    <option value="교양선택">교양선택</option>
                    <option value="전공">전공</option>
                    <option value="교직">교직</option>
                </select>
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
                <th class="table__cell">신청결과</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            <tr>
                <td class="table__cell">1234567</td>
                <td class="table__cell">파이썬으로배우는데이터시각화</td>
                <td class="table__cell">1</td>
                <td class="table__cell">3</td>
                <td class="table__cell">박숙영</td>
                <td class="table__cell">명신520</td>
                <td class="table__cell">화, 목 9:00-10:15</td>
                <td class="table__cell">000</td>
                <td class="table__cell">000</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<%
    }
%>
<div id="content__right">
    <%@ include file="/views/userInfo.jsp" %>
</div>
