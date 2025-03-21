<%-- 
    Document   : exam_result
    Created on : Mar 16, 2025, 9:01:30 PM
    Author     : Naammm
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Dashboard</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.2.0/remixicon.css">
        <link rel="stylesheet" href="assets/css/management.css"> 
        <link rel="stylesheet" href="assets/css/toast-message.css"> 
    </head>
    <body>
        <c:set var="isLoggedIn" value="<%=AuthUtils.isLoggedIn(session)%>"/>
        <c:set var="isAdmin" value="<%=AuthUtils.isAdmin(session)%>"/>
        <c:if test="${isLoggedIn}">
            <div class="container">
                <h2>Exam Completed!</h2>
                <p>Your Score: <strong>${score}</strong></p>
                <p>Correct Answers: <strong>${correctAnswers}</strong> / ${totalQuestions}</p>
                <a href="FilterController?txtCategoryName=All">Back to Exam List</a>
            </div>
        </c:if>
    </body>
</html>
