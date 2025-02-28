<%-- 
    Document   : login
    Created on : Feb 27, 2025, 10:28:19 PM
    Author     : Naammm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Management</title>
        <link rel="stylesheet" href="assets/css/toast-message.css"> 
        <style>
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #667eea, #764ba2);
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0;
                }

                /* Container của form */
                .container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
                width: 350px;
                text-align: center;
                }

                /* Label */
                label {
                display: block;
                margin: 10px 0 5px;
                font-weight: bold;
                text-align: left;
                }

                /* Ô input */
                input[type="text"], input[type="password"] {
                width: 90%;
                padding: 10px;
                margin: 5px 0 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                }

                /* Nút login */
                button {
                width: 100%;
                padding: 10px;
                background: #667eea;
                border: none;
                border-radius: 5px;
                color: white;
                font-size: 18px;
                cursor: pointer;
                transition: 0.3s;
                }

                /* Hiệu ứng hover */
                button:hover {
                background: #5a67d8;
                }
            </style>
    </head>
    <body>
        <form action="MainController" method="post" >
            <div class="container">
                <input type="hidden" name="action" value="login" />
                <label for="username"><b>Username</b></label>
                <input type="text" placeholder="Please enter Username" name="txtUserName" required>
                <label for="password"><b>Password</b></label>
                <input type="password" placeholder="Please enter Password" name="txtPassword" required>
                <span></span>
                <button type="submit">Login</button>
            </div>
        </form>
        <% 
            String message = (String) request.getAttribute("toastMessage");
            String type = (String) request.getAttribute("toastType");          

            if (message != null && type != null) {
                String icon = "";
                String color = "";

                switch (type) {
                    case "success":
                        color = "#47d864";
                        break;
                    case "info":
                        color = "#2f86eb";
                        break;
                    case "warning":
                        color = "#ffc021";
                        break;
                    case "error":
                        color = "#ff6243";
                        break;
                }
        %>
            <div id="toast">
                <div class="toast toast--<%=type%>" 
                     style="animation: slideInLeft ease 0.3s, fadeOut linear 1s 3s forwards">
                    <div class="toast__private">
                        <div class="toast__icon">
<!--                            <i class="<%=icon%>"></i>-->
                        </div>
                        <div class="toast__body">
                            <h3 class="toast__title"><%= type.substring(0, 1).toUpperCase() + type.substring(1) %></h3>
                            <p class="toast__msg"><%= message %></p>
                        </div>
                        <div class="toast__close">
<!--                            <i class="fa-regular fa-circle-xmark"></i>-->
                        </div>
                    </div>
                    <div class="toast__background" style="background-color: <%= color %>;">
                    </div>
                </div>
            </div>
        <%
            }
        %>
        <script>
            const toastContainer = document.getElementById("toast");

            // Auto remove toast
            const toasts = toastContainer.querySelectorAll(".toast");
            toasts.forEach((toast) => {
                const autoRemove = setTimeout(() => {
                    toast.remove();
                }, 4000);

                toast.dataset.autoRemove = autoRemove;
            });
        </script>
    </body>
</html>
