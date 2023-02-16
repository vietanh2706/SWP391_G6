<%-- 
    Document   : admin_profile
    Created on : Mar 16, 2022, 5:33:08 PM
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
        <link rel="stylesheet" href="css/profile/profile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
              crossorigin="anonymous" />
        <link href="assets/vendors/mdi/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/css/vendor.bundle.base.css" rel="stylesheet" type="text/css"/>

        <!--main-->
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <script>
            function showDiv() {
                document.getElementById('welcomeDiv1').readOnly = false;
                document.getElementById('welcomeDiv2').readOnly = false;
                document.getElementById('welcomeDiv3').readOnly = false;
                document.getElementById('welcomeDiv4').readOnly = false;
                document.getElementById('welcomeDiv5').readOnly = false;
                document.getElementById('genderR1').disabled = false;
                document.getElementById('genderR2').disabled = false;
                document.getElementById('button').style.display = "block";
                document.getElementById('hide').style.display = "block";
                document.getElementById('show').style.display = "none";
            }
            function hideDiv() {
                document.getElementById('welcomeDiv1').readOnly = true;
                document.getElementById('welcomeDiv2').readOnly = true;
                document.getElementById('welcomeDiv3').readOnly = true;
                document.getElementById('welcomeDiv4').readOnly = true;
                document.getElementById('welcomeDiv5').readOnly = true;
                document.getElementById('genderR1').disabled = true;
                document.getElementById('genderR2').disabled = true;
                document.getElementById('button').style.display = "none";
                document.getElementById('show').style.display = "block";
                document.getElementById('hide').style.display = "none";
            }
        </script>
    </head>
    <body>
        <%@include file="../components/navbar_dashboard.jsp" %>
        <div class="container-fluid page-body-wrapper">
            <!--partial:partials/_sidebar.html--> 
            <%@include file="../components/sidebar.jsp" %>
            <!-- partial -->

            <c:set value="${requestScope.user}" var="u"/>
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="page-header">
                        <h3 class="page-title">
                            <span class="page-title-icon text-white me-2" style="background: linear-gradient(to bottom left, #00BCB4 4%, #C4E86B 50%);">
                                <i class="mdi mdi-bookmark-outline"></i>
                            </span> Admin Profile
                        </h3>
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page">
                                    <span></span>${u.full_name} <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="container">
                            <form action="profile?url=admin" method="post">
                                <div class="card"  style="padding:15px">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-9 form-group">
                                                    <c:if test="${u.avatar==null}">
                                                        <label>Avatar</label>
                                                        <div class="form-control">
                                                            <input oninput="this.form.submit()" type="file" accept="image/png, image/gif, image/jpeg"  name="avatar"/>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${u.avatar!=null}">
                                                        <input type="hidden" name="avatar" value="${u.avatar}"/>
                                                        <img src="${u.avatar}" class="img-fluid rounded-circle"  alt="avatar"/>
                                                    </c:if>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Full name</label>
                                                    <input type="text" placeholder="Full name..." class="form-control" name="full_name" readonly="" id="welcomeDiv2" value="${u.full_name}">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <label>Phone</label>
                                                    <input type="text" name="phone" placeholder="Phone..." class="form-control" readonly="" id="welcomeDiv5" value="${u.phone}">
                                                </div>	
                                            </div>	
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Username</label>
                                                    <input type="text" placeholder="Username..." class="form-control" name="username" readonly="" id="welcomeDiv1" value="${u.username}">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <label>Email</label>
                                                    <input type="email" placeholder="Email..." class="form-control" name="email" readonly="" id="welcomeDiv4" value="${u.email}">
                                                </div>	
                                            </div>	
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Password</label>
                                                    <input type="password" placeholder="Password..." class="form-control" name="password" readonly="" value="${u.password}">
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <label>Date of Birth</label>
                                                    <input type="date" placeholder="Date of Birth..." class="form-control" name="dob" readonly="" id="welcomeDiv3" value="${u.dob}">
                                                </div>
                                            </div>	
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-6 form-group">
                                                    <label>Gender</label>
                                                    <div class="d-flex justify-content-between align-items-center" style="width: 35%;padding: 0.94rem 0;">
                                                        <div>
                                                            <input id="genderR1" style="display: inline" disabled="" name="gender" <c:if test="${u.gender == true}"> checked="" </c:if>  type="radio" value="true">
                                                                <span>Male</span>
                                                            </div>
                                                            <div>
                                                                <input id="genderR2" style="display: inline" <c:if test="${u.gender == false}"> checked="" </c:if>disabled="" name="gender" type="radio" value="false">
                                                            <span>Female</span>
                                                        </div>

                                                    </div>	
                                                </div>
                                                <div class="col-sm-6 form-group">
                                                    <label>Create date</label>
                                                    <input type="date" placeholder="Date of Birth..." class="form-control" name="c_date" readonly="" value="${u.created_date}">
                                                </div>	
                                            </div>	
                                        </div>

                                    </div>
                                    <nav aria-label="breadcrumb">
                                        <div class="mb-2 d-flex justify-content-start align-items-center">
                                            <div class="card position-relative">
                                                <span class="position-absolute search">
                                                    <i class="fa fa-search"></i>
                                                </span> 
                                                <input type="button" id="show" class="btn btn-group-justified bg-gradient-info text-white" onclick="showDiv();" value="Edit"/>
                                                <input type="button" id="hide" class="btn btn-group-justified bg-gradient-info text-white" onclick="hideDiv();" value="HideEdit"/>
                                            </div>
                                            <div class="card position-relative" style="margin-left: 10px; ">
                                                <span class="position-absolute search">
                                                    <i class="fa fa-search"></i>
                                                </span> 
                                                <input id="button" type="submit"  class="btn btn-group-justified bg-gradient-info text-white"name="submit" value="Update"/> 
                                            </div>
                                        </div>
                                    </nav>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.getElementById("button").style.display = "none"
            document.getElementById("hide").style.display = "none"
        </script>
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

