<%-- 
    Document   : dashboard
    Created on : Feb 18, 2022, 9:56:41 PM
    Author     : HuuTrinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Dashboard</title>
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
                        <div class="col-md-3 stretch-card grid-margin">
                            <a class="card bg-gradient-danger card-img-holder text-white" href="reservation-list">
                                <div class="card-body">
                                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                    <h4 class="font-weight-normal mb-3">Reservation list <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">List</h2>
                                    <h6 class="card-text">Go</h6>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 stretch-card grid-margin">
                            <a class="card bg-gradient-info card-img-holder text-white" href="list-medical-approved">
                                <div class="card-body">
                                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                    <h4 class="font-weight-normal mb-3">Create Medical Record<i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">Create</h2>
                                    <h6 class="card-text">Go</h6>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 stretch-card grid-margin">
                            <a class="card bg-gradient-success card-img-holder text-white" href="show_list_create">
                                <div class="card-body">
                                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                    <h4 class="font-weight-normal mb-3">Update Medical Record<i class="mdi mdi-diamond mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">Update</h2>
                                    <h6 class="card-text">Go</h6>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 stretch-card grid-margin">
                            <a class="card bg-gradient-primary card-img-holder text-white" href="show_list_delete">
                                <div class="card-body">
                                    <img src="assets/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image" />
                                    <h4 class="font-weight-normal mb-3">Remove Medical Record<i class="mdi mdi-diamond mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">Remove</h2>
                                    <h6 class="card-text">Go</h6>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-7 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    <div class="clearfix">
                                        <h4 class="card-title float-left">Reservation Statistics</h4>                                        
                                        <div id="visit-sale-chart-legend" class="rounded-legend legend-horizontal legend-top-right float-right"><ul><li><span class="legend-dots" style="background:linear-gradient(to right, rgba(218, 140, 255, 1), rgba(154, 85, 255, 1))"></span>2022</li></ul></div>
                                    </div>
                                    <input id="lineChartData" type="hidden" value="${requestScope.data}"/>
                                    <canvas id="lineChart"class="mt-4 chartjs-render-monitor" style="display: block; height: 258px; wilineChardth: 516px;" width="709" height="354"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    <h4 class="card-title">User Statistic</h4>
                                    <canvas id="barChart" width="459" height="229" style="display: block; height: 167px; width: 334px;" class="chartjs-render-monitor"></canvas>
                                    <div id="traffic-chart-legend" class="rounded-legend legend-vertical legend-bottom-left pt-4"><ul><li><span class="legend-dots" style="background:linear-gradient(to right, rgba(54, 215, 232, 1), rgba(177, 148, 250, 1))"></span>Search Engines<span class="float-right">30%</span></li><li><span class="legend-dots" style="background:linear-gradient(to right, rgba(6, 185, 157, 1), rgba(132, 217, 210, 1))"></span>Direct Click<span class="float-right">30%</span></li><li><span class="legend-dots" style="background:linear-gradient(to right, rgba(255, 191, 150, 1), rgba(254, 112, 150, 1))"></span>Bookmarks Click<span class="float-right">40%</span></li></ul></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 grid-margin">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Patient Data table</h4>
                                    <div class="table-responsive">
                                        <table class="table" id="dataTable">
                                           
                                            <tbody>
                                                <%int i = 0;%>
                                                <c:forEach items="${requestScope.Patientlist}" var="ls">
                                                    <%if (i == 4) {
                                                            i = 1;
                                                        }%>
                                                    <tr>
                                                        <td>
                                                            <img src="assets/images/faces-clipart/pic-<%=++i%>.png" class="me-2" alt="image"> ${ls.name}
                                                        </td>
                                                        <td> ${ls.address} </td>
                                                        <td>
                                                            <c:if test="${ls.option.equals('Non - Insurance')}">
                                                                <label class="badge bg-gradient-danger">${ls.option}</label>
                                                            </c:if>
                                                            <c:if test="${ls.option.equals('Insurance')}">
                                                                <label class="badge badge-gradient-success">${ls.option}</label>
                                                            </c:if>
                                                        </td>
                                                        <td> ${ls.age} </td>
                                                        <c:if test="${ls.gender == true}">
                                                            <td>Male</td>
                                                        </c:if>
                                                        <c:if test="${ls.gender != true}">
                                                            <td>Female</td>
                                                        </c:if>
                                                        <td> ${ls.code} </td>
                                                    </tr>
                                                </c:forEach>
                                                    
                                                    
                                                    
                                                <tr>
                                                    <td>Garrett Winters</td>
                                                    <td>Nevada,USA</td>
                                                    <td><label class="badge badge-gradient-success">INSURANCE</label></td>
                                                    <td>63</td>
                                                    <td>Male</td>
                                                    <td>TS - 34927342</td>
                                                </tr>
                                                <tr>
                                                    <td>Ashton Cox</td>
                                                    <td>Liverpool</td>
                                                    <td><label class="badge badge-gradient-success">INSURANCE</label></td>
                                                    <td>66</td>
                                                    <td>Female</td>
                                                    <td>IO - 234234234</td>
                                                </tr>
                                                <tr>
                                                    <td>Cedric Kelly</td>
                                                    <td>Netherland</td>
                                                    <td><label class="badge badge-gradient-success">INSURANCE</label></td>
                                                    <td>22</td>
                                                    <td>Female</td>
                                                    <td>KO - 234234235</td>
                                                </tr>
                                                <tr>
                                                    <td>Airi Satou</td>
                                                    <td>Tokyo, Japan</td>
                                                    <td><label class="badge bg-gradient-danger">Non-INSURANCE</label></td>
                                                    <td>33</td>
                                                    <td>Female</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>Brielle Williamson</td>
                                                    <td>London, England</td>
                                                    <td><label class="badge badge-gradient-success">INSURANCE</label></td>
                                                    <td>61</td>
                                                    <td>Male</td>
                                                    <td>UX - 2342354353</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="container-fluid d-flex justify-content-between">
                            <span class="text-muted d-block text-center text-sm-start d-sm-inline-block">Copyright © bootstrapdash.com 2021</span>
                            <span class="float-none float-sm-end mt-1 mt-sm-0 text-end"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin template</a> from Bootstrapdash.com</span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        
        
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
        <!-- endinject -->
        <!-- Plugin js for this page -->
        <script src="assets/js/chart.js" type="text/javascript"></script>
        <script src="assets/vendors/js/chart.min.js" type="text/javascript"></script>
        <script src="assets/js/dashboard.js" type="text/javascript"></script>
        <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
        <!-- End plugin js for this page -->
        <!-- inject:js -->
        <script src="assets/js/off-canvas.js" type="text/javascript"></script>
        <script src="assets/js/hoverable-collapse.js" type="text/javascript"></script>
        <script src="assets/js/misc.js" type="text/javascript"></script>
        <!-- endinject -->
    </body>
</html>
