<%-- 
    Document   : navbar_dashboard
    Created on : Mar 22, 2025, 11:18:33 AM
    Author     : NgoQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Mục lục</div>
                        <a class="nav-link" href="dashboard">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt" style="color: #3399ff"></i></div>
                            Trang thống kê
                        </a>
                        <a class="nav-link" href="listuser">
                            <div class="sb-nav-link-icon"><i class="fas fa-table" style="color: #ff3333"></i></div>
                            Danh sách người dùng
                        </a>
                        <a class="nav-link" href="listmovies">
                            <div class="sb-nav-link-icon"><i class="fas fa-table" style="color: #ff3333"></i></div>
                            Quản lý phim
                        </a>
                    </div>
                </div>
            </nav>
        </div>
    </body>
</html>
