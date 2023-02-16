<%-- 
    Document   : doctor-detail-admin
    Created on : Mar 15, 2022, 9:35:11 AM
    Author     : asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Dashboard</title>
        <link href="assets/vendors/mdi/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/css/vendor.bundle.base.css" rel="stylesheet" type="text/css"/>
        <!-- End layout styles -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="css/home/animate.css">
        <link rel="stylesheet" href="css/home/owl.carousel.css">
        <link rel="stylesheet" href="css/home/owl.theme.default.min.css">
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/home/tooplate-style.css">
        <link rel="shortcut icon" href="img/favicon.ico" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/home/main.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- partial:partials/_navbar.html -->
        <%@include file="../components/navbar_dashboard.jsp" %>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!--partial:partials/_sidebar.html--> 
            <%@include file="../components/sidebar.jsp" %>
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
                        <div class="col-12 col-md-4 col-lg-4 col-xl-4 doctor-sidebar">
                            <div class="doctor-list doctor-view">
                                <div class="doctor-inner">
                                    <img class="img-fluid" alt="" src="${requestScope.Doctor.user.avatar}">
                                    <div class="doctor-details" style="background-color: #fff">
                                        <div class="doctor-info">
                                            <h4 class="doctor-name">${requestScope.Doctor.user.full_name}</h4>
                                            <p>
                                            <c:forEach items="${requestScope.DepartmentList}" var="listDe">
                                                <c:if test="${listDe.ID==requestScope.Doctor.dept_id}">
                                                    <span class="depart">${listDe.dept_name}</span>
                                                </c:if>
                                                <c:if test="${listDe.ID!=list.dept_id}">
                                                </c:if> 
                                            </c:forEach>
                                            </p>
                                        </div>
                                        <ul class="social-list">
                                            <li>
                                                <a class="facebook" href="#"><i class="fab fa-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a class="twitter" href="#"><i class="fab fa-facebook-f"></i></a>
                                            </li>
                                            <li>
                                                <a class="linkedin" href="#"><i class="fab fa-linkedin-in"></i></a>
                                            </li>
                                            <li>
                                                <a class="g-plus" href="#"><i class="fab fa-google-plus-g"></i></a>
                                            </li>
                                        </ul>
                                        <div class="book-appointment">
                                            <a href="DoctorUpdate?did=${requestScope.Doctor.id}" style="text-decoration: none">Update profile</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-8 col-lg-8 col-xl-8">
                            <div class="about-doctor">
                                <h3 class="sub-title">About the Doctor</h3>
                                <p>${requestScope.Doctor.description}</p>
                            </div>
                            <div class="experience-widget">
                                <h3 class="sub-title">Experience</h3>
                                <div class="experience-box">
                                    <ul class="experience-list">
                                        <li>
                                            <div class="timeline-content">
                                                <h4>${Doctor.exp_year}</h4>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/js/chart.js" type="text/javascript"></script>
    <script src="assets/vendors/js/chart.min.js" type="text/javascript"></script>
    <script src="assets/js/dashboard.js" type="text/javascript"></script>
    <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js" type="text/javascript"></script>
    <script src="assets/js/hoverable-collapse.js" type="text/javascript"></script>
    <script src="assets/js/misc.js" type="text/javascript"></script>
</body>
</html>