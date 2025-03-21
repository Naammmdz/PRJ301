<%-- 
    Document   : take_exam
    Created on : Mar 16, 2025, 8:46:33 PM
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
                <h2>Exam Details</h2>
                <p><b>Exam Title:</b> ${exam.examTitle}</p>
                <p><b>Subject:</b> ${exam.subject}</p>
                <p><b>Total Marks</b> ${exam.totalMarks}</p>
                <p><b>Duration:</b> ${exam.duration} minutes</p>
                <p>Time Remaining: <span id="timer"></span></p>
                <form id="examForm" action="TakeExamController" method="post">
                    <input type="hidden" name="examId" value="${exam.examId}">

                    <c:forEach var="question" items="${questions}">
                        <div class="question">
                            <h3>${question.questionText}</h3>
                            <label><input type="radio" name="question_${question.questionId}" value="A"> ${question.optionA}</label><br>
                            <label><input type="radio" name="question_${question.questionId}" value="B"> ${question.optionB}</label><br>
                            <label><input type="radio" name="question_${question.questionId}" value="C"> ${question.optionC}</label><br>
                            <label><input type="radio" name="question_${question.questionId}" value="D"> ${question.optionD}</label><br>
                            <hr>
                        </div>
                    </c:forEach>

                    <button type="submit">Submit</button>
                </form>
            </div>
        </c:if>
        <script>
            let countdown = ${exam.duration}  * 60; 

            function updateTimer() {
                let minutes = Math.floor(countdown / 60);
                let seconds = countdown % 60;
                document.getElementById("timer").textContent = minutes + "m " + seconds + "s";

                if (countdown <= 0) {
                    document.getElementById("examForm").submit(); 
                } else {
                    countdown--;
                    setTimeout(updateTimer, 1000);
                }
            }
            updateTimer();
        </script>
    </body>
</html>
