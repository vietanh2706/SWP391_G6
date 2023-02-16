<%-- 
    Document   : create-medical-record
    Created on : Mar 3, 2022, 11:46:23 PM
    Author     : Duc Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,700,900&display=swap" rel="stylesheet">
        <link href="assets/vendors/mdi/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/css/vendor.bundle.base.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="fonts/icomoon/style.css">


        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css_ducanh/bootstrap.min.css">

        <!-- Style -->
        <link rel="stylesheet" href="css_ducanh/style.css">

        <title>Form Create Medical</title>
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
                    <div class="container card"style="margin-top: 40px">
                        <div class="row align-items-stretch no-gutters contact-wrap">
                            <div class="col-md-12">
                                <div class="form h-100">
                                    <h1 style="text-align: center;">Create Medical Record</h1>
                                    <h3 style="margin-left: 10%; margin-bottom: 5%;">Doctor: ${sessionScope.acc.full_name}</h3>
                                    <h3 style="margin-left: 10%; margin-bottom: 5%;">Patient: ${re.getFull_name()} </h3>
                                    <h5 style="text-align: center;">Choose kind of Disease</h5>

                                    <div class="btn-group" style="margin-left: 46%; margin-bottom: 5%;">
                                        <form action="create_medical_record" method="POST">

                                            <select class="custom-select" name="select" onchange="this.form.submit()">
                                                <c:forEach items="${type}" var="t">
                                                    <option value="${t.getId()}" ${select == t.getId()?"selected":""}>${t.getType_name()}</option>
                                                </c:forEach> 
                                                <option value="-1" ${select == -1?"selected":""}>Common</option>
                                            </select>
                                            <input type="hidden" name="id" value="${re.getId()}" />
                                            <!--<input type="submit" value="submit" />-->
                                        </form>
                                    </div>
                                    <c:choose>
                                        <c:when test="${sessionScope.internal_id == null}">
                                            <c:if test="${select==1}">
                                                <form class="mb-5" action="internal_medical" method="POST" id="contactForm" name="contactForm">
                                                    <input type="hidden" name="id" value="${re.getId()}" />
                                                    <input type="hidden" name="select" value="${select}" />
                                                    <div class="row"> 
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Blood_cycle</label>
                                                            <input type="text" class="form-control" name="blood" id="name">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Respiratory</label>
                                                            <input type="text" class="form-control" name="respiratory" id="name">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">GI</label>
                                                            <input type="text" class="form-control" name="gi" id="name">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Kidneys_unary</label>
                                                            <input type="text" class="form-control" name="kidneys" id="name">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Musculoskeletal</label>
                                                            <input type="text" class="form-control" name="musculo" id="name">
                                                        </div><div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Neurological</label>
                                                            <input type="text" class="form-control" name="logical" id="name">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label"style="font-size: 20px;">Neuropsychiaric</label>
                                                            <input type="text" class="form-control" name="psychiaric" id="name">
                                                        </div>                 
                                                        <div class="col-md-12 form-group" style="text-align: center;">
                                                            <input type="submit" value="Submit" class="btn btn-primary rounded-0 py-2 px-4">
                                                            <span class="submitting"></span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${select==1}"><p>You have already insert</p></c:if>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${sessionScope.eye_id == null}">
                                            <c:if test="${select==2}">
                                                <form class="mb-5" action="eye_medical" method="POST" id="contactForm" name="contactForm">
                                                    <input type="hidden" name="id" value="${re.getId()}" />
                                                    <input type="hidden" name="select" value="${select}" />
                                                    <div class="row"> 
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Vision Test</label>
                                                            <input type="text" class="form-control" name="vision" id="vision">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Eye Disease</label>
                                                            <input type="text" class="form-control" name="eye1" id="eye1">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Eye Type</label>
                                                            <input type="text" class="form-control" name="eye2" id="eye2">
                                                        </div>
                                                        <div class="col-md-12 form-group" style="text-align: center;">
                                                            <input type="submit" value="Submit" class="btn btn-primary rounded-0 py-2 px-4">
                                                            <span class="submitting"></span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${select==2}"><p>You have already insert</p></c:if>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${sessionScope.ent_id == null}">
                                            <c:if test="${select==3}">
                                                <form class="mb-5" action="ENT_medical" method="POST" id="contactForm" name="contactForm">
                                                    <input type="hidden" name="id" value="${re.getId()}" />
                                                    <input type="hidden" name="select" value="${select}" />
                                                    <div class="row"> 
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Hearing Test</label>
                                                            <input type="text" class="form-control" name="hearing" id="name">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Nose Throat Test</label>
                                                            <input type="text" class="form-control" name="nose" id="name">
                                                        </div>
                                                        <div class="col-md-12 form-group" style="text-align: center;">
                                                            <input type="submit" value="Submit" class="btn btn-primary rounded-0 py-2 px-4">
                                                            <span class="submitting"></span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${select==3}"><p>You have already insert</p></c:if>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${sessionScope.physical_id == null}">
                                            <c:if test="${select==4}">
                                                <form class="mb-5" action="Physical_medical" method="POST" id="contactForm" name="contactForm">
                                                    <input type="hidden" name="id" value="${re.getId()}"/>
                                                    <input type="hidden" name="select" value="${select}"/>
                                                    <div class="row"> 
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Hight</label>
                                                            <input type="text" class="form-control" name="Height" id="Height">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Weight</label>
                                                            <input type="text" class="form-control" name="Weight" id="Weight">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">BMI</label>
                                                            <input type="text" class="form-control" name="BMI" id="BMI">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Pulse Rate</label>
                                                            <input type="text" class="form-control" name="Pulse" id="Pulse">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Blood Pressure</label>
                                                            <input type="text" class="form-control" name="Blood" id="Blood">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Physical Type</label>
                                                            <input type="text" class="form-control" name="Physical" id="Physical">
                                                        </div>    
                                                        <div class="col-md-12 form-group" style="text-align: center;">
                                                            <input type="submit" value="Submit" class="btn btn-primary rounded-0 py-2 px-4">
                                                            <span class="submitting"></span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${select==4}"><p>You have already insert</p></c:if>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${sessionScope.maxi_id == null}">
                                            <c:if test="${select==5}">
                                                <form class="mb-5" action="maxillofacial_medical" method="POST" id="contactForm" name="contactForm">
                                                    <input type="hidden" name="id" value="${re.getId()}" />
                                                    <input type="hidden" name="select" value="${select}" />
                                                    <div class="row"> 
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Upper Jaw</label>
                                                            <input type="text" class="form-control" name="upper" id="upper">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Lower Jaw</label>
                                                            <input type="text" class="form-control" name="lower" id="lower">
                                                        </div>
                                                        <div class="col-md-6 form-group mb-3">
                                                            <label for="" class="col-form-label" style="font-size: 20px;">Dental Disease</label>
                                                            <input type="text" class="form-control" name="dental" id="dental">
                                                        </div>
                                                        <div class="col-md-12 form-group" style="text-align: center;">
                                                            <input type="submit" value="Submit" class="btn btn-primary rounded-0 py-2 px-4">
                                                            <span class="submitting"></span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if> 
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${select==5}"><p>You have already insert</p></c:if>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:if test="${select==-1}">
                                        <form class="mb-5" action="Common" method="POST" id="contactForm" name="contactForm">
                                            <input type="hidden" name="id" value="${re.getId()}" />
                                            <input type="hidden" name="select" value="${select}" />
                                            <input type="hidden" name="doctor_id" value="${sessionScope.acc.id}"/>
                                            <input type="hidden" name="patient_id" value="${re.user_id}" />          
                                            <div class="row"> 
                                                <div class="col-md-6 form-group mb-3">
                                                    <label for="" class="col-form-label" style="font-size: 20px;">Diagnostic</label>
                                                    <input type="text" class="form-control" name="diagnostic" id="diagnostic">
                                                </div>
                                                <div class="col-md-6 form-group mb-3">
                                                    <label for="" class="col-form-label" style="font-size: 20px;">Conclusion</label>
                                                    <input type="text" class="form-control" name="conclusion" id="conclusion">
                                                </div>
                                                <div class="col-md-12 form-group" style="text-align: center;">
                                                    <input type="submit" value="Submit" class="btn btn-primary rounded-0 py-2 px-4">
                                                    <span class="submitting"></span>
                                                </div>
                                            </div>
                                        </form>
                                    </c:if>
                                    <div id="form-message-warning mt-4"></div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/vendors/js/vendor.bundle.base.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/main.js"></script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

