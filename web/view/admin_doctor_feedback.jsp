<%@page import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/dash/admin_doctor_list/styles.css" rel="stylesheet" />
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
                            </span> List Feedback
                        </h3>
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item active" aria-current="page">
                                    <span></span>Feedback of this doctor <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="container">
                            <div class="card table-responsive"style="padding: 10px;">
                                <%
                                    User u = (User) request.getSession().getAttribute("acc");
                                %>
                                <table class="table table-responsive table-borderless" id="dataTable" width="100%" cellspacing="0">
                                    <tr>
                                        <th>STT</th>
                                        <th>ID</th>
                                        <th>Doctor</th>
                                        <th>Patient/User</th>
                                        <th>Feedback</th>
                                        <th>Rate</th>
                                        <th>Date Created</th>
                                    </tr>
                                    <%
                                        int stt = 0;
                                    %>
                                    <c:forEach items="${requestScope.feedbacks}" var="d">  
                                        <tr>
                                            <td><%=++stt%></td>
                                            <td>${d.id}</td>
                                            <td>${d.doctor.user.full_name}</td>
                                            <%
                                                if (u.getRole_id() == 1) {
                                            %>
                                            <td>${d.user.full_name}</td>
                                            <%
                                            } else {
                                            %>
                                            <td>Unknown</td>
                                            <%
                                                }
                                            %>

                                            <td>${d.feedback}</td>
                                            <td>
                                                ${d.rate}
                                            </td>
                                            <td>${d.date_created}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
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