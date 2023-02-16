<%-- 
    Document   : dashboard
    Created on : Feb 18, 2022, 9:56:41 PM
    Author     : HaBui
--%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Purple Admin</title>
        <link href="assets/vendors/mdi/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/css/vendor.bundle.base.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <!-- End layout styles -->
        <link href="css/pagination/paginate.css" rel="stylesheet" type="text/css"/>
        <script src="css/pagination/paginate.js" type="text/javascript"></script>
        <link rel="shortcut icon" href="img/favicon.ico" />
    </head>
    <body>
        <!-- partial:partials/_navbar.html -->
        <%@include file="../components/navbar_dashboard.jsp" %>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item nav-profile">
                        <a href="#" class="nav-link">
                            <div class="nav-profile-image">
                                <img src="${sessionScope.acc.avatar}" alt="profile">
                                <span class="login-status online"></span>
                                <!--change to offline or busy as needed-->
                            </div>
                            <div class="nav-profile-text d-flex flex-column">
                                <span class="font-weight-bold mb-2">${sessionScope.acc.full_name}</span>
                                <c:if test="${sessionScope.acc.role_id==1}">
                                    <span class="text-secondary text-small">Admin</span>
                                </c:if>
                                <c:if test="${sessionScope.acc.role_id==3}">
                                    <span class="text-secondary text-small">Doctor</span>
                                </c:if>
                            </div>
                            <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard">
                            <span class="menu-title">Dashboard</span>
                            <i class="mdi mdi-home menu-icon"></i>
                        </a>
                    </li>

                    <li class="nav-item">
                        <!--Doctor list-->
                        <a class="nav-link" href="doctorlist">
                            <span class="menu-title">Doctor list</span>
                            <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <!--Apply list-->
                        <a class="nav-link" href="applylist">
                            <span class="menu-title">Apply list</span>
                            <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="border-bottom">
                            <span class="menu-title" style="font-weight: 600;color: #c3c3c3">INTERFACE</span>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
                            <span class="menu-title">Sample Pages</span>
                            <i class="menu-arrow"></i>
                            <i class="mdi mdi-medical-bag menu-icon"></i>
                        </a>
                        <div class="collapse" id="general-pages">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"> <a class="nav-link" href="signin"> Sign-in </a></li>
                                <li class="nav-item"> <a class="nav-link" href="signup"> Sign-up </a></li>
                                <li class="nav-item"> <a class="nav-link" href="components/error.jsp"> 404 </a></li>
                                <li class="nav-item"> <a class="nav-link" href="components/accessdenied.jsp"> 403 access deny </a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <div class="border-bottom">
                            <span class="menu-title" style="font-weight: 600;color: #c3c3c3">ACCOUNT</span>
                        </div>
                    </li>
                    <li class="nav-item">
                        <!--Update account-->
                        <a class="nav-link" href="profile">
                            <span class="menu-title">Update account</span>
                            <i class="mdi mdi-contacts menu-icon"></i>
                        </a>
                    </li>

                </ul>
            </nav>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="page-header">
                        <h3 class="page-title">
                            <span class="page-title-icon text-white me-2" style="background: linear-gradient(to bottom left, #00BCB4 4%, #C4E86B 50%);">
                                <i class="mdi mdi-home"></i>
                            </span> Dashboard
                        </h3>
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page">
                                    <span></span>Overview <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="col-md-3 stretch-card grid-margin">
                            <a class="card bg-gradient-danger card-img-holder text-white" href="reservation-list">
                                <div class="card-body">
                                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                    <h4 class="font-weight-normal mb-3">Reservation list <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">List</h2>
                                    <h6 class="card-text">Go</h6>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 stretch-card grid-margin">
                            <a class="card bg-gradient-info card-img-holder text-white" href="#">
                                <div class="card-body">
                                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                    <h4 class="font-weight-normal mb-3">Create Medical Record<i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">Create</h2>
                                    <h6 class="card-text">Go</h6>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 stretch-card grid-margin">
                            <a class="card bg-gradient-success card-img-holder text-white" href="#">
                                <div class="card-body">
                                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                    <h4 class="font-weight-normal mb-3">Update Medical Record<i class="mdi mdi-diamond mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">Update</h2>
                                    <h6 class="card-text">Go</h6>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 stretch-card grid-margin">
                            <a class="card bg-gradient-primary card-img-holder text-white" href="#">
                                <div class="card-body">
                                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                    <h4 class="font-weight-normal mb-3">Remove Medical Record<i class="mdi mdi-diamond mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">Remove</h2>
                                    <h6 class="card-text">Go</h6>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Patient Data table</h4>
                                    <input type="search" id="searchBox" placeholder="Filter by name...">
                                    <div class="table-responsive">
                                        <table class="table" id="dataTable">
                                            <thead>
                                                <tr>
                                                    <th> Name </th>
                                                    <th> Department ID </th>
                                                    <th> Room Number </th>
                                                    <th> Exp Year </th>
                                                    <th> Doctor ID </th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% ResultSet rslistdoctor = (ResultSet) request.getAttribute("rslistdoctor");
                                                while (rslistdoctor.next()) {                                                        
                                                        
                                                    
                                                
                                               %>
                                               <tr>
                                                   <td><img src="assets/images/faces-clipart/pic-1.png" class="me-2" alt="image"><%= rslistdoctor.getString(6) %></td>
                                                   <td><%= rslistdoctor.getInt(2) %></td>
                                                   <td><%= rslistdoctor.getInt(3) %></td>
                                                   <td><%= rslistdoctor.getString(4) %></td>
                                                   <td><%= rslistdoctor.getInt(1) %></td>
                                                    
                                                </tr>
                                               <%}%>
                                                
                                                   
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="container-fluid d-flex justify-content-between">
                            <span class="text-muted d-block text-center text-sm-start d-sm-inline-block">Copyright © bootstrapdash.com 2021</span>
                            <span class="float-none float-sm-end mt-1 mt-sm-0 text-end"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin template</a> from Bootstrapdash.com</span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <script>
            let options = {
                numberPerPage: 10,
                constNumberPerPage: 10,
                numberOfPages: 0,
                goBar: false,
                pageCounter: true,
                hasPagination: true
            };

            let filterOptions = {
                el: '#searchBox'
            };
            paginate.init("#dataTable", options, filterOptions);
        </script>
        <!-- plugins:js -->
        <script src="assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="assets/vendors/chart.js/Chart.min.js"></script>
        <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="assets/js/off-canvas.js" type="text/javascript"></script>
        <script src="assets/js/hoverable-collapse.js" type="text/javascript"></script>
        <script src="assets/js/misc.js" type="text/javascript"></script>
        <!-- endinject -->
    </body>
</html>
