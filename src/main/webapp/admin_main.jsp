<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object user = session.getAttribute("admin");

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
        <h2>1. 강의등록</h2>
        <img src="path/to/firstAdmin/image.jpg" alt="강의등록 이미지">
        <p>강의등록 사용방법</p>
    </div>

    <div class="menu__item3">
        <h2>2. 증원하기</h2>
        <img src="path/to/secondAdmin/image.jpg" alt="증원하기 이미지">
        <p>증원하기 사용방법</p>
    </div>
</div>

<div id="content__right">
    <%@ include file="/views/adminInfo.jsp" %>
</div>