<%-- 
    Document   : header
    Created on : Mar 4, 2025, 3:08:40 AM
    Author     : Naammm
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header class="header">
    <div class="header-left">
        <img src="assets/img/logo-no-background.png" alt="Logo" class="logo"> <!-- Thêm logo -->
    </div>
    <% if (AuthUtils.isLoggedIn(session)){
                    UserDTO userHeader = AuthUtils.getUser(session);
    %>
    <div class="header-right">
        <h2 class="welcome-text">Welcome, <%= userHeader.getName()%>!</h2>
        <form action="MainController" method="POST">
            <button type="submit" name="action" value="logout" class="btn-logout">
                <i class="ri-logout-box-line"></i> Logout
            </button>
        </form>
    </div> 
    <%}%>
</header>
  

