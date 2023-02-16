<%-- 
    Document   : applylist
    Created on : Mar 13, 2022, 7:51:50 PM
    Author     : asus
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                                <i class="mdi mdi-home"></i>
                            </span> Apply List
                        </h3>
                        <nav aria-label="breadcrumb">
                            <div class="mb-2 d-flex justify-content-end align-items-center">
                                <div class="card position-relative"> <span class="position-absolute search"></span> <a href="doctor-signup" class="btn btn-group-justified bg-gradient-success">Add new Doctor</a> </div>
                            </div>
                        </nav>
                    </div>
                    <div class="row">
                        <c:forEach items="${requestScope.doctorList}" var="list">
                            <c:if test="${list.user.status==1}">
                                <div class="col-md-3 stretch-card grid-margin">
                                    <div class="card bg-white card-img-holder text-white" >
                                        <div class="card-body">
                                            <img src="${list.user.avatar}" class="img-circle w-100 rounded-circle" width="186.8" height="186.8" alt="circle-image" />
                                            <hr class="bg-danger">
                                            <div class="card-title d-flex justify-content-between align-items-center text-black">
                                                <a class="text-black  text-decoration-none" href="doctordetail?id=${list.id}&fromdash=1">${list.user.full_name}</a>
                                                <div class="nav-item nav-profile dropdown">
                                                    <a class="nav-link text-black" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                                        <i class="mdi mdi-dots-horizontal mdi-24px float-right"></i>
                                                    </a>
                                                    <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                                                        <a class="dropdown-item" href="feedback?url=admin&service=view&doctor_id=${list.user.id}">
                                                            <i class="mdi mdi-message me-2 text-primary"></i> Feedback </a>
                                                        <a class="dropdown-item" href="DoctorUpdate?did=${list.user.id}">
                                                            <i class="mdi mdi-update me-2 text-primary"></i> Update </a>
                                                        <a class="dropdown-item" href="deactiveDoctor?did=${list.user.id}">
                                                            <i class="mdi mdi-file-hidden me-2 text-primary"></i> Deactive </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:forEach items="${departmentList}" var="delist">
                                                <c:if test="${list.dept_id==delist.ID}">
                                                    <h6 class="text-black">${delist.dept_name}</h6>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${list.user.status!=1}">
                            </c:if>

                        </c:forEach>
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
