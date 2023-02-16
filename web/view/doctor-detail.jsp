<%-- 
    Document   : doctor-detail
    Created on : Mar 7, 2022, 5:08:20 PM
    Author     : HuuTrinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Doctor detail</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="css/home/bootstrap.min.css">
        <link rel="stylesheet" href="css/home/animate.css">
        <link rel="stylesheet" href="css/home/owl.carousel.css">
        <link rel="stylesheet" href="css/home/owl.theme.default.min.css">
        <link href="css/home/main.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/home/tooplate-style.css">
        <link href="css/medifab.css" rel="stylesheet" type="text/css"/>
        <link href="css/home/main.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <section class="preloader">
            <div class="spinner">
                <span class="spinner-rotate"></span>
            </div>
        </section>
        <!--        replace navigation bar by this tag-->
        <div id="navbar"><%@ include file="../components/navbar.jsp" %></div>
        <div class="main-content">

            <div class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title">
                                <span>${requestScope.Doctor.user.full_name}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-4 col-lg-4 col-xl-4 doctor-sidebar">
                            <div class="doctor-list doctor-view">
                                <div class="doctor-inner">
                                    <img class="img-fluid" alt="" src="${requestScope.Doctor.user.avatar}" style="max-width: 100%;">
                                    <div class="doctor-details">
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
                                            <a href="reservation">Book Appointment</a>
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


            <!-- Modal Search Medical record (search) -->
            <%@include file="../components/searchResult.jsp" %>
            <!-- FOOTER -->
            <%@include file="../components/footer.jsp" %>
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
