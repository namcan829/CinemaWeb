<%-- 
    Document   : addmovies
    Created on : Mar 22, 2025, 9:52:11 PM
    Author     : NgoQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="assets/css/shipper.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    </head>
    <body class="sb-nav-fixed">
        <%@include file="navbar_headerdash.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <%@include file="navbar_dashboard.jsp" %>

                <main>
                    <div class="container">
                        <h4 class="fw-bold alert alert-dark p-2 text-center mt-3">
                            Thêm Phim Mới
                        </h4>
                        <div class="row m-auto">
                            <div class="p-2 bg-white rounded-3 border">
                                <form
                                    id="baseInfoForm"
                                    action="addMovies"
                                    method="post"
                                    enctype="multipart/form-data"
                                    >
                                    <div class="row">
                                        <div class="mb-3 col-md-6">
                                            <label
                                                for="productName"
                                                class="form-label fw-bold"
                                                >Tên Phim</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="productName"
                                                name="movieName"
                                                required
                                                />
                                        </div>
                                        <div class="mb-3 col-md-6">
                                            <label
                                                for="productCategory"
                                                class="form-label fw-bold"
                                                >Thể loại</label
                                            >
                                            <select
                                                class="form-select"
                                                id="productCategory"
                                                name="cateMovies"
                                                required
                                                >
                                                <option value="">-- Chọn thể loại --</option>
                                                <c:forEach items="${requestScope.mc}" var="c">
                                                    <option value="${c.categoryId}">${c.categoryName}</option>
                                                </c:forEach>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label
                                            for="productDescription"
                                            class="form-label fw-bold"
                                            >Mô Tả</label
                                        >
                                        <textarea
                                            class="form-control"
                                            id="productDescription"
                                            rows="3"
                                            name="moviesDes"
                                            required
                                            ></textarea>
                                    </div>

                                    <div class="row">
                                        <div class="mb-3 col-md-3">
                                            <label
                                                for="productStock"
                                                class="form-label fw-bold"
                                                >Thời lượng phim</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                name="moviesDu"
                                                id="productStock"
                                                required
                                                />
                                        </div>
                                        <div class="mb-3 col-md-3">
                                            <label
                                                for="productPrice"
                                                class="form-label fw-bold"
                                                >Năm</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                name="moviesYear"
                                                id="productPrice"
                                                required
                                                />
                                        </div>
                                        <div class="mb-3 col-md-3">
                                            <label
                                                for="productDiscount"
                                                class="form-label fw-bold"
                                                >Thời gian khởi chiếu</label
                                            >
                                            <input
                                                type="date"
                                                class="form-control"
                                                name="moviesTime"
                                                id="productDiscount"
                                                required
                                                />
                                        </div>
                                        <div class="mb-3 col-md-3">
                                            <label
                                                for="productWeight"
                                                class="form-label fw-bold"
                                                >Đánh giá</label
                                            >
                                            <input
                                                type="text"
                                                class="form-control"
                                                id="productWeight"
                                                name="moviesRate"
                                                required
                                                />
                                        </div>
                                    </div>
                                    <label
                                        for="bannerImage"
                                        class="form-label fw-bold d-block"
                                        >Ảnh Bìa</label
                                    >
                                    <div class="mb-3 p-0">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <img
                                                    src=""
                                                    alt=""
                                                    style="
                                                    width: 100px;
                                                    height: 100px;
                                                    object-fit: cover;
                                                    "
                                                    />
                                            </div>

                                            <div class="col-md-5">
                                                <input
                                                    type="file"
                                                    class="form-control"
                                                    name="moviesImge"
                                                    id="bannerImage"
                                                    />
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" value="Submit">
                                </form>
                            </div>
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
