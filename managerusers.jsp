<%-- 
    Document   : managerusers
    Created on : Mar 22, 2025, 10:14:58 AM
    Author     : NgoQuan
--%>

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
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="navbar_headerdash.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <%@include file="navbar_dashboard.jsp" %>

                <main>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Bảng thống kê người dùng
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Full Name</th>
                                        <th>Gender</th>
                                        <th>Birthdate</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th>Created At</th>
                                        <th>Created By</th>
                                        <th>Updated By</th>
                                        <th>Updated At</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="u" items="${listUsers}" varStatus="st">
                                        <tr>
                                            <td>${st.index + 1}</td>
                                            <td>${u.username}</td>
                                            <td>${u.email}</td>
                                            <td>${u.fullName}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${u.gender == 1}">Nam</c:when>
                                                    <c:when test="${u.gender == 2}">Nữ</c:when>
                                                    <c:otherwise>Khác</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                ${u.birthdate}
                                            </td>
                                            <td>${u.phone}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${u.roleId == 1}">Admin</c:when>
                                                    <c:when test="${u.roleId == 2}">User</c:when>
                                                    <c:otherwise>Khách</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                ${u.createdAt}
                                            </td>
                                            <td>${u.createdBy}</td>
                                            <td>${u.updatedBy}</td>
                                            <td>
                                                ${u.updatedAt}
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${u.statusId == 1}">Hoạt động</c:when>
                                                    <c:when test="${u.statusId == 0}">Bị khóa</c:when>
                                                    <c:otherwise>Không xác định</c:otherwise>
                                                </c:choose>
                                            </td>
                                            
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>                                    
                </main>
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
