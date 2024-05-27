<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="content__left">
    <div class="cancel__list">
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
                <th class="table__cell">취소일자</th>
                <th class="table__cell">취소신청</th>
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
                <td class="table__cell">0000.00.00</td>
                <td class="table__cell"><button class="cancel__button">신청</button></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="content__right">
    <%@ include file="/views/userInfo.jsp" %>
</div>