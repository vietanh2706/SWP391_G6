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
        <title>Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!--<link rel="stylesheet" href="css/profile/profile.css">-->
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
              crossorigin="anonymous" />
        <link href="assets/vendors/mdi/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/css/vendor.bundle.base.css" rel="stylesheet" type="text/css"/>
        <!--phân trang-->
        <!--        <link href="css/pagination/paginate.css" rel="stylesheet" type="text/css"/>
                <script src="css/pagination/paginate.js" type="text/javascript"></script>-->
        <!--main-->
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
                            </span> Reservation List
                        </h3>
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page">
                                    <span></span>List of Reservation <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="container">
                            <form action="ReservationDetail" method="post">
                                <div class="card table-responsive"style="padding: 10px;">
                                    <table class="table table-responsive table-borderless" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr class="bg-light">
                                                <th scope="col" width="3%">ID</th>
                                                <th scope="col" width="10%">Name</th>
                                                <th scope="col" width="10%">Phone</th>
                                                <th scope="col" width="10%">Insurance_code</th>
                                                <th scope="col" width="10%">Date</th>
                                                <th scope="col" width="20%">Email</th>
                                                <th scope="col" width="15%">Status</th>
                                                <th scope="col" class="text-end" width="22%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody >
                                            <c:forEach items="${requestScope.reservationlist}" var="list">
                                                <tr>
                                                    <th scope="row"width="3%">${list.id}</th>
                                                    <td width="10%">${list.full_name}</td>
                                                    <td width="10%">${list.phone}</td>
                                                    <td width="10%">${list.insurance_code}</td>
                                                    <td width="10%">${list.exam_date}</td>
                                                    <td width="20%">${list.email}</td>
                                                    <c:if test="${list.status==0}"><td width="10%">Pending</td> </c:if>
                                                    <c:if test="${list.status==1}"><td width="10%">Cancelled by patient</td> </c:if>
                                                    <c:if test="${list.status==2}"><td width="10%">Approved</td> </c:if>
                                                    <c:if test="${list.status==3}"><td width="10%">CancelledbyAdmin</td> </c:if>
                                                    <c:if test="${sessionScope.acc.role_id==1&&list.status==0}">
                                                        <td class="text-end" width="27%">
                                                            <a class="bg-gradient-danger text-white" style="padding: 3px;border-radius: 2px;text-decoration: none" href="cancellreservation?id=${list.id}">Cancell</a>
                                                            <a class="bg-gradient-success text-white" style="padding: 3px;border-radius: 2px;text-decoration: none" href="acceptreservation?id=${list.id}">Choose Time</a>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${sessionScope.acc.role_id==1&&list.status!=0}">
                                                        <td class="text-end" width="27%">

                                                        </td>
                                                    </c:if>
                                                    <c:if test="${sessionScope.acc.role_id!=1}">
                                                        <td class="text-end" width="27%"></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="css/signin/js/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#dataTable').DataTable();
        });
    </script>

    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js" type="text/javascript"></script>
    <script src="assets/js/hoverable-collapse.js" type="text/javascript"></script>
    <script src="assets/js/misc.js" type="text/javascript"></script>
    <!-- endinject -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>

</body>
</html>