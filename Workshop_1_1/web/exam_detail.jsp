<%-- 
    Document   : exam_detail
    Created on : Mar 15, 2025, 6:14:16 PM
    Author     : Naammm
--%>

<%@page import="utils.AuthUtils"%>
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
        <c:if test="${isAdmin}">
            <div class="container">
                <h2>Exam Details</h2>
                <p><b>Exam Title:</b> ${exam.examTitle}</p>
                <p><b>Subject:</b> ${exam.subject}</p>
                <p><b>Total Marks</b> ${exam.totalMarks}</p>
                <p><b>Duration:</b> ${exam.duration} minutes</p>
                <h3>Question List:</h3>
                <c:forEach var="question" items="${questionList}" varStatus="status">
                    <div class="question">
                        <p><b>Question ${status.index + 1}:</b> ${question.questionText}</p>
                        <ul>
                            <li>A. ${question.optionA}</li>
                            <li>B. ${question.optionB}</li>
                            <li>C. ${question.optionC}</li>
                            <li>D. ${question.optionD}</li>
                        </ul>
                        <p><b>Correct Answer:</b> ${question.correctOption}</p>
                    </div>
                    <hr>
                </c:forEach>
                <a href="DashboardController">Back to Dashboard</a>
            </div>
        </c:if>
            
    </body>
</html>
