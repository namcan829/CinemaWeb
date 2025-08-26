
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="assets/css/login.css"/>
    </head>
    <body>
        <div class="container register-container">
            <div class="form">
                <form action="register" method="post">
                    <h2>Register</h2>
                    <div class="register-form-grid">
                        <div class="inputBox">
                            <input type="text" name="username" placeholder="Username" required>
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="inputBox">
                            <input type="password" name="password" placeholder="Password" required>
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="inputBox">
                            <input type="text" name="fullName" placeholder="Full Name" required>
                            <i class="fas fa-user-alt"></i>
                        </div>
                        <div class="inputBox">
                            <input type="email" name="email" placeholder="Email" required>
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div class="inputBox">
                            <input type="text" name="phone" placeholder="Phone" required>
                            <i class="fas fa-phone"></i>
                        </div>
                        <div class="inputBox">
                            <input type="text" id="birthday" name="birthdate" required onfocus="(this.type = 'date')" onblur="if (!this.value) this.type = 'text'" placeholder="Birthday">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <div class="register-gender-box">
                            <span>Gender:</span>
                            <div>
                                <label><input type="radio" name="gender" value="1" checked required> Male</label>
                                <label><input type="radio" name="gender" value="2"> Female</label>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn">Register</button>
                    <c:if test="${not empty error}">
                        <h3 style="color: red">${error}</h3>
                    </c:if>
                    <div class="register-link">
                        <p>Already have an account? <a href="login">Login</a></p>
                    </div>
                </form>
            </div>
        </div>
        <!-- jQuery -->
        <script src="assets/js/jquery.js"></script>
        <!-- Bootstrap -->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- Owl Carousel -->
        <script src="assets/js/owl.carousel.js"></script>
        <!-- Magnific Popup -->
        <script src="assets/js/jquery.magnific-popup.js"></script>
        <!-- Waypoints -->
        <script src="assets/js/waypoints.min.js"></script>
        <!-- WOW.js -->
        <script src="assets/js/wow.min.js"></script>
        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
    </body>
</html>
