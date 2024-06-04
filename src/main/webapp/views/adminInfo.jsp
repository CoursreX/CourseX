<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    String adminId = (String) session.getAttribute("admin");
    String adminDept = (String) session.getAttribute("adminDept");

%>
<aside id="user-info">
    <div class="user-info__item">
        <span class="user-info__label">관리자 이름</span>
        <div class="user-info__value"><%=adminName%></div>
    </div>
    <div class="user-info__item">
        <span class="user-info__label">관리자 번호</span>
        <div class="user-info__value"><%=adminId%></div>
    </div>
    <div class="user-info__item">
        <span class="user-info__label">소속 부서</span>
        <div class="user-info__value"><%=adminDept%></div>
    </div>
</aside>
