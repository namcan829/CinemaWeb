
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Thống kê của web</h1>
                        <ol class="breadcrumb mb-4">
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Tổng tất cả số phim: ${total}</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <!-- Link để mở modal -->
                                        <a class="small text-white stretched-link" 
                                           href="#" 
                                           data-bs-toggle="modal" 
                                           data-bs-target="#tong"
                                           onclick = "showDataTong()">
                                            Xem chi tiết
                                        </a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Phim đang chiếu: ${ongoingOrders}</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" 
                                           href="#" 
                                           data-bs-toggle="modal" 
                                           data-bs-target="#dangiao"
                                           onclick="showDataDanggiao()"
                                           >
                                            Xem chi tiết
                                        </a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Phim chuẩn bị chiếu: ${ongoingOrders}</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" 
                                           href="#" 
                                           data-bs-toggle="modal" 
                                           data-bs-target="#chuanbi"
                                           onclick="showDataDagiao()"
                                           >
                                            Xem chi tiết
                                        </a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Phim ngừng chiếu: ${completedOrders}</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" 
                                           href="#" 
                                           data-bs-toggle="modal" 
                                           data-bs-target="#bihuy"
                                           onclick="showDataBihuy()"
                                           >
                                            Xem chi tiết
                                        </a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Bảng thống kê doanh thu
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Ngày</th>
                                        <th>Số Tiền</th>
                                        <th>Số Đơn</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="earning" items="${earningsList}" varStatus="st">
                                        <tr>
                                            <td>${st.index + 1}</td>
                                            <td>${earning[0]}</td>
                                            <fmt:formatNumber value="${earning[1]}" 
                                                              type="number" 
                                                              maxFractionDigits="0" 
                                                              var="formattedE" />

                                            <td>${formattedE.replace(',', '.')}₫</td>
                                            <td>${earning[2]}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>                                    
                </main>
            </div>
        </div>

        <div class="modal fade" id="tong" tabindex="-1" aria-labelledby="detailsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered custom-modal" style="width:1000px;"> 
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailsModalLabel">Tổng số phim</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table id="dataTong">
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
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="dangiao" tabindex="-1" aria-labelledby="detailsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered custom-modal" style="width:1000px;"> 
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailsModalLabel">Tổng số phim đang chiếu</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table id="datatablesDanggiao">
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
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${listMoviesShowing}" varStatus="status">
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
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="chuanbi" tabindex="-1" aria-labelledby="detailsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered custom-modal" style="width:1000px;"> 
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailsModalLabel">Tổng số đơn đã giao</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table id="datatablesDagiao">
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
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${listMoviesComming}" varStatus="status">
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
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="bihuy" tabindex="-1" aria-labelledby="detailsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered custom-modal" style="width:1000px;"> 
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailsModalLabel">Tổng số đơn đã giao</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table id="datatablesBihuy">
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
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${listMoviesCancelled}" varStatus="status">
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
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <script >
            document.addEventListener("DOMContentLoaded", function () {
                const navLinks = document.querySelectorAll(".nav-link");
                const path = window.location.pathname.split("/").pop();

                navLinks.forEach(link => {
                    if (link.getAttribute("href") === path) {
                        link.classList.add("active");
                        const collapseElement = link.closest(".collapse");
                        if (collapseElement) {
                            const collapseInstance = new bootstrap.Collapse(collapseElement, {
                                toggle: false
                            });
                            collapseInstance.show();
                        }
                    }
                });
            });
            function showDataTong() {
                const dataTong = document.getElementById('dataTong');
                if (dataTong) {
                    new simpleDatatables.DataTable(dataTong);
                }
            }
            function showDataDanggiao() {
                const datatablesDanggiao = document.getElementById('datatablesDanggiao');
                if (datatablesDanggiao) {
                    new simpleDatatables.DataTable(datatablesDanggiao);
                }
            }
            function showDataBihuy() {
                const datatablesBihuy = document.getElementById('datatablesBihuy');
                if (datatablesBihuy) {
                    new simpleDatatables.DataTable(datatablesBihuy);
                }
            }
            function showDataDagiao() {
                const datatablesDagiao = document.getElementById('datatablesDagiao');
                if (datatablesDagiao) {
                    new simpleDatatables.DataTable(datatablesDagiao);
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/shipper.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/chart-area-demo.js"></script>
        <script src="assets/js/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/datatables-simple-demo.js"></script>
    </body>
</html>
