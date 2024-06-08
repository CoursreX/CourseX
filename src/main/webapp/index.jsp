<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>CourseX - 수강신청</title>
    <link rel="stylesheet" href="./resources/css/index.css" />
    <link rel="stylesheet" href="./resources/css/sidebar.css" />
    <link rel="stylesheet" href="./resources/css/userInfo.css" />
    <link rel="stylesheet" href="resources/css/main.css"/>
    <link rel="stylesheet" href="resources/css/enrollSearch.css" />
    <link rel="stylesheet" href="./resources/css/enroll.css"/>
    <link rel="stylesheet" href="./resources/css/login.css" />
    <link rel="stylesheet" href="./resources/css/restPwd.css" />
    <link rel="stylesheet" href="./resources/css/forgetPwd.css" />
    <link rel="stylesheet" href="./resources/css/pwdVerify.css" />

</head>
<body>
<section id="root">
    <%@ include file="/components/sidebar.jsp" %>
    <main id="content">
        <%@ include file="/main.jsp" %>
    </main>
</section>
<script src="resources/js/updateSelectedMenu.js"></script>
<script src="resources/js/loadContent.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resources/js/searchForm.js"></script>
<script src="resources/js/getCourseInfo.js"></script>
<script src="resources/js/enrollButton.js"></script>
<script src="resources/js/enrollCourse.js"></script>
<script src="resources/js/cancelEnroll.js" ></script>
<script src="resources/js/searchEnroll.js" ></script>
<script src="resources/js/dropEnroll.js" ></script>
<script src="resources/js/logout.js" ></script>
</body>
</html>