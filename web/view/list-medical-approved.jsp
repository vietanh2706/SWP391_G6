<%-- 
    Document   : reservation-list
    Created on : Feb 21, 2022, 4:45:18 PM
    Author     : HuuTrinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Reservation list</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!--<link rel="stylesheet" href="css/profile/profile.css">-->

        <link href="assets/vendors/mdi/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/css/vendor.bundle.base.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/pagination/paginate.css" rel="stylesheet" type="text/css"/>
        <script src="css/pagination/paginate.js" type="text/javascript"></script>
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
                                            <th scope="col" width="10%">Name</th>
                                            <th scope="col" width="10%">Phone</th>
                                            <th scope="col" width="10%">Insurance_code</th>
                                            <th scope="col" width="10%">Date</th>
                                            <th scope="col" width="20%">Email</th>
                                            <th scope="col" class="text-end" width="22%">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.reservationlist}" var="list">
                                            <tr>
                                                <th scope="row"width="3%">${list.id}</th>
                                                <td width="10%">${list.full_name}</td>
                                                <td width="10%">${list.phone}</td>
                                                <td width="10%">${list.insurance_code}</td>
                                                <td width="10%">${list.exam_date}</td>
                                                <td width="20%">${list.email}</td>
                                                <td class="text-end" width="27%">
                                                    <a class="bg-gradient-success text-white" style="padding: 3px;border-radius: 2px;text-decoration: none" href="create_medical_record?id=${list.id}">Create Medical Record</a>
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

        <script src="assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="assets/vendors/chart.js/Chart.min.js"></script>
        <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    </body>
</html>

