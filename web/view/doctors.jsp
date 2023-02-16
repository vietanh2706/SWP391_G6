<%-- 
    Document   : doctors
    Created on : Mar 3, 2022, 3:48:28 PM
    Author     : HuuTrinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctors</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="css/home/bootstrap.min.css">
        <link rel="stylesheet" href="css/home/font-awesome.min.css">
        <link rel="stylesheet" href="css/home/animate.css">
        <link rel="stylesheet" href="css/home/owl.carousel.css">
        <link rel="stylesheet" href="css/home/owl.theme.default.min.css">
        <link href="css/home/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/home/tooplate-style.css">
        <link href="css/home/main.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>
        <div class="main-content">

            <div class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title">
                                <span>Our Doctors</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="section-header text-center">
                                <h3 class="header-title">Our Physician Lists</h3>
                                <div class="line"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row doctors-list">
                        <c:forEach items="${requestScope.DoctorList}" var="list">
                            <div class="col-12 col-md-6 col-lg-4 col-xl-4">
                                <div class="doctor-list">
                                    <div class="doctor-inner">
                                        <img class="img-fluid" alt="" src="${list.user.avatar}">
                                        <div class="doctor-details">
                                            <div class="doctor-info">
                                                <h4 class="doctor-name"><a href="doctordetail?id=${list.id}">${list.user.full_name}</a></h4>
                                                <p>
                                                    <c:forEach items="${requestScope.DepartmentList}" var="listDe">
                                                        <c:if test="${listDe.ID==list.dept_id}">
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
                                            <div class="view-profie">
                                                <a href="doctordetail?id=${list.id}">Appointment</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search Medical record (search) -->
        <%@include file="../components/searchResult.jsp" %>
        <%@include file="../components/footer.jsp" %>

        <script src="js/home/jquery.js"></script>
        <script src="js/home/bootstrap.min.js"></script>
        <script src="js/home/jquery.sticky.js"></script>
        <script src="js/home/jquery.stellar.min.js"></script>
        <script src="js/home/wow.min.js"></script>
        <script src="js/home/smoothscroll.js"></script>
        <script src="js/home/owl.carousel.min.js"></script>
        <script src="js/home/custom.js"></script>
    </body>
</html>
