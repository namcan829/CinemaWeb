<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Cinema</title>
    </head>
    <nav>
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-xl-4 col-lg-4 d-xl-flex d-lg-flex align-items-center">
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-6 d-xl-block d-lg-block d-flex align-items-center">
                                <div class="logo">
                                    <a href="#"><img src="assets/img/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="d-xl-none d-lg-none d-block col-6">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                    <i class="fas fa-bars"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-8">
                        <div class="mainmenu">
                            <nav class="navbar navbar-expand-lg">
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item">
                                            <a class="nav-link" href="homepage">Homepage <span class="sr-only">(current)</span></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="movie">Movies</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="booking">Book Tickets</a>
                                        </li>
                                        <c:if test="${not empty sessionScope.user}">
                                            <c:if test="${sessionScope.user.roleId == 1}">
                                                <li class="nav-item"><a class="nav-link" href="dashboard">Dashboard</a></li>
                                                </c:if>

                                            <li class="nav-item"><a class="nav-link" href="profile">Profile: ${sessionScope.user.fullName}</a></li>
                                            <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
                                            </c:if>

                                        <c:if test="${empty sessionScope.user}">
                                            <li class="nav-item"><a class="nav-link" href="login">Login</a></li>
                                            <li class="nav-item"><a class="nav-link" href="register">Register</a></li>
                                            </c:if>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</html>
