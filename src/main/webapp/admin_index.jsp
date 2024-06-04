<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>CourseX - 수강신청</title>
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="./resources/css/index.css" />
    <link rel="stylesheet" href="./resources/css/sidebar.css" />
    <link rel="stylesheet" href="./resources/css/userInfo.css" />
    <link rel="stylesheet" href="./resources/css/addSeats.css" />
    <link rel="stylesheet" href="resources/css/createCourse.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<section id="root">
    <%@ include file="/views/adminSidebar.jsp" %>
    <main id="content">
        <%@ include file="/admin_main.jsp" %>
    </main>
</section>
<a href="hello-servlet">Hello Servlet</a>
<script src="resources/js/addSeatsConfirm.js"></script>
<script src="resources/js/loadContent.js"></script>
<script src="resources/js/daySelection.js"></script>
<script src="resources/js/addSearchResults.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>
