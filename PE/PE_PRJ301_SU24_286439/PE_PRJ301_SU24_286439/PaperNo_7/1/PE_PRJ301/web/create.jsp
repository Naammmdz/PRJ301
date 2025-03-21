<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creating an appointment </title>
    </head>
    <body>
        <h1>Creating appointment</h1>
        <hr/>
        <!--your code here-->
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="create">
            Account: <select name="account" required>
                <c:forEach  items="${requestScope.LIST_ACCOUNT}" var="acc">
                    <option value="${acc.account}">${acc.account}</option>
                </c:forEach>
            </select><br>
            Partner Phone: <input type="text" name="partnerPhone" required><br>
            Partner Name: <input type="text" name="partnerName" required><br>
            Time to Meet: <input type="datetime-local" step="1" name="timeToMeet" required><br>
            Place: <input type="text" name="place" required><br>
            Expense: <input type="number" step="0.01" name="expense" value="100"><br>
            Note: <textarea name="note"></textarea><br>
            <button type="submit">Create</button>
        </form>
    </body>
</html>
