<%-- 
    Document   : header
    Created on : Feb 12, 2025, 9:50:30 PM
    Author     : Naammm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TÁO ZIN</title>
        <!--=============== FAVICON ===============-->
        <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
        <link rel="manifest" href="/img/site.webmanifest">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/style.css"> 
        <!-- Bootstrap jS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!-- HEADER -->
        <header class="header">
            <div class="container-fluid">
                <div class="row align-items-center">
                    
                    <!-- LOGO -->
                    <div class="col-md-2">
                        <a href="index.jsp" class="logo">
                            <img src="img/logo-no-background.png" alt="TÁO ZIN - iPhone, iPad, Mac, phụ kiện điện tử chính hãng" width="50">
                        </a>
                    </div>
                    
                    <!-- MENU -->
                    <div class="col-md-3">
                        <div class="dropdown">
                            <button class="btn btn-ligh" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
                                <i class="bi bi-list"></i>
                                <span class="d-none d-md-inline ms-1">Danh mục</span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">iPhone</a></li>
                                <li><a class="dropdown-item" href="#">iPad</a></li>
                                <li><a class="dropdown-item" href="#">Macbook</a></li>
                                <li><a class="dropdown-item" href="#">Âm thanh</a></li>
                                <li><a class="dropdown-item" href="#">Phụ kiện</a></li>
                                <li><a class="dropdown-item" href="#">Khuyến mãi</a></li>
                                <li><a class="dropdown-item" href="#">Chính sách bảo hành</a></li>
                            </ul>
                        </div>                        
                    </div>
                    
                    <!-- SEARCH -->
                    <div class="col-md-4">
                        <form action="SearchServlet" method="GET" class="d-flex">
                            <input class="form-control" type="search" name="query" placeholder="Tìm kiếm sản phẩm..." required>
                            <button class="btn btn-outline-secondary" type="submit">🔍</button>
                        </form>
                    </div>

                    <!-- HOTLINE & CART -->
                    <div class="col-md-3 text-end">
                        <a href="tel:0886545188" class="hotline">📞 0886545188</a>
                        <a href="cart.jsp" class="cart-icon ms-3">🛒 Giỏ hàng</a>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
