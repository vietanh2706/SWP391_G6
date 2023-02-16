</html><!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<html lang="en">

    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
        <link href="css/home/main.css" rel="stylesheet" type="text/css"/>

    </head>

    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->
        <section class="preloader">
            <div class="spinner">
                <span class="spinner-rotate"></span>
            </div>
        </section>
        <!--        replace navigation bar by this tag-->
        <div id="navbar"><%@ include file="../components/navbar.jsp" %></div>
        <!-- HOME -->
        <section id="home" class="slider" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row">
                    <div class="owl-carousel owl-theme">
                        <div class="item item-first">
                            <div class="caption">
                                <div class="col-md-offset-1 col-md-10">
                                    <h3>Let's make your life happier</h3>
                                    <h1>Healthy Living</h1>
                                    <!--<a href="#" class="section-btn btn btn-default btn-blue smoothScroll">See medical record</a>-->
                                    <button type="button" class="section-btn btn-default btn-blue smoothScroll" data-toggle="modal" data-target="#exampleModalCenter">
                                        See medical records
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="item item-second">
                            <div class="caption">
                                <div class="col-md-offset-1 col-md-10">
                                    <h3>We care about you</h3>
                                    <h1>A family of hospitals for your family</h1>
                                    <a href="#" class="section-btn btn btn-default btn-primary smoothScroll">Make a Examination Reservation</a>
                                </div>
                            </div>
                        </div>
                        <div class="item item-third">
                            <div class="caption">
                                <div class="col-md-offset-1 col-md-10">
                                    <h3>Always Caring. Always Here</h3>
                                    <h1>Your Health Benefits</h1>
                                    <a href="#team" class="section-btn btn btn-default btn-gray smoothScroll">Our best doctors</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- ABOUT -->
        <section id="about">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 col-sm-6">
                        <div class="about-info">
                            <h2 class="wow fadeInUp" data-wow-delay="0.6s">Welcome to General Hospital of Agricultural </h2>
                            <div class="wow fadeInUp" data-wow-delay="0.8s">
                                <p>Established in 1967, General Hospital of Agricultural today has experienced more than 50 years of development and growth. From a small infirmary built during the war, it became a General Hospital of Agricultural in Vietnam.</p>
                                <p>From the period of resistance war, the period of peace was restored and now the period of the market economy has a socialist orientation. General Hospital of Agricultural has always successfully completed its tasks in medical examination and treatment, protection, care and health promotion for staff of the Agriculture sector in particular and the people in general. </p>
                            </div>
                            <figure class="profile wow fadeInUp" data-wow-delay="1s">
                                <img src="img/mrTung.png" class="img-responsive" alt="">
                                <figcaption>
                                    <h3>Assoc. Prof. PhD M.D Hà Hữu Tùng </h3>
                                    <p>HOSPITAL DIRECTOR</p>
                                </figcaption>
                            </figure>
                        </div>
                    </div>

                </div>
            </div>
        </section>


        <!-- TEAM -->
        <section id="team" data-stellar-background-ratio="1" style="height: 673.84px">
            <div class="container">
                <div class="row">
                    <section class="section meet-doctors">
                        <div class="container" style="overflow: hidden">
                            <div class="row">
                                <div class="col-12">
                                    <div class="section-header text-center">
                                        <h3 class="header-title">Meet our Doctors</h3>
                                        <div class="line" style="background-color: #2e77fa;height: 2px;
                                             margin: 0 auto 20px;
                                             width: 60px;"></div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae risus
                                            nec dui venenatis dignissim. Aenean vitae metus in augue pretium ultrices.
                                            Duis dictum eget dolor vel blandit.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div id="our_doctor" class="mySwiper ">
                                <div class="swiper-wrapper">
                                    <c:forEach items="${requestScope.DoctorList}" var="list">
                                        <c:if test="${list.user.status==1}">
                                            <div class="swiper-slide">
                                                <div class="doctor text-center">
                                                    <a href="doctordetail?id=${list.id}">
                                                        <img src="${list.user.avatar}" alt="${list.user.full_name}" class="rounded-circle" style="border-radius: 50%" width="150" height="150">
                                                        <div class="doctors-name">${list.user.full_name}</div>
                                                        <c:forEach items="${requestScope.DepartmentList}" var="listDe">
                                                            <c:if test="${listDe.ID==list.dept_id}">
                                                                <div class="doctors-position">${listDe.dept_name}</div>
                                                            </c:if>
                                                            <c:if test="${listDe.ID!=list.dept_id}">
                                                            </c:if> 
                                                        </c:forEach>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="swiper-pagination">
                            </div>
                            <div style="text-align: center">
                                <a href="doctors" class="btn1 btn-primary1 see-all-btn1">See all Doctors</a>
                            </div>
                    </section>
                </div>
            </div>
        </section>


        <!-- SERVICES LIST -->
        <section id="news" data-stellar-background-ratio="2.5">
            <div class="container">
                <div class="row">

                    <div class="col-md-12 col-sm-12">
                        <!-- SECTION TITLE -->
                        <div class="section-title wow fadeInUp" data-wow-delay="0.1s">
                            <h2><a href="service">Common Services</a></h2>
                        </div>
                    </div>

                    <c:forEach items="${service}" var="s"> 
                        <div class="col-md-4 col-sm-6">
                            <!-- NEWS THUMB -->
                            <div class="news-thumb wow fadeInUp" data-wow-delay="0.4s">
                                <a href="#" target="_blank">
                                    <img src="${s.getImage()}" class="img-responsive" alt="">
                                </a>
                                <div class="news-info">
                                    <span>June 06, 2021</span>
                                    <h3><a href="#" target="_blank">${s.getName()}</a></h3>
                                    <p>${s.getDescription()}</p>
                                    <div class="author">
                                        <img src="img/general.jpg" class="img-responsive" alt="">
                                        <div class="author-info">
                                            <h5>${s.getDoctor_id().getFull_name()}</h5>
                                            <p>IT Department</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- NEWS -->
        <section id="news" data-stellar-background-ratio="2.5">
            <div class="container">
                <div class="row">

                    <div class="col-md-12 col-sm-12">
                        <!-- SECTION TITLE -->
                        <div class="section-title wow fadeInUp" data-wow-delay="0.1s">
                            <h2>Latest News</h2>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.NewsList}" var="n">
                        <div class="col-md-4 col-sm-6">
                            <!-- NEWS THUMB -->
                            <div class="news-thumb wow fadeInUp" data-wow-delay="0.4s">
                                <a href="${n.url}" target="_blank">
                                    <img src="${n.image}" class="img-responsive" alt="">
                                </a>
                                <div class="news-info">
                                    <span>${n.date_create}</span>
                                    <h3><a href="${n.url}" target="_blank">${n.title}</a></h3>
                                    <p>${n.description}</p>
                                    <div class="author">
                                        <img src="${n.journalist.image}" class="img-responsive" alt="">
                                        <div class="author-info">
                                            <h5>${n.journalist.name}</h5>
                                            <p>Journalist</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>


        <!-- Modal Search Medical record (search) -->
        <%@include file="../components/searchResult.jsp" %>
        <!-- FOOTER -->
        <%@include file="../components/footer.jsp" %>

        <!-- SCRIPTS -->
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
            var swiper = new Swiper(".mySwiper", {
                slidesPerView: 1,
                spaceBetween: 10,
                loop: true,
                loopFillGroupWithBlank: true,
                autoplay: {
                    delay: 3000,
                },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                breakpoints: {
                    640: {
                        slidesPerView: 3,
                        spaceBetween: 20,
                    },
                    1024: {
                        slidesPerView: 6,
                        spaceBetween: 50,
                    },
                },
            });
        </script>
        <script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.js" type="text/javascript"></script>
        <%String activeModal = (String) request.getAttribute("onload");
            if (activeModal == null) {
                activeModal = "";
            }%>
        <script type="text/javascript">
            function CancelResult() {
                $.ajax({
                    url: "home",
                    type: "get",
                    success: function (activeModal) {
                        window.location.href = "home";
                    },
                    error: function (xhr) {

                    }
                });
            }
            $(window).load(function () {
                $('#<%=activeModal%>').modal('show');
            });
        </script>
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
