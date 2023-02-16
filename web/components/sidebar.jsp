<%-- 
    Document   : sidebar
    Created on : Mar 14, 2022, 11:17:38 AM
    Author     : asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item nav-profile">
            <a href="#" class="nav-link">
                <div class="nav-profile-image">
                    <img src="${sessionScope.acc.avatar}" alt="profile">
                    <span class="login-status online"></span>
                    <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                    <span class="font-weight-bold mb-2">${sessionScope.acc.full_name}</span>
                    <c:if test="${sessionScope.acc.role_id==1}">
                        <span class="text-secondary text-small">Admin</span>
                    </c:if>
                    <c:if test="${sessionScope.acc.role_id==3}">
                        <span class="text-secondary text-small">Doctor</span>
                    </c:if>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="dashboard">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>

        <li class="nav-item">
            <!--Reservation list-->
            <a class="nav-link" href="reservation-list">
                <span class="menu-title">Reservation list</span>
                <i class="mdi mdi-format-list-bulleted menu-icon"></i>
            </a>
        </li>
        <c:if test="${acc.role_id==1}">
            <li class="nav-item">
                <!--Doctor list-->
                <a class="nav-link" href="doctorlist?url=admin">
                    <span class="menu-title">Doctor list</span>
                    <i class="mdi mdi-format-list-bulleted menu-icon"></i>
                </a>
            </li>
        </c:if>
        <li class="nav-item">
            <div class="border-bottom">
                <span class="menu-title" style="font-weight: 600;color: #c3c3c3">INTERFACE</span>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
                <span class="menu-title">Sample Pages</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-medical-bag menu-icon"></i>
            </a>
            <div class="collapse" id="general-pages">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="signin"> Sign-in </a></li>
                    <li class="nav-item"> <a class="nav-link" href="signup"> Sign-up </a></li>
                    <li class="nav-item"> <a class="nav-link" href="components/error.jsp"> 404 </a></li>
                    <li class="nav-item"> <a class="nav-link" href="components/accessdenied.jsp"> 403 access deny </a></li>
                </ul>
            </div>
        </li>
<!--        <li class="nav-item">
            <div class="border-bottom">
                <span class="menu-title" style="font-weight: 600;color: #c3c3c3">ACCOUNT</span>
            </div>
        </li>-->
<!--        <li class="nav-item">
            Update account
            <a class="nav-link" href="profile">
                <span class="menu-title">Update account</span>
                <i class="mdi mdi-contacts menu-icon"></i>
            </a>
        </li>-->

    </ul>
</nav>