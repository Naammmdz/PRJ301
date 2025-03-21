<%-- 
    Document   : admin
    Created on : Aug 7, 2024, 11:40:23 AM
    Author     : hoadnt
--%>


<%@page import="sample.models.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room List Page</title>
    </head>
    <body>
        <% UserDTO user = (UserDTO) session.getAttribute("user"); 
               if (user == null) {
                   response.sendRedirect("login.jsp");
                   return;
               }
        %>
        <h2>Welcom ${sessionScope.user.fullName}</h2>
        <form action="MainController">
            <button type="submit" name="action" value="logout">Logout</button>
        </form>
        <form action="MainController" method="GET">
            <input type="hidden" name="action" value="search">
            <input type="text" name="searchTerm" placeholder="Search room by name" value="${requestScope.searchTerm}">
            <button type="submit">Search</button>
        </form>
        <c:if test="${not empty requestScope.roomList}">
        <table border="1">
            <thead>
                <tr>
                    <th>no</th>
                    <th>id</th>
                    <th>name</th>
                    <th>description</th>
                    <th>price</th>
                    <th>area</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="count" value="${0}"></c:set>
                <c:forEach items="${requestScope.roomList}" var="room">
                    <tr>
                        <td>${count + 1}</td>
                        <form action="UpdateController" method="GET">
                            <td>
                                <input type="text" name="roomId" value="${room.id}" readonly>
                            </td>
                            <td>
                                <input type="text" name="roomName" value="${room.name}">
                            </td>
                            <td>
                                <input type="text" name="roomDescription" value="${room.description}">
                            </td>
                            <td>
                                <input type="number" name="roomPrice" value="${room.price}" step="0.01">
                            </td>
                            <td>
                                <input type="number" name="roomArea" value="${room.area}" step="0.01">
                            </td>
                            <td>
                                <input type="hidden" name="search" value="${requestScope.searchTerm}"/>
                                <button type="submit" name="action" value="Update">Update</button>
                            </td>
                        </form>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </c:if>
    </body>
</html>
