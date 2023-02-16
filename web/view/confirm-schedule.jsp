<%-- 
    Document   : confirm-schedule
    Created on : Mar 18, 2022, 10:05:50 AM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!--<link rel="stylesheet" href="css/profile/profile.css">-->
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
              crossorigin="anonymous" />
        <link href="assets/vendors/mdi/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/css/vendor.bundle.base.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../components/navbar_dashboard.jsp" %>
        <div class="container-fluid page-body-wrapper">
            <!--partial:partials/_sidebar.html--> 
            <%@include file="../components/sidebar.jsp" %>
            <!-- partial -->

            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="page-header">
                        <h3 class="page-title">
                            <span class="page-title-icon text-white me-2" style="background: linear-gradient(to bottom left, #00BCB4 4%, #C4E86B 50%);">
                                <i class="mdi mdi-bookmark-outline"></i>
                            </span> Choose Time
                        </h3>
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page">
                                    <span></span>Set time for Reservation <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                                </li>
                            </ul>
                        </nav>

                    </div>
                    <div class="row">
                        <div class="container">
                            <form action="acceptreservation" method="post">
                                <div class="card table-responsive"style="padding: 10px;overflow: hidden;">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <h5>Full name</h5> 
                                                    <span>- ${requestScope.reservation.full_name}</span>
                                                    <h5>Phone</h5>
                                                    <span>- ${requestScope.reservation.phone}</span>
                                                    <h5>Insurance_code</h5>
                                                    <span>- ${requestScope.reservation.insurance_code}</span>
                                                    <h5>Date</h5>
                                                    <span>- ${requestScope.reservation.exam_date}</span>
                                                    <h5>Email</h5>
                                                    <span>- ${requestScope.reservation.email}</span>
                                                </div>	
                                                <input name="userEmail" type="hidden" value="${requestScope.reservation.email}"/>
                                                <input name="exam_date" type="hidden" value="${requestScope.reservation.exam_date}"/>
                                                <input name="reservationId" type="hidden" value="${requestScope.reservation.id}"/>
                                                <div class="col-sm-6 form-group">
                                                    <h5>Set time for reservation</h5>
                                                    <div class="d-flex">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.acc.role_id == 5 || sessionScope.acc.role_id == 1}">
                                                                <select class="form-control" style="
                                                                    color: #0198e8;
                                                                    padding: 2px;"
                                                                        name="department_time_hours"
                                                                        <c:if test="${(sessionScope.acc.role_id!=1 && sessionScope.acc.role_id!=5) && list.status!=0}">
                                                                            disabled
                                                                        </c:if>
                                                                        >
                                                                    <option style = "margin: auto; color: #000000" value="${option_minutes}">Hours</option>
                                                                    <c:forEach begin="0" end="23" varStatus="loop">
                                                                        <c:set var = "option_hours" scope = "request" value = "${loop.index}"/>
                                                                        <c:if test="${fn:length(option_hours.toString()) < 2}">
                                                                            <c:set var = "option_hours" scope = "request" value = "0${loop.index}"/>
                                                                        </c:if>
                                                                        <option style = "margin: auto" value="${option_hours}"
                                                                                <c:if test="${selected_exam_hours == option_hours}">
                                                                                    selected=""
                                                                                </c:if>>
                                                                            ${option_hours}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <b>
                                                                    <c:if test="${empty list.exam_time}">
                                                                        Not booked yet
                                                                    </c:if>
                                                                    <c:if test="${not empty list.exam_time}">
                                                                        ${list.exam_time.toString().substring(0, 5)}
                                                                    </c:if>
                                                                </b>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:if test="${sessionScope.acc.role_id == 5 || sessionScope.acc.role_id == 1}">
                                                            :
                                                        </c:if>
                                                        <c:choose>
                                                            <c:when test="${sessionScope.acc.role_id == 5 || sessionScope.acc.role_id == 1}">
                                                                <select class="form-control" style="
                                                                    color: #0198e8;
                                                                    padding: 2px;"
                                                                        name="department_time_minutes"
                                                                        <c:if test="${(sessionScope.acc.role_id!=1 && sessionScope.acc.role_id!=5) && list.status!=0}">
                                                                            disabled
                                                                        </c:if>
                                                                        >
                                                                    <option style = "margin: auto; color: #000000" value="${option_minutes}">Minutes</option>
                                                                    <c:forEach begin="0" end="23" varStatus="loop">
                                                                        <c:set var = "option_hours" scope = "request" value = "${loop.index}"/>
                                                                        <c:if test="${fn:length(option_hours.toString()) < 2}">
                                                                            <c:set var = "option_hours" scope = "request" value = "0${loop.index}"/>
                                                                        </c:if>
                                                                        <option style = "margin: auto" value="${option_hours}"
                                                                                <c:if test="${selected_exam_hours == option_hours}">
                                                                                    selected=""
                                                                                </c:if>>
                                                                            ${option_hours}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <b>
                                                                    <c:if test="${empty list.exam_time}">
                                                                        Not booked yet
                                                                    </c:if>
                                                                    <c:if test="${not empty list.exam_time}">
                                                                        ${list.exam_time.toString().substring(0, 5)}
                                                                    </c:if>
                                                                </b>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div>
                                                        <h5>Doctor</h5>
                                                        <select name="Doctor">
                                                            <c:forEach items="${requestScope.DoctorList}" var="list">
                                                                <c:if test="${list.user.status == 1}"><option value="${list.id}">${list.user.full_name}</option></c:if>
                                                                <c:if test="${list.user.status != 1}"></c:if>
                                                                
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <nav aria-label="breadcrumb">
                                                        <div class="mt-5 d-flex justify-content-center align-items-center">
                                                            <div class="card position-relative"> <span class="position-absolute search"><i class="fa fa-search"></i></span> <input type="submit" class="btn btn-group-justified bg-gradient-info text-white"name="submit" value="Comfirm"/> </div>
                                                        </div>
                                                    </nav>
                                                </div>	
                                            </div>	
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
