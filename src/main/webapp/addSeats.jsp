<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="content__left">
    <form class="add_search__filter">
    	<div class="add_search__filter__element">
    		<input type="radio" id="searchById" name="searchOption" checked>
    		<label for="searchById">과목코드 검색</label>
    		<input type="radio" id="searchByName" name ="searchOption">
    		<label for="searchByName">과목명 검색</label>
    	</div>
    	<div class="input-container">
    		<input class="add_input" type="text" placeholder="내용을 입력해주세요.">        
        	<button class="add_search__button">검색</button>
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
                    <td class="table__cell">0</td>
                    <td class="table__cell"><button class="add__button" onclick="addSeatsAlert('1234657')">증원하기</button></td>
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
                    <td class="table__cell">0</td>
                    <td class="table__cell"><button class="add__button" onclick="addSeatsAlert('1234657')">증원하기</button></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div id="content__right">
    <%@ include file="/views/adminInfo.jsp" %>
</div>
