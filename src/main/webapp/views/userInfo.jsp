<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userName = (String) session.getAttribute("userName");
    String userId = (String) session.getAttribute("user");
    String major = (String) session.getAttribute("major");
    int semester = (Integer) session.getAttribute("semester");
    int creditLimit = (Integer) session.getAttribute("creditLimit");

%>
<aside id="user-info">
    <div class="user-info__item">
        <span class="user-info__label">이름</span>
        <div class="user-info__value"><%= userName %></div>
    </div>
    <div class="user-info__item">
        <span class="user-info__label">학번</span>
        <div class="user-info__value"><%= userId %></div>
    </div>
    <div class="user-info__item">
        <span class="user-info__label">전공</span>
        <div class="user-info__value"><%= ("M001".equals(major)) ? "소프트웨어학부" : major %></div>
    </div>
    <div class="user-info__item">
        <span class="user-info__label">학기</span>
        <div class="user-info__value"><%= semester %>학기</div>
    </div>
    <div class="user-info__item">
        <span class="user-info__label">수강가능학점</span>
        <div class="user-info__value"><%= creditLimit %></div>
    </div>
</aside>
