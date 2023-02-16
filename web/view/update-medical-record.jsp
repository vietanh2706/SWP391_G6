<%-- 
    Document   : update-medical-record
    Created on : Mar 19, 2022, 9:50:31 AM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Update Medical Record</title>
        <link href="assets/vendors/mdi/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/css/vendor.bundle.base.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <!-- End layout styles -->
        <link href="css/pagination/paginate.css" rel="stylesheet" type="text/css"/>
        <script src="css/pagination/paginate.js" type="text/javascript"></script>
        <link rel="shortcut icon" href="img/favicon.ico" />
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>

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
                        <div class="card">
                            <div class="row align-items-stretch no-gutters contact-wrap">
                                <div class="col-md-12">
                                    <div class="form h-100">
                                        <h1 style="text-align: center;">Update Medical Record</h1>
                                        <h3 style="margin-left: 10%; margin-bottom: 5%;">Doctor: ${sessionScope.acc.full_name}</h3>
                                        <h3 style="margin-left: 10%; margin-bottom: 5%;">Patient: ${re.getFull_name()} </h3>
                                        <h5 style="text-align: center;">Choose kind of Disease</h5>
                                        <div class="btn-group" style="margin-left: 46%; margin-bottom: 5%;">
                                            <form action="update_medical_record" method="POST">
                                                <select class="custom-select" name="select" onchange="this.form.submit()">
                                                    <c:forEach items="${type}" var="t">
                                                        <option value="${t.getId()}" ${select == t.getId()?"selected":""}>${t.getType_name()}</option>
                                                    </c:forEach> 
                                                    <option value="-1" ${select == -1?"selected":""}>Common</option>
                                                </select>
                                                <input type="hidden" name="id" value="${re.getId()}" />
                                                <input type="hidden" name="code" value="${code}" />
                                                <!--<input type="submit" value="submit" />-->
                                            </form>
                                        </div>
                                        <c:choose>
                                            <c:when test="${sessionScope.internal_id == null}">
                                                <c:if test="${select==1}">
                                                    <form class="mb-5" action="update-internal" method="POST" id="contactForm" name="contactForm">
                                                        <input type="hidden" name="id" value="${re.getId()}" />
                                                        <input type="hidden" name="select" value="${select}" />
                                                        <input type="hidden" name="code" value="${code}" />
                                                        <div class="row"> 
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="" class="col-form-label" style="font-size: 20px;">Blood_cycle</label>
                                                                <input type="text" class="form-control" name="blood" id="blood" value="${internal.blood_cycle}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="respiratory" class="col-form-label" style="font-size: 20px;">Respiratory</label>
                                                                <input type="text" class="form-control" name="respiratory" id="respiratory" value="${internal.respiratory}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="gi" class="col-form-label" style="font-size: 20px;">GI</label>
                                                                <input type="text" class="form-control" name="gi" id="gi" value="${internal.GI}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="kidneys" class="col-form-label" style="font-size: 20px;">Kidneys_unary</label>
                                                                <input type="text" class="form-control" name="kidneys" id="kidneys" value="${internal.kidneys_unary}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="musculo" class="col-form-label" style="font-size: 20px;">Musculoskeletal</label>
                                                                <input type="text" class="form-control" name="musculo" id="musculo" value="${internal.musculoskeletal}" readonly>
                                                            </div><div class="col-md-6 form-group mb-3">
                                                                <label for="logical" class="col-form-label" style="font-size: 20px;">Neurological</label>
                                                                <input type="text" class="form-control" name="logical" id="logical" value="${internal.neurological}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="psychiaric" class="col-form-label"style="font-size: 20px;">Neuropsychiaric</label>
                                                                <input type="text" class="form-control" name="psychiaric" id="psychiaric" value="${internal.neurospychiaric}" readonly>
                                                            </div>                 
                                                            <div class="col-md-12 form-group" style="text-align: center;">
                                                                <input type="button" id="show" class="btn btn-group-justified bg-gradient-info text-white" onclick="showDiv1();" value="Edit"/>
                                                                <input type="button" id="hide" class="btn btn-group-justified bg-gradient-info text-white" onclick="hideDiv1();" value="HideEdit"/>
                                                                <input type="submit" value="Submit" id="submit" class="btn btn-group-justified bg-gradient-primary text-white">
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
                                                    <form class="mb-5" action="update-eye" method="POST" id="contactForm" name="contactForm">
                                                        <input type="hidden" name="id" value="${re.getId()}" />
                                                        <input type="hidden" name="select" value="${select}" />
                                                        <input type="hidden" name="code" value="${code}" />
                                                        <div class="row"> 
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="vision" class="col-form-label" style="font-size: 20px;">Vision Test</label>
                                                                <input type="text" class="form-control" name="vision" id="vision" value="${eye.vision_test}" readonly="">
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="eye1" class="col-form-label" style="font-size: 20px;">Eye Disease</label>
                                                                <input type="text" class="form-control" name="eye1" id="eye1" value="${eye.eye_disease}" readonly="">
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="eye2" class="col-form-label" style="font-size: 20px;">Eye Type</label>
                                                                <input type="text" class="form-control" name="eye2" id="eye2" value="${eye.eye_type}" readonly="">
                                                            </div>
                                                            <div class="col-md-12 form-group" style="text-align: center;">
                                                                <input type="button" id="show" class="btn btn-group-justified bg-gradient-info text-white" onclick="showDiv2();" value="Edit"/>
                                                                <input type="button" id="hide" class="btn btn-group-justified bg-gradient-info text-white" onclick="hideDiv2();" value="HideEdit"/>
                                                                <input type="submit" value="Submit" id="submit" class="btn btn-group-justified bg-gradient-primary text-white">
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
                                                    <form class="mb-5" action="update-ent" method="POST" id="contactForm" name="contactForm">
                                                        <input type="hidden" name="id" value="${re.getId()}" />
                                                        <input type="hidden" name="select" value="${select}" />
                                                        <input type="hidden" name="code" value="${code}" />
                                                        <div class="row"> 
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="hearing" class="col-form-label" style="font-size: 20px;">Hearing Test</label>
                                                                <input type="text" class="form-control" name="hearing" id="hearing" value="${ent.hearing_test}" readonly="">
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="nose" class="col-form-label" style="font-size: 20px;">Nose Throat Test</label>
                                                                <input type="text" class="form-control" name="nose" id="nose" value="${ent.nose_throat_disease}" readonly="">
                                                            </div>
                                                            <div class="col-md-12 form-group" style="text-align: center;">
                                                                <input type="button" id="show" class="btn btn-group-justified bg-gradient-info text-white" onclick="showDiv3()" value="Edit"/>
                                                                <input type="button" id="hide" class="btn btn-group-justified bg-gradient-info text-white" onclick="hideDiv3();" value="HideEdit"/>

                                                                <input type="submit" value="Submit" id="submit" class="btn btn-group-justified bg-gradient-primary text-white">
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
                                                    <form class="mb-5" action="update-physical" method="POST" id="contactForm" name="contactForm">
                                                        <input type="hidden" name="id" value="${re.getId()}"/>
                                                        <input type="hidden" name="code" value="${code}" />
                                                        <input type="hidden" name="select" value="${select}"/>
                                                        <div class="row"> 
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="Height" class="col-form-label" style="font-size: 20px;">Hight</label>
                                                                <input type="text" class="form-control" name="Height" id="Height" value="${physical.height}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="Weight" class="col-form-label" style="font-size: 20px;">Weight</label>
                                                                <input type="text" class="form-control" name="Weight" id="Weight" value="${physical.weight}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="BMI" class="col-form-label" style="font-size: 20px;">BMI</label>
                                                                <input type="text" class="form-control" name="BMI" id="BMI" value="${physical.BMI}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="Pulse" class="col-form-label" style="font-size: 20px;">Pulse Rate</label>
                                                                <input type="text" class="form-control" name="Pulse" id="Pulse" value="${physical.pulse_rate}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="Blood" class="col-form-label" style="font-size: 20px;">Blood Pressure</label>
                                                                <input type="text" class="form-control" name="Blood" id="Blood" value="${physical.blood_pressure}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="Physical" class="col-form-label" style="font-size: 20px;">Physical Type</label>
                                                                <input type="text" class="form-control" name="Physical" id="Physical" value="${physical.physical_type}" readonly>
                                                            </div>    
                                                            <div class="col-md-12 form-group" style="text-align: center;">
                                                                <input type="button" id="show" class="btn btn-group-justified bg-gradient-info text-white" onclick="showDiv4()" value="Edit"/>
                                                                <input type="button" id="hide" class="btn btn-group-justified bg-gradient-info text-white" onclick="hideDiv4();" value="HideEdit"/>
                                                                <input type="submit" value="Submit" id="submit" class="btn btn-group-justified bg-gradient-primary text-white">
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
                                                    <form class="mb-5" action="update-maxillo" method="POST" id="contactForm" name="contactForm">
                                                        <input type="hidden" name="id" value="${re.getId()}" />
                                                        <input type="hidden" name="select" value="${select}" />
                                                        <input type="hidden" name="code" value="${code}" />
                                                        <div class="row"> 
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="upper" class="col-form-label" style="font-size: 20px;">Upper Jaw</label>
                                                                <input type="text" class="form-control" name="upper" id="upper" value="${maxillo.upper}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="lower" class="col-form-label" style="font-size: 20px;">Lower Jaw</label>
                                                                <input type="text" class="form-control" name="lower" id="lower" value="${maxillo.lower}" readonly>
                                                            </div>
                                                            <div class="col-md-6 form-group mb-3">
                                                                <label for="dental" class="col-form-label" style="font-size: 20px;">Dental Disease</label>
                                                                <input type="text" class="form-control" name="dental" id="dental" value="${maxillo.dental}" readonly>
                                                            </div>
                                                            <div class="col-md-12 form-group" style="text-align: center;">
                                                                <input type="button" id="show" class="btn btn-group-justified bg-gradient-info text-white" onclick="showDiv5()" value="Edit"/>
                                                                <input type="button" id="hide" class="btn btn-group-justified bg-gradient-info text-white" onclick="hideDiv5();" value="HideEdit"/>
                                                                <input type="submit" value="Submit" id="submit" class="btn btn-group-justified bg-gradient-primary text-white">
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
                                            <form class="mb-5" action="update-common" method="POST" id="contactForm" name="contactForm">
                                                <input type="hidden" name="id" value="${re.getId()}" />
                                                <input type="hidden" name="select" value="${select}" />
                                                <input type="hidden" name="doctor_id" value="${sessionScope.acc.id}"/>
                                                <input type="hidden" name="patient_id" value="${re.user_id}" />
                                                <input type="hidden" name="code" value="${code}" />
                                                <div class="row"> 
                                                    <div class="col-md-6 form-group mb-3">
                                                        <label for="diagnostic" class="col-form-label" style="font-size: 20px;">Diagnostic</label>
                                                        <input type="text" class="form-control" name="diagnostic" id="diagnostic" value="${mr.getDiag()}"readonly="">
                                                    </div>
                                                    <div class="col-md-6 form-group mb-3">
                                                        <label for="conclusion" class="col-form-label" style="font-size: 20px;">Conclusion</label>
                                                        <input type="text" class="form-control" name="conclusion" id="conclusion" value="${mr.getConclusion()}" readonly="">
                                                    </div>
                                                    <div class="col-md-12 form-group" style="text-align: center;">
                                                        <input type="button" id="show" class="btn btn-group-justified bg-gradient-info text-white" onclick="showDiv6()" value="Edit"/>
                                                        <input type="button" id="hide" class="btn btn-group-justified bg-gradient-info text-white" onclick="hideDiv6()" value="HideEdit"/>
                                                        <input type="submit" value="Submit" id="submit" class="btn btn-group-justified bg-gradient-primary text-white">
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
        </div>
        <script src="js/updateMR.js" type="text/javascript"></script>
        <script src="assets/vendors/js/vendor.bundle.base.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
