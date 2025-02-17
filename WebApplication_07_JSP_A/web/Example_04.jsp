<%-- 
    Document   : Example_04
    Created on : Feb 10, 2025, 10:32:08 AM
    Author     : Naammm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            for (int i = 2; i < 9; i++) {
                %>
                <h3>Bang cuu chuong <%=i%></h3>
                <%
                for (int j = 1; j < 10; j++) {
                %>
                <%=i%>*<%=j%>=<%=i*j%><br/>
                <%
                }
            }
        %>
    </body>
</html>
