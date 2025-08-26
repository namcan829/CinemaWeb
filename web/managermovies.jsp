<%-- 
    Document   : managermovies
    Created on : Mar 22, 2025, 11:16:16 AM
    Author     : NgoQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="assets/css/shipper.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .custom-modal {
                max-width: 200%;
                width: 200%;
            }
            .modal-dialog{
                max-width: 1000px !important;
            }
            .icon-link {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                text-decoration: none;
                font-size: 18px;
                color: #333;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin: 0 5px;
                transition: all 0.3s ease-in-out;
            }

            .icon-link:hover {
                background-color: #f0f0f0;
            }
            .movie-img {
                width: 100px;
                height: 150px;
                object-fit: cover;
            }


        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="navbar_headerdash.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <%@include file="navbar_dashboard.jsp" %>
                <main>
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <div class="header-title">
                                <i class="fas fa-table me-2"></i> Bảng thống kê phim
                            </div>
                            <a href="addMovies" class="btn btn-primary">
                                <i class="fas fa-plus"></i> Thêm phim mới
                            </a>
                        </div>

                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Categories</th>
                                        <th>Duration (mins)</th>
                                        <th>Year</th>
                                        <th>Release Date</th>
                                        <th>Rating</th>
                                        <th>Image</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="c" items="${movies}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${c.title}</td>
                                            <td>${c.description}</td>
                                            <td>${c.categories}</td>
                                            <td>${c.duration}</td>
                                            <td>${c.year}</td>
                                            <td>${c.releaseDate}</td>
                                            <td>${c.rating}</td>
                                            <td><img src="${c.imageUrl}" class="movie-img" alt="alt"/></td>

                                            <td>
                                                <c:choose>
                                                    <c:when test="${c.statusId == 1}">Đang chiếu</c:when>
                                                    <c:when test="${c.statusId == 2}">Chuẩn bị chiếu</c:when>
                                                    <c:when test="${c.statusId == 3}">Đã hết</c:when>
                                                    <c:otherwise>Không xác định</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <a href="updatemovies?mid=${c.movieId}" class="icon-link">
                                                    <i class="fa fa-arrow-up" aria-hidden="true"></i>
                                                </a>
                                                <a href="delete-movie?deid=${c.movieId}" class="icon-link">
                                                    <i class="fa fa-archive" aria-hidden="true"></i>
                                                </a>

                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <c:if test="${not empty error}">
                                <p style="color: red">${error}</p>
                            </c:if>
                        </div>
                    </div>                                    
                </main>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/shipper.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/datatables-simple-demo.js"></script>
    </body>
</html>
