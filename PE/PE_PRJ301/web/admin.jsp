<%-- 
    Document   : foodList
    Created on : 30-10-2022
    Author     : hd
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food List Page</title>
    </head>
    <body>
        <!--your code here-->
        <h1>Welcome ${user.fullName}</h1>
        <form action="MainController" method="POST">
            <button type="submit" name="action" value="logout">Logout</button>
        </form>
        <br>
        <form action="SearchController" method="GET">
            <input type="text" name="searchTerm" placeholder="Search user">
            <button type="submit" name="action" value="search">Search</button>
        </form>
        <c:if test="${not empty requestScope.userList}">
        <table border="1">
            <thead>
                <tr>
                    <th>no</th>
                    <th>userID</th>
                    <th>fullName</th>
                    <th>roleID</th>
                    <th>status</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="count" value="${0}"></c:set>
                <c:forEach items="${requestScope.userList}" var="user">
                <tr>
                    <td>${count + 1}</td>
                    <td>${user.userID}</td>
                    <td>${user.fullName}</td>
                    <td>${user.roleID}</td>
                    <td>${user.status}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        </c:if>
    </body>
</html>
