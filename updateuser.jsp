<%-- 
    Document   : updatemovies
    Created on : Mar 22, 2025, 9:33:53 PM
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
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="sb-nav-fixed">
        <%@include file="navbar_headerdash.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <%@include file="navbar_dashboard.jsp" %>

                <main>
                    <div class="container">
                        <h4 class="fw-bold alert alert-dark p-2 text-center mt-3">
                            Cập Nhật Thông Tin Người Dùng
                        </h4>
                        <div class="row m-auto">
                            <div class="p-4 bg-white rounded-3 border shadow-sm">
                                <form id="userInfoForm" action="update-user" method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <!-- Fullname -->
                                        <div class="mb-3 col-md-6">
                                            <label for="fullname" class="form-label fw-bold">
                                                <i class="bi bi-person-fill"></i> Họ và Tên
                                            </label>
                                            <input type="text" class="form-control" id="fullname" name="fullname" value="${p.getFullname()}" required />
                                        </div>

                                        <!-- Email -->
                                        <div class="mb-3 col-md-6">
                                            <label for="email" class="form-label fw-bold">
                                                <i class="bi bi-envelope-fill"></i> Email
                                            </label>
                                            <input type="email" class="form-control" id="email" name="email" value="${p.getEmail()}" required />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- Phone Number -->
                                        <div class="mb-3 col-md-6">
                                            <label for="phone" class="form-label fw-bold">
                                                <i class="bi bi-telephone-fill"></i> Số Điện Thoại
                                            </label>
                                            <input type="text" class="form-control" id="phone" name="phone" value="${p.getPhone()}" required />
                                        </div>

                                        <!-- Birthday -->
                                        <div class="mb-3 col-md-6">
                                            <label for="birthday" class="form-label fw-bold">
                                                <i class="bi bi-calendar-event-fill"></i> Ngày Sinh
                                            </label>
                                            <input type="date" class="form-control" id="birthday" name="birthday" value="${p.getBirthday()}" required />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- Gender -->
                                        <div class="mb-3 col-md-6">
                                            <div style="margin-bottom: 10px">
                                                <label class="form-label fw-bold">
                                                    <i class="bi bi-gender-ambiguous"></i> Giới Tính: 
                                                </label>
                                                <input style="margin-left: 10px;" type="radio" id="male" name="gender" value="male" ${p.getGender() == 'male' ? 'checked' : ''} /> Nam
                                                <input style="margin-left: 10px;" type="radio" id="female" name="gender" value="female" ${p.getGender() == 'female' ? 'checked' : ''} /> Nữ

                                            </div>
                                            <div style="margin-bottom: 10px">
                                                <label class="form-label fw-bold" style="">
                                                    <i class="fa-solid fa-shield-halved"></i>   Trạng thái: 
                                                </label>
                                                <input style="margin-left: 10px;" type="radio" id="male" name="gender" value="male" ${p.getGender() == 'male' ? 'checked' : ''} /> Hoạt động
                                                <input style="margin-left: 10px;" type="radio" id="female" name="gender" value="female" ${p.getGender() == 'female' ? 'checked' : ''} /> Không hoạt động

                                            </div>
                                        </div>

                                        <!-- Profile Image -->
                                        <div class="mb-3 col-md-6">
                                            <label for="profileImage" class="form-label fw-bold">
                                                <i class="bi bi-image"></i> Ảnh Đại Diện
                                            </label>
                                            <div class="d-flex align-items-center">
                                                <img src="${p.getImage()}" alt="" style="width: 100px; height: 100px; object-fit: cover; margin-right: 10px;" />
                                                <input type="file" class="form-control" name="profileImage" id="profileImage" />
                                            </div>
                                        </div>
                                    </div>

                                    <input type="hidden" name="userId" value="${p.getUserId()}" />

                                    <input type="submit" value="Submit">
                                </form>
                            </div>
                        </div>
                    </div>
                </main>

                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/shipper.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/chart-area-demo.js"></script>
        <script src="assets/js/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="assets/js/datatables-simple-demo.js"></script>
    </body>
</html>
