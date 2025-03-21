<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pe.account.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of the appointments </title>
    </head>
    <body>
        <h1>The appointments</h1>
        <hr/>
        <!--your code here-->
        <% 
            AccountDTO user = (AccountDTO) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h2>Welcome ${sessionScope.user.fullName}</h2>
        <form action="MainController" method="GET">                  
            <button type="submit" name="action" value="logout">Logout</button>
        </form>
        
        <table border="1">
            <thead>
                <tr>
                    <th>idApp</th>
                    <th>account</th>
                    <th>partnerPhone</th>
                    <th>partnerName</th>
                    <th>timeToMeet</th>
                    <th>place</th>
                    <th>expense</th>
                    <th>note</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.appList}" var="app">
                <tr>
                    <td>${app.idApp}</td>
                    <td>${app.account}</td>
                    <td>${app.partnerPhone}</td>
                    <td>${app.partnerName}</td>
                    <td>${app.timeToMeet}</td>
                    <td>${app.place}</td>
                    <td>${app.expense}</td>
                    <td>${app.note}</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="MainController" method="GET">
            <a href="MainController?action=getAll">Create</a>
        </form>
    </body>
</html>
