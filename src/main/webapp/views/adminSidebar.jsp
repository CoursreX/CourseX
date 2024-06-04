<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="sidebar">
    <div class="sidebar__top">
        <div class="sidebar__header" onclick="unActiveMenu(); loadContent('admin_main.jsp');">
            <img src="${pageContext.request.contextPath}/resources/assets/logo.svg" alt="logo" />
            <h1>CourseX</h1>
        </div>
        <div class="sidebar__menu-list">
            <div class="sidebar__menu" onclick="loadContent('createCourse.jsp');">
                <img src="${pageContext.request.contextPath}/resources/assets/pen.svg"
                     data-original-src="${pageContext.request.contextPath}/resources/assets/pen.svg"
                     data-selected-src="${pageContext.request.contextPath}/resources/assets/pen-white.svg"
                     alt="강의등록" />
                <div>강의등록</div>
            </div>
            <div class="sidebar__menu" onclick="loadContent('addSeats.jsp');">
                <img src="${pageContext.request.contextPath}/resources/assets/add.svg"
                     data-original-src="${pageContext.request.contextPath}/resources/assets/add.svg"
                     data-selected-src="${pageContext.request.contextPath}/resources/assets/add-white.svg"
                     alt="증원하기" />
                <div>증원하기</div>
            </div>
            <div class="sidebar__menu" onclick="loadContent('reset_password.jsp');">
                <img src="${pageContext.request.contextPath}/resources/assets/key.svg"
                     data-original-src="${pageContext.request.contextPath}/resources/assets/key.svg"
                     data-selected-src="${pageContext.request.contextPath}/resources/assets/key-white.svg"
                     alt="비밀번호 재설정" />
                <div>비밀번호 재설정</div>
            </div>
        </div>
    </div>
    <div class="sidebar__bottom" onclick="loadContent('admin_logout.jsp');">
        <div class="sidebar__logout">
            <img src="${pageContext.request.contextPath}/resources/assets/logout.svg" alt="로그아웃"/>
            <div>로그아웃</div>
        </div>
    </div>
</nav>
