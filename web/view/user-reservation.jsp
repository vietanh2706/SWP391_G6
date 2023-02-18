
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Reservation detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/pagination/paginate.css" rel="stylesheet" type="text/css"/>
        <script src="css/pagination/paginate.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/profile/profile.css">
        
        
    </head>
    <body>
        
         <form action="ReservationDetail" method="post">
            <div class="container">
                <div class="main-body">
                    <!-- Breadcrumb -->
                    <nav aria-label="breadcrumb" class="main-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item"><a href="profile">User</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Reservation</li>
                        </ol>
                    </nav>
                    
                    
                    <!-- /Breadcrumb -->
                    <div class="mb-2 d-flex justify-content-between align-items-center">
                        <div class="position-relative"> <span class="position-absolute search"><i class="fa fa-search"></i></span> <input class="form-control w-100" type="search" id="searchBox" placeholder="Search by order#, name..."> </div>
                    </div>
                    <table class="table table-responsive table-borderless" id="dataTable">
                        <thead>
                            <tr class="bg-light">
                                <th scope="col" width="3%">ID</th>
                                <th scope="col" width="10%">Name</th>
                                <th scope="col" width="10%">Phone</th>
                                <th scope="col" width="15%">Insurance_code</th>
                                <th scope="col" width="10%">Date</th>
                                <th scope="col" width="25%">Email</th>
                                <th scope="col" width="15%">Status</th>
                                <th scope="col" class="text-end" width="20%">Action</th>
                            </tr>
                        </thead>
                        <tbody >
                            <c:forEach items="${requestScope.list}" var="l">
                                <tr>
                                    <th scope="row"width="3%">${l.id}</th>
                                    <td width="10%">${l.full_name}</td>
                                    <td width="10%">${l.phone}</td>
                                    <td width="12%">${l.insurance_code}</td>
                                    <td width="10%">${l.exam_date}</td>
                                    <td width="25%">${l.email}</td>
                                    <c:if test="${l.status==0}"><td width="25%">Pending</td><td class="text-end"><a href="cancellreservation?id=${l.id}">Cancell</a></td> </c:if>
                                    <c:if test="${l.status==1}"><td width="25%">Cancelled</td><td class="text-end"></td> </c:if>
                                    <c:if test="${l.status==2}"><td width="25%">Booking Success</td><td class="text-end"></td> </c:if>
                                    <c:if test="${l.status==3}"><td width="25%">Booking Fail</td><td class="text-end"></td> </c:if>
                                    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
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
        <script src="css/signin/js/jquery-3.3.1.min.js"></script>
        <script src="css/signin/js/popper.min.js"></script>
        <script src="css/signin/js/bootstrap.min.js"></script>
        <script src="css/signin/js/main.js"></script>
    </body>
</html>
