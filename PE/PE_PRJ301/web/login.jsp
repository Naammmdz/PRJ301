<%-- 
    Document   : login
    Created on : 30-10-2022
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <!--your code here-->
        <h5 style="color: red">${requestScope.ERROR}</h5>
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="login" />
            UserID <input type="text" name="txtUserID" value="" /><br>
            Password <input type="password" name="txtPassword" value="" /><br>
            <button type="submit">Login</button>
        </form>
    </body>
    
</html>

