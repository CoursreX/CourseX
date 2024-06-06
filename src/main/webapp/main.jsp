<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Object user = session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<div class="menu">
    <div class="menu__item1">
        <h1>CourseX에 오신 것을 환영합니다!</h1>
        <h6>CourseX는 어떻게 사용할까요?</h6>
    </div>
    <div class="menu__item2">
        <h2>1. 수강신청</h2>
        <img src="path/to/first/image.jpg" alt="수강신청 이미지">
        <p>수강신청 사용방법</p>
    </div>

    <div class="menu__item3">
        <h2>2. 수강조회</h2>
        <img src="path/to/second/image.jpg" alt="수강조회 이미지">
        <p>수강조회 사용방법</p>
    </div>

    <div class="menu__item4">
        <h2>3. 수강취소</h2>
        <img src="path/to/thrid/image.jpg" alt="수강취소 이미지">
        <p>수강취소 사용방법</p>
    </div>
</div>
<div id="content__right">
    <jsp:include page="/components/userInfo.jsp" />
</div>