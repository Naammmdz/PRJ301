<%-- 
    Document   : add_question
    Created on : Mar 15, 2025, 4:21:02 PM
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
        <%@include file="header.jsp" %>
        <c:set var="isLoggedIn" value="<%=AuthUtils.isLoggedIn(session)%>"/>
        <c:set var="isAdmin" value="<%=AuthUtils.isAdmin(session)%>"/>
        
        <c:if test="${isAdmin}">
            <div class="container">
                <h2>${param.examTitle}</h2>
                <form action="AddQuestionsController" method="post">
                    <input type="hidden" name="examId" value="${examId}">

                    <div id="question-list">
                        <div class="question-block" style="margin-bottom: 10px">
                            <h3>Question Text:</h3>
                            <input type="text" name="questionText[]" required><br>

                            <label style="display: block;">Option A:</label>
                            <input type="text" name="optionA[]" required><br>

                            <label style="display: block;">Option B:</label>
                            <input type="text" name="optionB[]" required><br>

                            <label style="display: block;">Option C:</label>
                            <input type="text" name="optionC[]" required><br>

                            <label style="display: block;">Option D:</label>
                            <input type="text" name="optionD[]" required><br>

                            <label style="display: block;">Correct Option:</label>
                            <select name="correctOption[]" required>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                            </select><br>
                        </div>
                    </div>

                    <button type="button" onclick="addQuestion()">Add Another Question</button>
                    <button type="submit">Submit All Questions</button>
                </form>
            </div>
        </c:if>
        
        <script>
            function addQuestion() {
                let block = document.querySelector(".question-block").cloneNode(true);

                let inputs = block.querySelectorAll("input, select");
                inputs.forEach(input => {
                    input.value = "";
                });

                document.getElementById("question-list").appendChild(block);
            }
        </script>
    </body>
</html>
