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
        
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
                    
                     <!<!-- added -->
                    <div class="row p-0 w-100 m-0">
                            <div class="col-lg-4 col-md-12 col-sm-12">
                            </div>
                            <div class="col-lg-8 col-md-12 col-sm-12 filter py-3 px-0  flex-no-wrap">
                                <!-- form search -->
                                <form action="show_list_delete" class="form-inline my-2 my-lg-0 justify-content-end" style="flex: 0.5;" method="POST">
                                    <!-- <button class="btn btn-light border my-2 my-sm-0 remove-border-radius-right"
                                        type="submit">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                    <input class="form-control w-50 remove-border-radius-left mr-3" type="search"
                                        placeholder="User Search" aria-label="Search"> -->



                                    <div class="input-group" style="margin-right: 10px;">
                                        <div class="input-group-prepend">
                                            <button id="button-addon8" type="submit" class="btn"
                                                    style="border: 1px solid #e3e3e3 ;"> <i class="fa fa-search"> </i> </button>
                                        </div>
                                        <input type="search" placeholder="User Search" aria-describedby="button-addon8" name="search"
                                               class="form-control" style="width: 300px;">
                                    </div>

                                    <div class="input-group" style="margin-right: 10px;">
                                        <div class="input-group-prepend">
                                            <button id="button-addon8" type="submit" class="btn"
                                                    style="border: 1px solid #e3e3e3 ;"> <i class="fas fa-filter"></i> Filter
                                                by:</button>
                                        </div>
                                        <select class="form-control" id="exampleFormControlSelect1" aria-placeholder="Name" name="option">
                                            <option selected>ID</option>
                                            <option>Doctor</option>                  
                                            <option>Patient</option>
                                            <option>Diagnostic</option>
                                            <option>Conclusion</option>
                                            <option>Code</option>
                                            
                                        </select>
                                    </div>

                                    <button class="btn btn-light border " type="submit"
                                            style="background-color: #5bc0de; color: white;">Search</button>
                                </form>
                            </div>
                        </div>
                    <!<!-- added -->
                    
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
