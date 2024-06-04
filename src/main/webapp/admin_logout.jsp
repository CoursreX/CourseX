<%@ page contentType="text/html; charset=EUC-KR" %>
<% session.invalidate(); %>
<script>
    alert("로그아웃되었습니다.");
    location.href="admin_main.jsp";
</script>