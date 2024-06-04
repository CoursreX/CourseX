<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>CourseX - 수강신청</title>
    <link rel="stylesheet" href="./resources/css/index.css" />
    <link rel="stylesheet" href="./resources/css/sidebar.css" />
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="./resources/css/search.css" />
    <link rel="stylesheet" href="./resources/css/userInfo.css" />
    <link rel="stylesheet" href="./resources/css/addSeats.css" />
    <link rel="stylesheet" href="./resources/css/createAccount.css"/>
</head>
<body>
<section id="root">
    <%@ include file="/views/adminSidebar.jsp" %>
    <main id="content">
        <%@ include file="/main.jsp" %>
    </main>
</section>
<a href="hello-servlet">Hello Servlet</a>
<script src="resources/js/updateSelectedMenu.js"></script>
<script src="resources/js/loadContent.js"></script>
<script src="resources/js/addSeatsAlert.js"></script>
<script src="resources/js/createAccountAlert.js"></script>
</body>
</html>
