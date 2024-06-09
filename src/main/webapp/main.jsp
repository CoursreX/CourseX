<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Object user = session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<div class="content__left">
    <div class="menu__item1">
        <h1>CourseX에 오신 것을 환영합니다!</h1>
        <h6>CourseX는 어떻게 사용할까요?</h6>
    </div>
    <div class="menu__item2">
        <h2>1. 수강신청</h2>
        <img src="resources/image/guide_2.png" alt="수강신청 이미지">
        <ol>
            <li><strong>수강신청 메뉴 접근</strong>
                <ul>
                    <li>왼쪽 사이드바에서 "수강신청" 메뉴를 선택합니다.</li>
                </ul>
            </li>
            <li><strong>과목 검색</strong>
                <ul>
                    <li><strong>과목코드로 검색:</strong> 수강하고 싶은 과목의 코드를 입력해 검색버튼을 누르면 해당 과목이 나타납니다.</li>
                    <li><strong>과목명으로 검색:</strong> 수강하고 싶은 과목의 이름을 입력해 검색버튼을 누르면 해당 과목이 나타납니다.</li>
                    <li><strong>카테고리 선택:</strong> 교양필수, 교양선택, 전공, 교직 중 하나를 골라 해당 종류에 속하는 과목의 목록들을 확인할 수 있습니다.</li>
                </ul>
            </li>
            <li><strong>수강신청 절차</strong>
                <ul>
                    <li>과목을 조회하게 되면 오른쪽에 수강신청 버튼이 있습니다. 해당 과목의 신청버튼을 누르면 수강신청이 완료되게 되고, "수강신청이 완료되었습니다"라는 알림창이 뜹니다.</li>
                </ul>
            </li>
            <li><strong>수강신청 제한사항</strong>
                <ul>
                    <li><strong>최대학점 초과:</strong> 본인의 수강 가능 학점을 넘어 수강신청하게 되면 "최대학점을 초과하였습니다"라는 알림창이 뜹니다.</li>
                    <li><strong>이미 등록된 과목:</strong> 이미 수강신청을 완료한 과목이거나, 분반이 다른 과목을 이미 신청하였다면 "이미 등록된 과목을 신청하였습니다."라는 알림창이 뜹니다.</li>
                    <li><strong>수강신청 인원 초과:</strong> 여석이 없다면 "수강신청 인원이 초과되어 등록이 불가능합니다."라는 알림창이 뜹니다.</li>
                    <li><strong>시간 중복:</strong> 이미 신청한 과목 중 신청하려는 과목과 시간이 겹치게 된다면 "이미 등록된 과목 중 중복되는 시간이 존재합니다."라는 알림창이 뜹니다.</li>
                </ul>
            </li>
            <li><strong>기타 오류</strong>
                <ul>
                    <li>이 외에 기타 오류는 "예상치 못한 오류가 발생했습니다."라는 알림창이 뜹니다.</li>
                </ul>
            </li>
        </ol>
    </div>

    <div class="menu__item3">
        <h2>2. "수강조회" 사용방법</h2>
        <img src="resources/image/guide_3.png" alt="수강조회 이미지">
        <ol>
            <li><strong>수강조회 메뉴 접근</strong>
                <ul>
                    <li>왼쪽 사이드바에서 "수강조회" 메뉴를 선택합니다.</li>
                </ul>
            </li>
            <li><strong>수강조회 페이지 확인</strong>
                <ul>
                    <li>처음 수강조회 페이지에 들어가면, 오늘 날짜에 해당하는 연도와 학기로 조회된 결과가 표시됩니다.</li>
                    <li>조회 결과에는 과목번호, 과목명, 분반, 학점, 담당교수, 강의실, 강의시간, 정원, 수강상태 등의 정보가 포함됩니다.</li>
                </ul>
            </li>
            <li><strong>학년도와 학기 선택</strong>
                <ul>
                    <li>원하는 학년도와 학기를 선택하고 검색버튼을 클릭합니다.</li>
                    <li>선택한 학년도와 학기에 대한 수강신청내역을 확인할 수 있습니다.</li>
                    <li>총 수강학점도 확인할 수 있습니다.</li>
                </ul>
            </li>
            <li><strong>조회결과 없음</strong>
                <ul>
                    <li>수강신청한 내역이 없을 경우, "조회결과가 없습니다"라는 문구가 표시됩니다.</li>
                </ul>
            </li>
        </ol>
    </div>

    <div class="menu__item4">
        <h2>3. 수강취소</h2>
        <img src="resources/image/guide_4.png" alt="수강취소 이미지">
        <ol>
            <li><strong>수강취소 메뉴 접근</strong>
                <ul>
                    <li>왼쪽 사이드바에 "수강취소" 메뉴가 있습니다. 해당 메뉴에 들어갑니다.</li>
                </ul>
            </li>
            <li><strong>수강신청 기간 확인</strong>
                <ul>
                    <li>수강신청 기간이 아닌 경우 "수강신청 기간이 아닙니다"라는 문구가 표시됩니다.</li>
                    <li>수강신청 기간인 경우 수강신청한 과목들이 나타나게 됩니다.</li>
                </ul>
            </li>
            <li><strong>수강취소 절차</strong>
                <ul>
                    <li>취소신청 버튼 클릭 시 과목명과 분반을 알려주고 해당 과목의 수강취소를 묻는 창이 나타납니다.</li>
                    <li>확인을 누르면 해당 과목의 수강신청이 취소됩니다.</li>
                    <li>수강취소가 완료되면 "수강취소가 완료되었습니다"라는 알림창이 나타납니다.</li>
                </ul>
            </li>
            <li><strong>수강신청된 과목 없음</strong>
                <ul>
                    <li>수강신청한 과목이 없는 경우엔 "수강신청된 과목이 없습니다"라는 문구가 표시됩니다.</li>
                </ul>
            </li>
        </ol>
    </div>

    <div class="menu__item5">
        <h2>4. 수강포기</h2>
        <img src="resources/image/guide_5.png" alt="수강취소 이미지">
        <ol>
            <li><strong>수강포기 메뉴 접근</strong>
                <ul>
                    <li>왼쪽 사이드바에 "수강포기" 메뉴가 있습니다. 해당 메뉴에 들어갑니다.</li>
                </ul>
            </li>
            <li><strong>수강포기 기간 확인</strong>
                <ul>
                    <li>수강포기 기간이 아닌 경우 "수강포기 기간이 아닙니다"라는 문구가 표시됩니다.</li>
                    <li>수강포기 기간인 경우 수강신청에 성공한 과목 및 수강포기한 과목들이 나타납니다.</li>
                </ul>
            </li>
            <li><strong>수강포기 절차</strong>
                <ul>
                    <li>포기 버튼 클릭 시 과목명과 분반을 알려주고 해당 과목의 수강을 포기할 것인지 묻는 창이 나타납니다.</li>
                    <li>확인을 누르면 해당 과목의 수강을 포기합니다.</li>
                    <li>수강포기가 완료되면 "수강포기가 완료되었습니다"라는 알림창이 나타납니다.</li>
                    <li>정상적으로 수강포기가 이루어질 경우 수강포기한 과목의 포기일자가 오늘 날짜로 변경됩니다.</li>
                </ul>
            </li>
            <li><strong>수강신청한 과목 없음</strong>
                <ul>
                    <li>수강신청한 과목이 없을 경우 "수강신청된 과목이 없습니다"라는 문구가 표시됩니다.</li>
                </ul>
            </li>
        </ol>
    </div>

    <div class="menu__item6">
        <h2>5. 비밀번호 재설정</h2>
        <img src="resources/image/guide_6.png" alt="수강취소 이미지">
        <ol>
            <li><strong>비밀번호 재설정 메뉴 접근</strong>
                <ul>
                    <li>왼쪽 사이드바에서 "비밀번호 재설정" 메뉴를 선택합니다.</li>
                </ul>
            </li>
            <li><strong>학번 입력</strong>
                <ul>
                    <li>학번을 입력하고 "send" 버튼을 누릅니다.</li>
                </ul>
            </li>
            <li><strong>인증번호 입력</strong>
                <ul>
                    <li>입력한 학번에 등록된 이메일로 인증번호가 전송됩니다.</li>
                    <li>받은 인증번호를 입력합니다.</li>
                </ul>
            </li>
            <li><strong>비밀번호 재설정</strong>
                <ul>
                    <li>인증번호가 일치하면 비밀번호를 재설정할 수 있는 페이지로 이동합니다.</li>
                    <li>변경할 비밀번호를 입력합니다.</li>
                </ul>
            </li>
        </ol>
    </div>
</div>
<div id="content__right">
    <jsp:include page="/components/userInfo.jsp" />
</div>