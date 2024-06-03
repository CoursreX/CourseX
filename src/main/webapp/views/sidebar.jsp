<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="sidebar">
    <div class="sidebar__top">
        <div class="sidebar__header" onclick="unActiveMenu(); loadContent('main.jsp');">
            <img src="${pageContext.request.contextPath}/resources/assets/logo.svg" alt="logo" />
            <h1>CourseX</h1>
        </div>
        <div class="sidebar__menu-list">
            <div class="sidebar__menu" onclick="loadContent('enroll.jsp');">
                <img src="${pageContext.request.contextPath}/resources/assets/share.svg"
                     data-original-src="${pageContext.request.contextPath}/resources/assets/share.svg"
                     data-selected-src="${pageContext.request.contextPath}/resources/assets/share-white.svg"
                     alt="수강신청" />
                <div>수강신청</div>
            </div>
            <div class="sidebar__menu" onclick="loadContent('enrollCancel.jsp');">
                <img src="${pageContext.request.contextPath}/resources/assets/cancel.svg"
                     data-original-src="${pageContext.request.contextPath}/resources/assets/cancel.svg"
                     data-selected-src="${pageContext.request.contextPath}/resources/assets/cancel-white.svg"
                     alt="수강취소" />
                <div>수강취소</div>
            </div>
            <div class="sidebar__menu" onclick="loadContent('search.jsp');">
                <img src="${pageContext.request.contextPath}/resources/assets/word.svg"
                     data-original-src="${pageContext.request.contextPath}/resources/assets/word.svg"
                     data-selected-src="${pageContext.request.contextPath}/resources/assets/word-white.svg"
                     alt="수강조회" />
                <div>수강조회</div>
            </div>
            <div class="sidebar__menu" onclick="loadContent('enrollDrop.jsp');">
                <img src="${pageContext.request.contextPath}/resources/assets/trash.svg"
                     data-original-src="${pageContext.request.contextPath}/resources/assets/trash.svg"
                     data-selected-src="${pageContext.request.contextPath}/resources/assets/trash-white.svg"
                     alt="수강포기" />
                <div>수강포기</div>
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
    <div class="sidebar__bottom">
        <div class="sidebar__logout" onclick="loadContent('logout.jsp');" >
            <img src="${pageContext.request.contextPath}/resources/assets/logout.svg" alt="로그아웃"/>
            <div>로그아웃</div>
        </div>
    </div>
</nav>