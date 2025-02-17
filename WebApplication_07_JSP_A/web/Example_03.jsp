<%-- 
    Document   : Example_03
    Created on : Feb 10, 2025, 10:24:54 AM
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
        <%! int b=100; %>
        <%  
            if(b%2==0){
                %>
                <br><%=b%> La so chan<br/>
                <%
            }else{
                %>
                <br><%=b%> La so le<br/>
                <%
            }
        %>
    </body>
</html>
