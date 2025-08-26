<%-- 
    Document   : event
    Created on : Mar 11, 2025, 1:05:16 AM
    Author     : NgoQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- favicon -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <!-- bootstrap -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!-- fontawesome icon  -->
        <link rel="stylesheet" href="assets/css/fontawesome.min.css">
        <!-- flaticon css -->
        <link rel="stylesheet" href="assets/fonts/flaticon.css">
        <!-- animate.css -->
        <link rel="stylesheet" href="assets/css/animate.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <!-- magnific popup -->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!-- stylesheet -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- responsive -->
        <link rel="stylesheet" href="assets/css/responsive.css">
        <style>
            .search-bar {
                display: flex;
                align-items: center;
                background: #fff;
                border-radius: 50px;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                padding: 5px 15px;
                max-width: 350px;
                width: 100%;
                transition: all 0.3s ease-in-out;
                border: 1px solid #ddd;
            }

            .search-bar input {
                border: none;
                outline: none;
                padding: 10px;
                flex: 1;
                font-size: 16px;
                background: transparent;
            }

            .search-bar button {
                background: #ff5e00;
                border: none;
                cursor: pointer;
                padding: 10px 15px;
                font-size: 18px;
                color: white;
                border-radius: 50%;
                transition: background 0.3s ease-in-out;
            }

            .search-bar button:hover {
                background: #e05200;
            }

            @media (max-width: 768px) {
                .search-bar {
                    max-width: 100%;
                    margin-top: 10px;
                }
            }
            .movie-card {
                display: flex;
                flex-direction: column;
                height: 100%; /* Đảm bảo các card có cùng chiều cao */
            }

            .card-body {
                display: flex;
                flex-direction: column;
                justify-content: space-between; /* Đảm bảo nút luôn ở dưới */
                flex-grow: 1;
            }

            .card-text {
                flex-grow: 1; /* Để nội dung giãn ra nhưng không làm dịch nút */
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 3; /* Giới hạn số dòng */
                -webkit-box-orient: vertical;
            }

            .btn-primary {
                margin-top: auto; /* Đảm bảo nút luôn nằm dưới */
            }


        </style>
    </head>
    <body>

        <!-- preloader begin -->
        <div class="preloader">
            <div class="loader">
                <hr>
                <hr>
            </div>
        </div>
        <!-- preloader end -->

        <!-- header begin -->
        <%@include file="header.jsp" %>
        <!-- header end -->

        <!-- breadcrump begin -->
        <div class="breadcrump">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="breadcrump-content">
                            <span class="page-name">Home</span>
                            <span class="icon"><i class="fas fa-chevron-right"></i></span>
                            <span class="page-name">Movie</span>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="breadcrump-content">
                            <form action="movie" method="get" class="search-bar">
                                <input type="text" name="query" placeholder="Tìm kiếm phim..." required>
                                <button type="submit"><i class="fas fa-search"></i></button>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- breadcrump end -->
        <div class="container mt-4">
            <div class="row mb-3">
                <div class="col-md-4">
                    <form action="movie" method="GET">
                        <select name="category" class="form-control" onchange="this.form.submit()">
                            <option selected value="">-- Chọn thể loại --</option>
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.categoryId}" ${param.category == cat.categoryId ? 'selected' : ''}>
                                    ${cat.categoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </form>
                </div>
            </div>
        </div>

        <!-- single event begin -->
        <div class="container mt-4">
            <div class="row">
                <c:forEach var="listM" items="${listM}">
                    <div class="col-lg-3 col-md-3 mb-3">
                        <div class="card movie-card">
                            <img src="${listM.imageUrl}" class="card-img-top" alt="Movie Poster">
                            <div class="card-body">
                                <h5 class="card-title">${listM.title}</h5>
                                <p class="card-text">${listM.description}</p>
                                <div class="d-flex justify-content-between meta-info">
                                    <span><i class="fas fa-user"></i> ${listM.releaseDate}</span>
                                    <span><i class="fas fa-map-marker-alt"></i> ${listM.duration}</span>
                                </div>
                                <a href="#" class="btn btn-primary w-100 mt-3">Đặt vé</a>
                            </div>
                        </div>
                    </div>
                                
                </c:forEach>
            </div>
        </div>
        
        
        
        
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".card-text").forEach(function (el) {
                    let content = el.innerHTML;
                    let maxLength = 100; // Giới hạn số ký tự hiển thị

                    if (content.length > maxLength) {
                        let shortText = content.substring(0, maxLength) + "... ";
                        let moreLink = `<span class="more-text" style="display:none">${content}</span> 
                            <a href="#" class="read-more">Xem thêm</a>`;

                        el.innerHTML = shortText + moreLink;
                    }
                });

                document.addEventListener("click", function (event) {
                    if (event.target.classList.contains("read-more")) {
                        event.preventDefault();
                        let parent = event.target.parentElement;
                        parent.querySelector(".more-text").style.display = "inline";
                        event.target.style.display = "none"; // Ẩn nút "Xem thêm" sau khi bấm
                    }
                });
            });

        </script>
        <!-- single event end -->

        <!-- footer begin -->
        <%@include file="footer.jsp" %>
        <!-- footer end -->

        <!-- jquery -->
        <script src="assets/js/jquery.js"></script>
        <!-- bootstrap -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- owl carousel -->
        <script src="assets/js/owl.carousel.js"></script>
        <!-- magnific popup -->
        <script src="assets/js/jquery.magnific-popup.js"></script>
        <!-- way poin js-->
        <script src="assets/js/waypoints.min.js"></script>
        <!-- wow js-->
        <script src="assets/js/wow.min.js"></script>
        <!-- main -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
