
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
              crossorigin="anonymous" />
      

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
                            </span> Doctor Registration Form
                        </h3>
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page">
                                    <c:if test="${requestScope.mess==null}">
                                        <span>Add new Doctor</span><i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                                    </c:if>
                                    <c:if test="${requestScope.mess!=null}">
                                        <span style="color:red;">${requestScope.mess}</span><i class="mdi mdi-alert-circle-outline icon-sm text-danger align-middle"></i>
                                    </c:if>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="container">
                            <form action="doctor-signup" method="post">
                                <div class="card"  style="padding:15px">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Doctor name</label>
                                                    <input type="text" placeholder="Doctor name..." class="form-control" name="name">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <label>Phone</label>
                                                    <input type="text" placeholder="Phone..." class="form-control" name="phone">
                                                </div>	
                                            </div>	
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Username</label>
                                                    <input type="text" placeholder="Username..." class="form-control" name="username">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <label>Email</label>
                                                    <input type="text" placeholder="Email..." class="form-control" name="email">
                                                </div>	
                                            </div>	
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Password</label>
                                                    <input type="text" placeholder="Password..." class="form-control" name="pass">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <label>Date of Birth</label>
                                                    <input type="date" placeholder="Date of Birth..." class="form-control" name="dob">
                                                </div>
                                            </div>	
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Address</label>
                                                    <input type="text" placeholder="Address..." class="form-control" name="address">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <label>Gender</label>
                                                    <div class="d-flex justify-content-between align-items-center" style="width: 35%;padding: 0.94rem 0;">
                                                        <div>
                                                            <input type="radio" name="gender"value="1"/>
                                                            <span>Male</span>
                                                        </div>
                                                        <div>
                                                            <input type="radio" name="gender"value="0"/>
                                                            <span>Female</span>
                                                        </div>
                                                    </div>
                                                </div>	
                                            </div>	
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">

                                                <div class="col-sm-3 form-group">
                                                    <label>Department</label><br>
                                                    <select class="form-select" aria-label="Default select example" name="department">
                                                        <c:forEach items="${requestScope.dept}" var="d">
                                                            <option value="${d.ID}">${d.dept_name}</option> 
                                                        </c:forEach>  
                                                    </select>
                                                </div>
                                                <div class="col-sm-9 form-group">
                                                    <label>Avatar</label>
                                                    <input type="file" accept="image/png, image/gif, image/jpeg" class="form-control" name="avatar">
                                                </div>
                                            </div>	
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Room number</label>
                                                    <input type="text" placeholder="Room number..." class="form-control" name="room">
                                                </div>
                                            </div>	
                                        </div>
                                        <div class="col-sm-12 form-group">
                                            <div class="col-sm-6 form-group">
                                                <label>Experience year</label>
                                                <textarea placeholder="Experience year..." class="form-control" name="year"></textarea>
                                            </div>
                                            <div class="col-sm-6 form-group">
                                                <label>About Doctor</label>
                                                <textarea placeholder="Description..." class="form-control" name="description"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <nav aria-label="breadcrumb">
                                        <div class="mb-2 d-flex justify-content-center align-items-center">
                                            <div class="card position-relative"> <span class="position-absolute search"><i class="fa fa-search"></i></span> <input type="submit" class="btn btn-group-justified bg-gradient-info text-white"name="submit" value="ADD DOCTOR"/> </div>
                                        </div>
                                    </nav>
                                </div>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/vendors/js/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
        <!-- inject:js -->
        <script src="assets/js/off-canvas.js" type="text/javascript"></script>
        <script src="assets/js/hoverable-collapse.js" type="text/javascript"></script>
        <script src="assets/js/misc.js" type="text/javascript"></script>
    </body>

</html>
