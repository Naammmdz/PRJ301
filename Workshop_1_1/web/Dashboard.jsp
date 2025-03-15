<%-- 
    Document   : Management
    Created on : Feb 28, 2025, 2:31:13 AM
    Author     : Naammm
--%>

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
        
        <c:if test="${isLoggedIn}">
        <!-- Tabs -->
        <div class="container">
            <div class="tabs">
                <button class="tab-link <c:if test="${not empty requestScope.activeCategory}">${activeCategory}</c:if>" onclick="openTab(event, 'categories')">Exam Categories</button>
                <button class="tab-link <c:if test="${not empty requestScope.activeExam}">${activeExam}</c:if>" onclick="openTab(event, 'exams')">View Exams</button>
                <c:if test="${isAdmin}">
                <button class="tab-link <c:if test="${not empty requestScope.activeCreate}">${activeCreate}</c:if>" onclick="openTab(event, 'create-exam')">Create Exam</button>
                </c:if>
            </div>

            <!-- Tab 1: Danh mục -->
            <div id="categories" class="tab-content <c:if test="${not empty requestScope.hiddenCategory}">${hiddenCategory}</c:if>">
                <h3>Exam Categories</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Category Name</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody id="category-table">
                        <c:forEach items="${examcategoryList}" var="category">
                            <tr>
                                <td><a href="FilterController?txtCategoryName=${category.categoryName}">${category.categoryName}</a></td>
                                <td>${category.description}</td>
                            </tr>
                        </c:forEach>                       
                    </tbody>
                </table>
            </div>

            <!-- Tab 2: Danh sách bài kiểm tra -->
            <div id="exams" class="tab-content <c:if test="${not empty requestScope.hiddenExam}">${hiddenExam}</c:if>">
                <h3>Available Exams</h3>
                <label>Filter by category:</label>
                <select id="category-filter" name="txtCategoryName" onchange="filterExams()">
                    <option value="All" ${param.txtCategoryName == 'All' ? 'selected' : ''}>All</option>
                    <option value="Quiz" ${param.txtCategoryName == 'Quiz' ? 'selected' : ''}>Quiz</option>
                    <option value="Progress Test" ${param.txtCategoryName == 'Progress Test' ? 'selected' : ''}>Progress Test</option>
                    <option value="Final Exam" ${param.txtCategoryName == 'Final Exam' ? 'selected' : ''}>Final Exam</option>
                </select>
                <table>
                    <thead>
                        <tr>
                            <th>Exam Title</th>
                            <th>Subject</th>
                            <th>Total Marks</th>
                            <th>Duration</th>
                            <c:if test="${isAdmin}">
                                <th>Action</th>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody id="exam-table">
                        <c:forEach items="${examList}" var="exam">
                            <tr>
                                <td><a href="ExamDetailController?examId=${exam.examId}">${exam.examTitle}</a></td>
                                <td>${exam.subject}</td>
                                <td>${exam.totalMarks}</td>
                                <td>${exam.duration}</td>
                                <c:if test="${isAdmin}">
                                    <td><a href="AddQuestionsController?examId=${exam.examId}&examTitle=${exam.examTitle}">Add question</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>   
                    </tbody>
                </table>
            </div>

            <!-- Tab 3: Tạo bài kiểm tra -->
            <c:if test="${isAdmin}">
            <div id="create-exam" class="tab-content <c:if test="${not empty requestScope.hiddenCreate}">${hiddenCreate}</c:if>">
                <h3>➕ Create New Exam</h3>
                <form action="CreateExamController" method="post">
                    <input type="hidden" name="acction" value="create">
                    <label>Exam Title:</label>
                    <input type="text" name="examTitle" required>
                    <label>Subject:</label>
                    <input type="text" name="subject" required>
                    <label>Category:</label>
                    <select name="categoryName" required>
                        <option value="Quiz">Quiz</option>
                        <option value="Progress Test">Progress Test</option>
                        <option value="Final Exam">Final Exam</option>
                    </select>
                    <label>Total Marks:</label>
                    <input type="number" name="totalMarks" required min="1">
                    <label>Duration (minutes):</label>
                    <input type="number" name="duration" required min="1">
                    <button type="submit">Create Exam</button>
                </form>
            </div>
            </c:if>
                
        </div>
        </c:if>
        <c:if test="${!isLoggedIn}">
            You do not have permission to access this content.
            <a href="login.jsp">Back to the login page</a>
        </c:if>
        <script src="assets/js/main.js"></script>
        <script>
            function filterExams() {
                var category = document.getElementById("category-filter").value;
                window.location.href = "FilterController?txtCategoryName=" + category;
            }
        </script>
    </body>
</html>
