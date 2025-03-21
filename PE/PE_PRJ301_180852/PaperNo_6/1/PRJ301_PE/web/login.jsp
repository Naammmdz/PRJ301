<%-- 
    Document   : login
    Created on : Aug 7, 2024, 11:04:18 AM
    Author     : hoadnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h5 style="color: red">${requestScope.ERROR}</h5>
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="login"><br>
            UserID <input type="text" name="txtUserID"><br>
            Password <input type="password" name="txtPassword"><br>
            <button type="submit">Login</button>
        </form>
    </body>
</html>
