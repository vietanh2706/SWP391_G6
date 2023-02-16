<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : result
    Created on : Mar 4, 2022, 9:44:55 AM
    Author     : HuuTrinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.png"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="css/home/bootstrap.min.css">
        <link rel="stylesheet" href="css/home/animate.css">
        <link rel="stylesheet" href="css/home/owl.carousel.css">
        <link rel="stylesheet" href="css/home/owl.theme.default.min.css">
        <link href="css/home/main.css" rel="stylesheet" type="text/css"/>
        <!-- MAIN CSS -->
        <link rel="stylesheet" href="css/home/tooplate-style.css">
        <link href="css/home/main.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../components/navbar.jsp" %>
        <section class="section" style=" background-image: url('img/result.jpg'); background-repeat: no-repeat;background-size: 100%">
            <div class="container" style="max-width: 800px; background: rgba(255,255,255,0.9); padding: 30px">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="section-header text-center card-title">
                            <h3 class="header-title">Medical record</h3>
                            <span>Final result</span>
                            <div class="line" style="background-color: #2e77fa;height: 2px;
                                 margin: 0 auto 20px;
                                 width: 60px;"></div>
                        </div>
                        <h4>Patient information</h4>
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group">
                                    <i class="fa-solid fa-file-signature"></i>
                                    <label>Patient name: </label>
                                    <span class="card-text">${requestScope.reservations.full_name}</span>
                                </div>
<!--                                <div class="form-group">
                                    <i class="fa-solid fa-house-user"></i>
                                    <label>Address: </label>
                                    <span class="card-text">${requestScope.patient.address}</span>
                                </div>-->
                                <div class="form-group">
                                    <i class="fa-solid fa-phone"></i>
                                    <label>Phone: </label>
                                    <span class="card-text">${requestScope.reservations.phone}</span>
                                </div>
                                <div class="form-group">
                                    <i class="fa-solid fa-address-card"></i>
                                    <label>Insurance-code:  </label>
                                    <c:if test="${requestScope.reservations.insurance_code != ''}">
                                        <span class="card-text">${requestScope.reservations.insurance_code}</span>
                                    </c:if>
                                    <c:if test="${requestScope.reservations.insurance_code == ''}">
                                        <span class="card-text">Non-insurance</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <h4>Medical information</h4>
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group">
                                    <i class="fa-solid fa-file-signature"></i>
                                    <label>Diagnostic:  </label>
                                    <span class="card-text">${requestScope.mr.diag}</span>
                                </div>
                                <div class="form-group">
                                    <i class="fa-solid fa-house-user"></i>
                                    <label>Conclusion: </label>
                                    <span class="card-text">${requestScope.mr.conclusion}</span>
                                </div>
                                <div class="form-group">
                                    <i class="fa-solid fa-circle-info"></i>
                                    <label>Result detail: </label>
                                    <a href="OptionView" class="card-text" style="color: #2e77fa">See detail record</a>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="card-end">
                            <div class="signature">
                                <label>Signature Doctor:  </label>
                                <span class="card-text">${requestScope.u.full_name}</span>
                            </div>
                            <div class="signature">
                                <label>Date:  </label>
                                <span class="card-text">${requestScope.reservations.created_date}</span>
                            </div>


                        </div>
                    </div>
                </div>

            </div>
        </section>
        <%@include file="../components/footer.jsp" %>
    </body>
</html>
