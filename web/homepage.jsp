<%-- 
    Document   : homepage
    Created on : Mar 18, 2025, 9:09:23 AM
    Author     : NgoQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cinema Web Pro</title>
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

        <%@include file="header.jsp" %>

        <!-- banner begin -->
        <div class="banner">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="banner-content">
                            <h1>Cinema</h1>
                            <h4>Experience and responsibility</h4>
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
                            <h2>Event Schedules</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-3 col-lg-3">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
                               aria-controls="v-pills-home" aria-selected="true">Monday<span class="month-count">14 Feburary</span></a>
                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
                               aria-controls="v-pills-profile" aria-selected="false">Tuesday<span class="month-count">15 Feburary</span></a>
                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
                               aria-controls="v-pills-messages" aria-selected="false">Wednesday<span class="month-count">16 Feburary</span></a>
                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab"
                               aria-controls="v-pills-settings" aria-selected="false">Thursday<span class="month-count">17 Feburary</span></a>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9">
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">

                                <div id="accordion">
                                    <div class="card">
                                        <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" role="button">
                                            <div class="part-img">
                                                <img src="imge/aquaman.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>Web Design Principles and Best Prectics</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>

                                        <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-2.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>15 Free Productive Design Tools</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-3.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>Getting Start With Sketch App</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>
                                        <div id="collapseThree" class="collapse" data-parent="#accordion">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
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
                                                <img src="assets/img/gallery-1.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>Web Design Principles and Best Prectics</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>

                                        <div id="collapse4" class="collapse" data-parent="#accordion2">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" data-toggle="collapse" data-target="#collapse5" aria-expanded="true"
                                             aria-controls="collapse5" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-2.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>15 Free Productive Design Tools</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>
                                        <div id="collapse5" class="collapse show" data-parent="#accordion2">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse6" aria-expanded="false"
                                             aria-controls="collapse6" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-3.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>Getting Start With Sketch App</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>
                                        <div id="collapse6" class="collapse" data-parent="#accordion2">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                                <div id="accordion3">
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse7" aria-expanded="false"
                                             aria-controls="collapse7" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-1.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>Web Design Principles and Best Prectics</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>

                                        <div id="collapse7" class="collapse" data-parent="#accordion3">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse8" aria-expanded="false"
                                             aria-controls="collapse8" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-2.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>15 Free Productive Design Tools</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>
                                        <div id="collapse8" class="collapse" data-parent="#accordion3">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" data-toggle="collapse" data-target="#collapse9" aria-expanded="true"
                                             aria-controls="collapse9" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-3.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>Getting Start With Sketch App</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>
                                        <div id="collapse9" class="collapse show" data-parent="#accordion3">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">

                                <div id="accordion4">
                                    <div class="card">
                                        <div class="card-header" data-toggle="collapse" data-target="#collapse10" aria-expanded="true"
                                             aria-controls="collapse10" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-1.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>Web Design Principles and Best Prectics</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>

                                        <div id="collapse10" class="collapse show" data-parent="#accordion4">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse11" aria-expanded="false"
                                             aria-controls="collapse11" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-2.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>15 Free Productive Design Tools</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>
                                        <div id="collapse11" class="collapse" data-parent="#accordion4">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header collapsed" data-toggle="collapse" data-target="#collapse12" aria-expanded="false"
                                             aria-controls="collapse12" role="button">
                                            <div class="part-img">
                                                <img src="assets/img/gallery-3.jpg" alt="">
                                            </div>
                                            <div class="part-text">
                                                <h3>Getting Start With Sketch App</h3>
                                                <span class="time"><i class="fas fa-clock"></i> 10am - 12:30pm</span> <span class="location"><i class="fas fa-globe"></i> Location: Hall 1, Golden Road, Sylhet.BD</span>
                                            </div>
                                        </div>
                                        <div id="collapse12" class="collapse" data-parent="#accordion4">
                                            <div class="card-body">
                                                <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg diam in posuere
                                                    phasellus eget sem just the consequat gestass facilisis eleifend tempor metus.
                                                    Phasellus vehicula justo egeted diames posuere sollicitu tincidunt nulla.</p>
                                                <span class="name">Alison Burgass</span>
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

        <!-- team dj begin -->
        <div class="team-dj">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-8">
                        <div class="add-space section-title text-center">
                            <h2>Top DJs</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-12 col-lg-12">
                        <div class="dj-slider">
                            <div class="single-dj">
                                <div class="part-img">
                                    <img src="assets/img/dj-1.jpg" alt="">
                                    <div class="hover-effect">
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="single-dj">
                                <div class="part-img">
                                    <img src="assets/img/dj-2.jpg" alt="">
                                    <div class="hover-effect">
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="single-dj">
                                <div class="part-img">
                                    <img src="assets/img/dj-3.jpg" alt="">
                                    <div class="hover-effect">
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- team dj end -->

        <!-- blog begin -->
        <div class="blog">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-8">
                        <div class="add-space section-title text-center">
                            <h2>On The Blogs</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-12 col-lg-12">
                        <div class="single-blog">
                            <div class="row">
                                <div class="col-xl-6 col-lg-6">
                                    <div class="part-img">
                                        <img src="assets/img/blog-1.jpg" alt="">
                                        <div class="date-on-img">
                                            <span class="date">04 may</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 d-xl-flex d-lg-flex align-items-center">
                                    <div class="part-text">
                                        <h3>Web Design Principles and Best Prectics</h3>
                                        <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg
                                            diam in posuere phasellus eget sem just the consequat gestass
                                            facilisis eleifend tempor metus. Phasellus vehicula justo egeted
                                            diames posuere.</p>
                                        <p class="last-line">Phasellus vehicula the justo eg
                                            diam in posuere.<a href="blog-details.html">Read More!</a></p>
                                        <span class="poster">Rex Rifat</span>
                                        <span class="date">20.02.2019 Sunday, 10:30am</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12 col-lg-12">
                        <div class="single-blog">
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 d-xl-flex d-lg-flex align-items-center">
                                    <div class="part-text">
                                        <h3>15 Free Productive Design Tools</h3>
                                        <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg
                                            diam in posuere phasellus eget sem just the consequat gestass
                                            facilisis eleifend tempor metus. Phasellus vehicula justo egeted
                                            diames posuere.</p>
                                        <p>Phasellus vehicula the justo eg
                                            diam in posuere.<a href="blog-details.html">Read More!</a></p>
                                        <span class="poster">Abu Ubaidah</span>
                                        <span class="date">20.02.2019 Sunday, 10:30am</span>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 order-xl-last order-lg-last order-first">
                                    <div class="part-img">
                                        <img src="assets/img/blog-2.jpg" alt="">
                                        <div class="date-on-img">
                                            <span class="date">04 may</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12 col-lg-12">
                        <div class="single-blog">
                            <div class="row">
                                <div class="col-xl-6 col-lg-6">
                                    <div class="part-img">
                                        <img src="assets/img/blog-3.jpg" alt="">
                                        <div class="date-on-img">
                                            <span class="date">04 may</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 d-xl-flex d-lg-flex align-items-center">
                                    <div class="part-text">
                                        <h3>Getting Start With Sketch App</h3>
                                        <p>Garcia, a versatil web designer. Phasellus vehicula the justo eg
                                            diam in posuere phasellus eget sem just the consequat gestass
                                            facilisis eleifend tempor metus. Phasellus vehicula justo egeted
                                            diames posuere.</p>
                                        <p>Phasellus vehicula the justo eg
                                            diam in posuere.<a href="blog-details.html">Read More!</a></p>
                                        <span class="poster">Abir Khan</span>
                                        <span class="date">20.02.2019 Sunday, 10:30am</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- blog end -->

        <!-- testimonial begin -->
        <div class="testimonial">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-8">
                        <div class="section-title text-center">
                            <h2>Testimonials</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-12 col-lg-12">
                        <div class="testimonial-slider">
                            <div class="single-testimonial">
                                <div class="row no-gutters">
                                    <div class="col-xl-4 col-lg-4 col-sm-4 col-md-12 col-12">
                                        <div class="part-img"></div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8 col-sm-8 col-md-12 col-12">
                                        <div class="part-text">
                                            <div class="bio">
                                                <span class="name">Alison Burgas</span>
                                                <span class="position">CEO @google</span>
                                            </div>
                                            <div class="social">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                                <a href="#"><i class="fab fa-youtube"></i></a>
                                            </div>
                                            <div class="text">
                                                <p>Phasellus vehicula the justo egdiam
                                                    posu phase eget sem just the
                                                    consequat gesta facilisis eleifend
                                                    tempor metus. Phasellus vehicula is
                                                    diames posuere sollicitu.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="single-testimonial">
                                <div class="row no-gutters">
                                    <div class="col-xl-4 col-lg-4 col-sm-4 col-md-12 col-12">
                                        <div class="part-img two"></div>
                                    </div>
                                    <div class="col-xl-8 col-lg-8 col-sm-8 col-md-12 col-12">
                                        <div class="part-text">
                                            <div class="bio">
                                                <span class="name">Abu Ubaidah</span>
                                                <span class="position">CEO @google</span>
                                            </div>
                                            <div class="social">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                                <a href="#"><i class="fab fa-instagram"></i></a>
                                                <a href="#"><i class="fab fa-youtube"></i></a>
                                            </div>
                                            <div class="text">
                                                <p>Phasellus vehicula the justo egdiam
                                                    posu phase eget sem just the
                                                    consequat gesta facilisis eleifend
                                                    tempor metus. Phasellus vehicula is
                                                    diames posuere sollicitu.</p>
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
        <!-- testimonial end -->

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
