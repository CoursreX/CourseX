<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션에서 studentID를 제거하고 인증 토큰을 초기화
    session.removeAttribute("studentID");
    session.removeAttribute("resetToken");
    session.removeAttribute("emailSent");

    // 페이지 리다이렉션
    response.sendRedirect("forget_pwd.jsp");
%>