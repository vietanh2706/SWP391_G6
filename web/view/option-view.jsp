<%-- 
    Document   : option
    Created on : Jul 21, 2021, 1:27:22 PM
    Author     : HIEU19
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="assets/vendors/mdi/css/materialdesignicons.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/vendors/css/vendor.bundle.base.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
        <!-- End layout styles -->
        <link href="css/pagination/paginate.css" rel="stylesheet" type="text/css"/>
        <script src="css/pagination/paginate.js" type="text/javascript"></script>
        <link rel="shortcut icon" href="img/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Record</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" style="box-shadow: 0 0 1px 1px rgb(0 0 0 / 40%); height: 120px">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo" href="dashboard"><img src="assets/images/logo.svg" alt="logo" /></a>
                <a class="navbar-brand brand-logo-mini" href="dashboard"><img src="assets/images/logo-mini.svg" alt="logo" /></a>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-stretch">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="mdi mdi-menu"></span>
                </button>
                <!--        <div class="search-field d-none d-md-block">
                            <form class="d-flex align-items-center h-100" action="#">
                                <div class="input-group">
                                    <div class="input-group-prepend bg-transparent">
                                        <i class="input-group-text border-0 mdi mdi-magnify"></i>
                                    </div>
                                    <input type="text" class="form-control bg-transparent border-0" id="searchBox" placeholder="Search box">
                                </div>
                            </form>
                        </div>-->
                <h2 style="margin-left: 33%; margin-top: 10px;">Record Detail</h2>
                <ul class="navbar-nav navbar-nav-right">
                    <li class="nav-item nav-profile dropdown">
                        <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="nav-profile-img">
                                <img src="${sessionScope.acc.avatar}" alt="image">
                                <span class="availability-status online"></span>
                            </div>
                            <div class="nav-profile-text">
                                <p class="mb-1 text-black">${sessionScope.acc.full_name}</p>
                            </div>
                        </a>
                        <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                            <a class="dropdown-item" href="home">
                                <i class="mdi mdi-home me-2 text-success"></i> Home page </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="signout">
                                <i class="mdi mdi-logout me-2 text-primary"></i> Signout </a>
                        </div>
                    </li>
                    <li class="nav-item d-none d-lg-block full-screen-link">
                        <a class="nav-link">
                            <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
                        </a>
                    </li>


                    <li class="nav-item nav-logout d-none d-lg-block">
                        <a class="nav-link" href="signout">
                            <i class="mdi mdi-power"></i>
                        </a>
                    </li>

                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                    <span class="mdi mdi-menu"></span>
                </button>
            </div>
        </nav>
        <!--        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                    <a class="navbar-brand" href="../dashboard">Doctor website</a>
                    <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i
                            class="fas fa-bars"></i></button>
                     Navbar Search
                    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                        <div class="input-group">
        
                            <div class="input-group-append" style="color: white; font-size: 30px; margin-left: 1100px">
                                Department of Subclinical
                            </div>
                        </div>
                    </form>-->
        <!-- Navbar-->
        <!--            <ul class="navbar-nav ml-auto ml-md-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="../home">Home Page</a>             
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="../logout">Logout</a>
                            </div>
                        </li>
                    </ul>
                </nav><br/><br/>-->


        <div class="container" style="margin-top: 200px;">
            <div class="row">
                <div class="card" style="width: 25rem;">

                    <div class="card-body">
                        <h5 class="card-title">Physical Record</h5>
                        <p class="card-text">The physical examination is the recording of observations of the patient. This includes the vital signs, muscle power and examination of the different organ systems, especially ones that might directly be responsible for the symptoms the patient is experiencing..</p>
                        <a href="physical" class="btn btn-primary">Display</a>
                    </div>
                </div>
                <div class="card" style="width: 25rem;">

                    <div class="card-body">
                        <h5 class="card-title">Eye record</h5>
                        <p class="card-text">Medical Vision Technology is an organization of general and specialized ophthalmologists, dedicated to patient care and to improving quality of life through life-changing vision procedures and treatments. </p>
                        <a href="eye" class="btn btn-primary">Display</a>
                    </div>
                </div> <div class="card" style="width: 25rem;">

                    <div class="card-body">
                        <h5 class="card-title">Internal Record</h5>
                        <p class="card-text">A physical exam of the vagina, cervix, uterus, fallopian tubes, ovaries, and rectum. Cell samples may be taken for a Pap test, or to test for sexually transmitted diseases or other infections.</p>
                        <a href="internal" class="btn btn-primary">Display</a>
                    </div>
                </div>
                <div class="card" style="width: 25rem;">

                    <div class="card-body">
                        <h5 class="card-title">Maxillofacial Record</h5>
                        <p class="card-text">Oral and Maxillofacial Surgeons are specialists in the diagnosis and treatment of a broad range of disorders affecting the facial complex and skeleton, including the jaws and oral cavity.</p>
                        <a href="maxi" class="btn btn-primary">Display</a>
                    </div>
                </div>
                <div class="card" style="width: 25rem;">

                    <div class="card-body">
                        <h5 class="card-title">Ear, nose and throat Record</h5>
                        <p class="card-text">Abbreviation for ears, nose and throat. A field of medicine also called otolaryngology</p>
                        <a href="ent" class="btn btn-primary">Display</a>
                    </div>
                </div>
<!--                <div class="card" style="width: 25rem;">

                    <div class="card-body">
                        <h5 class="card-title">Biochemical Examination</h5>
                        <p class="card-text">Stats of your biochemical examination.</p>
                        <a href="bio" class="btn btn-primary">Display</a>
                    </div>
                </div>
                <div class="card" style="width: 25rem;">

                    <div class="card-body">
                        <h5 class="card-title">BloodCell Examination</h5>
                        <p class="card-text">Stats of your bloodcell examination.</p>
                        <a href="blood" class="btn btn-primary">Display</a>
                    </div>
                </div>-->
                <div class="card" style="width: 25rem;">

                    <div class="card-body">
                        <h5 class="card-title">Conclusion</h5>
                        <p class="card-text">Click here to see conclusion from doctors</p>
                        <a href="result" class="btn btn-primary">Finish</a>
                    </div>
                </div>
                <div class="card" style="width: 25rem;">

                    <div class="card-body">
                        <h5 class="card-title">Finish</h5>
                        <p class="card-text">When you finish, click here to return to homepage</p>
                        <a href="home" class="btn btn-primary">Finish</a>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js" type="text/javascript"></script>
    <script src="assets/js/hoverable-collapse.js" type="text/javascript"></script>
    <script src="assets/js/misc.js" type="text/javascript"></script>
    <!-- endinject -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
