<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section id="search">
    <div class="search__left">
        <form class="search__filter">
            <div class="search__filter__element">
                <label for="year">학년도</label>
                <select id="year" name="year">
                    <option value="none" disabled>학년도</option>
                    <option value="2024">2024</option>
                    <option value="2023">2023</option>
                    <option value="2023">2022</option>
                    <option value="2023">2021</option>
                    <option value="2023">2020</option>
                    <option value="2023">2019</option>
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
            <button class="search__submit">검색</button>
        </form>
        <div class="search__result">
            <table class="search__result__table"}>
                <thead class="search__result__table__header">
                <tr>
                    <th class="search__result__table__cell">과목번호</th>
                    <th class="search__result__table__cell">과목명</th>
                    <th class="search__result__table__cell">분반</th>
                    <th class="search__result__table__cell">학점</th>
                    <th class="search__result__table__cell">교수님</th>
                    <th class="search__result__table__cell">강의실</th>
                    <th class="search__result__table__cell">강의시간</th>
                    <th class="search__result__table__cell">정원</th>
                    <th class="search__result__table__cell">신청결과</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                <tr>
                    <td class="search__result__table__cell">1234567</td>
                    <td class="search__result__table__cell">파이썬으로배우는데이터시각화</td>
                    <td class="search__result__table__cell">1</td>
                    <td class="search__result__table__cell">3</td>
                    <td class="search__result__table__cell">박숙영</td>
                    <td class="search__result__table__cell">명신520</td>
                    <td class="search__result__table__cell">화, 목 9:00-10:15</td>
                    <td class="search__result__table__cell">000</td>
                    <td class="search__result__table__cell">000</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="search__right">
        <%@ include file="/views/userInfo.jsp" %>
    </div>
</section>
