<%-- 
    Document   : show_list_create.jsp
    Created on : Mar 19, 2022, 10:16:49 AM
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
                            <div class="table-responsive">
                                <table class="table table-responsive table-borderless"id="dataTable">
                                    <thead>
                                        <tr class="bg-light">
                                            <th scope="col" width="3%">ID</th>
                                            <th scope="col" width="15%">Doctor</th>
                                            <th scope="col" width="15%">Patient</th>
                                            <th scope="col" width="20%">Diagnostic</th>
                                            <th scope="col" width="15%">Conclusion</th>
                                            <th scope="col" width="5%">Code</th>
                                            <th scope="col" class="text-end" width="10%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listMR}" var="list">
                                            <tr>
                                                <th scope="row"width="3%">${list.id}</th>
                                                    <c:forEach items="${requestScope.Doctor}" var="doctor">
                                                        <c:if test="${list.doctor_id==doctor.id}">
                                                        <td width="15%">${doctor.full_name}</td>
                                                    </c:if>
                                                    <c:if test="${list.doctor_id!=doctor.id}">
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${requestScope.patient}" var="Patient">
                                                    <c:if test="${list.reservation_id==Patient.id}">
                                                        <td width="15%">${Patient.full_name}</td>
                                                    </c:if>
                                                    <c:if test="${list.reservation_id!=Patient.id}">
                                                    </c:if>
                                                </c:forEach>
                                                <td width="20%">${list.diag}</td>
                                                <td width="15%">${list.conclusion}</td>
                                                <td width="5%">${list.code}</td>
                                                <td class="text-end" width="10%">
                                                    <form method="post" action="update_medical_record">
                                                        <input type="hidden" name="id" value="${list.reservation_id}"/>
                                                        <input type="hidden" name="code" value="${list.code}"/>
                                                        <button class="bg-gradient-success text-white">Medical Detail</button>
                                                    </form>
                                                    <!--<a class="bg-gradient-success text-white" style="padding: 3px;border-radius: 2px;text-decoration: none" href="update_medical_record?id=${list.reservation_id}&code=${list.code}">Medical Detail</a>-->
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
    </body>
</html>
