<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Reservation</title>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="shortcut icon" type="image/png" href="../img/iconlogo.png"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="css/home/bootstrap.min.css">
        <link rel="stylesheet" href="css/home/font-awesome.min.css">
        <link rel="stylesheet" href="css/home/animate.css">
        <link rel="stylesheet" href="css/home/owl.carousel.css">
        <link rel="stylesheet" href="css/home/owl.theme.default.min.css">

        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/home/tooplate-style.css">


    </head>
    <body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">

        <!-- PRE LOADER -->
        <section class="preloader">
            <div class="spinner">

                <span class="spinner-rotate"></span>

            </div>
        </section>



        <div id="navbar"><%@ include file="../components/navbar.jsp" %></div>



        <!-- MAKE AN APPOINTMENT -->
        <section id="appointment" data-stellar-background-ratio="3">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 col-sm-6">
                        <img src="img/appointment-image.jpg" class="img-responsive" alt="img"/>
                    </div>

                    <div class="col-md-6 col-sm-6">
                        <!-- CONTACT FORM HERE -->
                        <form id="appointment__form" role="form" method="POST" action="reservation" >
                            <!-- SECTION TITLE -->
                            <div class="section-title wow fadeInUp" data-wow-delay="0.4s">
                                <h2>Make an appointment</h2>
                                <p class="desc">Please fill out the form below to register for the required medical examination</p>
                            </div>
                            <c:if test='${requestScope.mess!=null}'>
                                <div class="bg-danger wow fadeInUp" style="padding: 20px" data-wow-delay="0.8s">${requestScope.mess}</div>
                            </c:if>
                            <div class="wow fadeInUp" data-wow-delay="0.8s">
                                <div class="col-md-6 col-sm-6">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" required>

                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" required="">

                                    <label for="date">Select Date</label>
                                    <input type="date" name="date" value="" class="form-control" required="">

                                    <label for="icode">Insurance Code</label>
                                    <input type="tel" class="form-control" id="icode" name="icode" placeholder="Insurance code"  required="">

                                </div>

                                <div class="col-md-6 col-sm-6 ">
                                    <label for="date">Birthday</label>
                                    <input type="date" name="dob" value="" class="form-control" required="">
                                    <label for="gender">Gender</label>
                                    <div class="checkbox__gender " style="height: 45px;margin-bottom: 15px;display: flex;padding: 6px 0;align-items: center;">
                                        <input type="radio" name="gender" value="Male" />Male
                                        <input type="radio" name="gender" value="Female" style="margin-left: 50px;"/>Female
                                    </div>
                                    <label for="telephone">Phone Number</label>
                                    <input type="tel" class="form-control" id="telephone" name="phone" placeholder="Phone" required="">

                                </div>
                                <div class="col-md-12 col-sm-12" >
                                    <label for="Message">Additional Message</label>
                                    <textarea style="resize: none;" class="form-control" rows="5" id="message" name="message" placeholder="Message"></textarea>
                                    <!--                                    <label for="select">Select Type of Disease</label>
                                                                        <select class="form-control" name="type">
                                                                            <option value="">Select Type of Disease?</option>
                                    <c:forEach items="${listType}" var="type">
                                        <option value="${type.id},${type.type_name}">${type.type_name}</option>
                                    </c:forEach>
                                </select>-->
                                    <label for="select">Select Type of Disease</label>
                                    <div class="form-control typeOfD">
                                        <c:forEach items="${listType}" var="type">
                                            <div class="checkbox_inner">
                                                <input type="checkbox" value="${type.id},${type.type_name}" name="type" />
                                                <span>${type.type_name}</span>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <button type="submit" class="form-control btn-success" id="cf-submit" name="submit">Submit Button</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <%@ include file="../components/footer.jsp" %>
        <!-- Modal Search Medical record (search) -->
        <%@include file="../components/searchResult.jsp" %>
        <!-- SCRIPTS -->
        <script src="js/home/jquery.js"></script>
        <script src="js/home/bootstrap.min.js"></script>
        <script src="js/home/jquery.sticky.js"></script>
        <script src="js/home/jquery.stellar.min.js"></script>
        <script src="js/home/wow.min.js"></script>
        <script src="js/home/smoothscroll.js"></script>
        <script src="js/home/owl.carousel.min.js"></script>
        <script src="js/home/custom.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>


    </body>
</html>