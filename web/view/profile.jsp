
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="cl" uri ="https://cloudinary.com/jsp/taglib" %>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>User Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/profile/profile.css">
        <script>
            function showDiv() {
                document.getElementById('welcomeDiv1').disabled = false;
                document.getElementById('welcomeDiv2').readOnly = false;
                document.getElementById('welcomeDiv3').readOnly = false;
                document.getElementById('welcomeDiv4').readOnly = false;
                document.getElementById('welcomeDiv5').readOnly = false;
                document.getElementById('button').style.display = "inline-block";
                document.getElementById('genderR1').disabled = false;
                document.getElementById('genderR2').disabled = false;
            }
        </script>
    </head>
    <body>
        <form action="profile" method="post">
            <div class="container">
                <div class="main-body">
                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb" class="main-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                        </ol>
                    </nav>
                    <!-- /Breadcrumb -->
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <c:if test="${sessionScope.acc.avatar==null}">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">                            
                                        </c:if>
                                        <c:if test="${sessionScope.acc.avatar!=null}">
                                            <img src="${sessionScope.acc.avatar}" alt="Admin" class="rounded-circle" width="150" height="150" name="avatar">                            
                                            <input type="hidden" value="${sessionScope.acc.avatar}" name="avatar_now">
                                        </c:if>
                                        <div class="mt-3">
                                            <h4>${requestScope.user.full_name}</h4>
                                        </div>
                                        <input type="file" id="welcomeDiv1" disabled="" class="avatar" accept="image/png, image/gif, image/jpeg" name="avatar" style="width:108px;">
                                    </div>
                                </div>
                            </div>
                            <br>
                            <br>
                            <button type="button" class="btn btn-light"><a style ="text-decoration: none; color: black" href="ReservationDetail">See your reservation</a></button>
                        </div>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Username</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            ${requestScope.user.username}
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Password</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            **************
                                            <a href="change" style="float: right">Change password</a>
                                        </div>

                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control" id="welcomeDiv2" readonly="" type="text" value="${requestScope.user.full_name}" name="full_name" required/>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Date of birth</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control" type="date" id="welcomeDiv3" readonly="" value="${requestScope.user.dob}"name="dob" placeholder="dd-MM-yyyy" required/>
                                            <i class="fas fa-calendar-alt"></i>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control" type="email"id="welcomeDiv4" readonly="" name="email" value="${requestScope.user.email}" required/>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input class="form-control" type="text" id="welcomeDiv5" readonly=""name="phone"placeholder="${requestScope.PhoneErr != null?requestScope.PhoneErr:""}" value="${requestScope.PhoneErr!=null?"":requestScope.user.phone}"required/>
                                        </div>

                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Gender</h6>

                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                                Male
                                            <input id="genderR1" style="display: inline" 
                                                   <c:if test="${requestScope.user.gender == true}">
                                                       checked="" 
                                                   </c:if>
                                            disabled="" name="gender"  type="radio" value="true">
                                                Female
                                            <input id="genderR2" style="display: inline" 
                                                   <c:if test="${requestScope.user.gender == false}"> 
                                                       checked="" 
                                                   </c:if>
                                            disabled="" name="gender" type="radio" value="false">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">cod</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input class="form-control" type="date" id="welcomeDiv6" readonly="" value="${requestScope.user.created_date}"name="c_date" placeholder="dd-MM-yyyy" required/>
                                            <i class="fas fa-calendar-alt"></i>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <input type="button" onclick="showDiv();" value="Edit"/>

                                            <input type="submit" id="button" style="display: none; margin-left: 20px;" value="Save"/>
                                        </div>
                                    </div>
                                </div>
                            </div>





                        </div>
                    </div>

                </div>
            </div>

        </form>
        <script src="css/login/js/jquery-3.3.1.min.js"></script>
        <script src="css/login/js/popper.min.js"></script>
        <script src="css/login/js/bootstrap.min.js"></script>
        <script src="css/login/js/main.js"></script>
    </body>
</html>
