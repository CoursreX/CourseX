<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object user = session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="menu">
    <div class="menu__item1">
        <h1>관리자용 CourseX에 오신 것을 환영합니다!</h1>
        <h6>관리자용 CourseX는 어떻게 사용할까요?</h6>
    </div>
    <div class="menu__item2">
        <h2>1. 강의등록</h2>
        <img src="./resources/image/createCourse-eg.png" alt="강의등록 이미지">
        <div>
            <p>입력 폼에 맞게 등록할 강의를 작성해 주세요.</p>
            다음과 같은 경우에는 등록이 안돼요.
            <ul>
                <li>새로운 과목번호의 분반은 1부터 시작해야해요.</li>
                <li>이미 존재하는 과목명을 등록하려면 과목번호가 동일해야해요.</li>
                <li>이미 존해하는 과목번호에서는 분반, 과목명, 강의유형, 학점이 같아야 해요.</li>
                <li>등록되지 않은 교번이나 교번과 이름이 일치하지 않으면 등록이 되지 않아요.</li>
                <li>강의 시간은 0 이상이며 시작시간이 종료시간보다 빠르면 안돼요.</li>
            </ul>
        </div>
    </div>
    <div class="menu__item3">
        <h2>2. 증원하기</h2>
        <img src="./resources/image/addSeats-eg.png" alt="증원하기 이미지">
        <div>
            <p>(1) 과목번호나 과목명을 이용하여 증원을 원하는 강의를 찾아주세요.
                <br>(2) 증원하기 버튼을 눌러서 증원과정을 진행해 주세요.</p>
            이 점을 참고해주세요.
            <ul>
                <li>증원 할 강의 정보를 꼭 확인해주세요.</li>
                <li>증원하는 인원을 입력할 시에는 '정수'만 가능합니다.</li>
                <li>증원 이후 감원을 할 수 없으니 신중히 진행하여주세요.</li>
            </ul>
        </div>
    </div>
    <div class="menu__item4">
        <h2>3. 증원이력</h2>
        <img src="./resources/image/showHistory-eg.png" alt="증원이력 이미지">
        <p>관리자가 증원한 이력을 볼 수 있는 페이지입니다. <br> 증원 이후 이력을 확인해주세요!</p>

    </div>
</div>

<div id="content__right">
    <%@ include file="/components/adminInfo.jsp" %>
</div>