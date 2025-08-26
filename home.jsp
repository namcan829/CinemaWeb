<%-- 
    Document   : home
    Created on : Mar 21, 2025, 5:24:54 PM
    Author     : VAnh
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- banner begin -->
        <div class="banner">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="banner-content">
                            <h1>CINEMA</h1>
                            <h4>Great Movies, Anytime, Anywhere!</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-12 col-lg-12">
                        <div class="banner-bottom">
                            <div class="row">
                                <div class="col-xl-4 col-lg-4 col-md-6 d-xl-block d-lg-block d-md-none">
                                    <div class="part-img">
                                        <img src="assets/img/banner-bottom.jpeg" alt="">
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-6 d-xl-flex d-lg-flex d-md-block align-items-center">
                                    <div class="promo-video">
                                        <div class="part-icon">
                                            <a class="play-button venobox mfp-iframe" href="https://www.youtube.com/watch?v=SjkcA2ZCmDU"><i class="fas fa-play"></i></a>
                                        </div>
                                        <div class="part-text">
                                            <h3>promo videos</h3>
                                            <span class="intro">Watch our intro</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-6 d-xl-flex d-lg-flex d-md-flex align-items-center">
                                    <div class="banner-buttons">
                                        <a href="#">get ticket</a>
                                        <a href="#">explore more</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- banner end -->

        <!-- event schedule begin -->
        <div class="event-schedule">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-8">
                        <div class="section-title text-center">
                            <h2>Top 3 Movies</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-3 col-lg-3">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" data-toggle="pill" href="#v-pills-home" role="tab">
                                Monday <span class="month-count" data-day="1"></span>
                            </a>
                            <a class="nav-link" data-toggle="pill" href="#v-pills-profile" role="tab">
                                Tuesday <span class="month-count" data-day="2"></span>
                            </a>
                            <a class="nav-link" data-toggle="pill" href="#v-pills-home" role="tab">
                                Wednesday <span class="month-count" data-day="3"></span>
                            </a>
                            <a class="nav-link" data-toggle="pill" href="#v-pills-profile" role="tab">
                                Thursday <span class="month-count" data-day="4"></span>
                            </a>
                            <a class="nav-link" data-toggle="pill" href="#v-pills-home" role="tab">
                                Friday <span class="month-count" data-day="5"></span>
                            </a>
                            <a class="nav-link" data-toggle="pill" href="#v-pills-profile" role="tab">
                                Saturday <span class="month-count" data-day="6"></span>
                            </a>
                            <a class="nav-link" data-toggle="pill" href="#v-pills-home" role="tab">
                                Sunday <span class="month-count" data-day="0"></span>
                            </a>

                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9">
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">

                                <div id="accordion">
                                    <div class="card">
                                        <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" role="button">
                                            <div class="part-img">
                                                <img src="${movie1.imgURL}" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>${movie1.title}</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> 
                                                <span class="location">
                                                    <i class="fas fa-globe"></i>${movie1.country}</span>
                                            </div>
                                        </div>

                                        <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                            <div class="card-body">
                                                <p>${movie1.content}</p>
                                                <span class="name">${movie1.duration}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" role="button">
                                            <div class="part-img">
                                                <img src="${movie2.imgURL}" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>${movie2.title}</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span>
                                                <span class="location"><i class="fas fa-globe"></i>
                                                    ${movie2.country}</span>
                                            </div>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                            <div class="card-body">
                                                <p>${movie2.content}</p>
                                                <span class="name">${movie2.director}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" role="button">
                                            <div class="part-img">
                                                <img src="${movie3.imgURL}" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>${movie3.title}</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> 
                                                <span class="location"><i class="fas fa-globe">

                                                    </i>  ${movie3.country}</span>
                                            </div>
                                        </div>
                                        <div id="collapseThree" class="collapse" data-parent="#accordion">
                                            <div class="card-body">
                                                <p>${movie3.content}</p>
                                                <span class="name">${movie3.director}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                <div id="accordion2">
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse4" aria-expanded="false"
                                             aria-controls="collapse4" role="button">
                                            <div class="part-img">
                                                <img src="${movie1.imgURL}" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>${movie1.title}</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span>
                                                <span class="location"><i class="fas fa-globe"></i> ${movie1.country}</span>
                                            </div>
                                        </div>

                                        <div id="collapse4" class="collapse" data-parent="#accordion2">
                                            <div class="card-body">
                                                <p>${movie1.content}</p>
                                                <span class="name">${movie1.duration}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" data-toggle="collapse" data-target="#collapse5" aria-expanded="true"
                                             aria-controls="collapse5" role="button">
                                            <div class="part-img">
                                                <img src="${movie2.imgURL}" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>${movie2.title}</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> 
                                                <span class="location"><i class="fas fa-globe"></i>
                                                    ${movie2.country}</span>
                                            </div>
                                        </div>
                                        <div id="collapse5" class="collapse show" data-parent="#accordion2">
                                            <div class="card-body">
                                                <p>${movie2.content}</p>
                                                <span class="name">${movie2.duration}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse6" aria-expanded="false"
                                             aria-controls="collapse6" role="button">
                                            <div class="part-img">
                                                <img src="${movie3.imgURL}" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>${movie3.title}</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> 
                                                <span class="location"><i class="fas fa-globe">

                                                    </i>${movie3.country}</span>
                                            </div>
                                        </div>
                                        <div id="collapse6" class="collapse" data-parent="#accordion2">
                                            <div class="card-body">
                                                <p>${movie3.content}</p>
                                                <span class="name">${movie3.duration}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- event schedule end -->
                    
        <!-- contact begin -->
        <div class="contact">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-10 col-lg-10">
                        <div class="add-space section-title text-center">
                            <h2>Drop A Message</h2>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-8">
                        <div class="contact-form">
                            <form>
                                <div class="row">
                                    <div class="col-xl-6 col-lg-6">
                                        <input type="text" placeholder="Enter your name">
                                        <span></span>
                                    </div>
                                    <div class="col-xl-6 col-lg-6">
                                        <input type="email" placeholder="Enter your email">
                                        <span></span>
                                    </div>
                                    <div class="col-xl-12 col-lg-12">
                                        <input type="text" placeholder="Enter your subject">
                                        <span></span>
                                    </div>
                                    <div class="col-xl-12 col-lg-12">
                                        <textarea placeholder="Write a message"></textarea>
                                        <span class="textarea"></span>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 d-flex justify-content-center">
                                        <button>Send Us Now</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let today = new Date();
            let currentDay = today.getDay(); 
            let elements = document.querySelectorAll(".month-count");

            elements.forEach((element) => {
                let targetDay = parseInt(element.getAttribute("data-day"));
                let dayDifference = targetDay - currentDay; 
                if (dayDifference < 0) {
                    dayDifference += 7;
                }

                let newDate = new Date(today);
                newDate.setDate(today.getDate() + dayDifference);

                let formattedDate = newDate.getDate() + " " + newDate.toLocaleString("default", {month: "long"});
                element.textContent = formattedDate;
            });
        });

    </script>
</html>
