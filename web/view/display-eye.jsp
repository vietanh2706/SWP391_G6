<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Final Result</title>
        <link rel="shortcut icon" type="image/png" href="favicon/iconlogo.png"/>
        <link type="text/css" rel="stylesheet" href="css/profile/css/green.css" />
        <link type="text/css" rel="stylesheet" href="css/profile/css/print.css" media="print"/>
        <script type="text/javascript" src="css/profile/js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="css/profile/js/jquery.tipsy.js"></script>
        <script type="text/javascript" src="css/profile/js/cufon.yui.js"></script>
        <script type="text/javascript" src="css/profile/js/scrollTo.js"></script>
        <script type="text/javascript" src="css/profile/js/myriad.js"></script>
        <script type="text/javascript" src="css/profile/js/jquery.colorbox.js"></script>
        <script type="text/javascript" src="css/profile/js/custom.js"></script>

        <script type="text/javascript">
            Cufon.replace('h1,h2');
        </script>
        
        <style>
            p{
                font-size: 20px;
                font-family: cursive;
            }
        </style>
    </head>
    <body>
        <!-- Begin Wrapper -->
        <div id="wrapper">

            <div class="wrapper-top"></div>
            <div class="wrapper-mid">
                <!-- Begin Paper -->
                <div id="paper">
                    <div class="paper-top"></div>
                    <div id="paper-mid">
                        <div class="entry">
                            <!-- Begin Image -->

                            <!-- End Image -->
                            <!-- Begin Personal Information -->
                            <div class="self">
                                <h1 class="name" style="width: 400px">${requestScope.reservations.full_name}</h1>
                                 
                                <br/><br/>
                                <ul>
<!--                                    <li class="ad">Add: ${requestScope.patient.address}</li>-->

                                    <li class="tel">Phone: ${requestScope.reservations.phone}</li>
                                    <c:if test="${requestScope.reservations.insurance_code != ''}">
                                        <span class="card-text">${requestScope.reservations.insurance_code}</span>
                                    </c:if>
                                    <c:if test="${requestScope.reservations.insurance_code == ''}">
                                        <span class="card-text">Non-insurance</span>
                                    </c:if>
                                </ul>
                            </div>
                            <!-- End Personal Information -->
                            <!-- Begin Social -->
                            <div class="social">
                                <ul>
                                    <li><a class='north' href="javascript:window.print()" title="Print"><img src="css/profile/images/icn-print.jpg" alt="" /></a></li>
                                </ul>
                            </div>
                            <!-- End Social -->
                        </div>
 
                        <div class="entry">
                            <h2>Vision test</h2>
                            <p>${requestScope.r.vision_test}</p>
                        </div>

                        <div class="entry">
                            <h2>Eye disease</h2>
                            <p>${requestScope.r.eye_disease}</p>
                        </div>
                        <div class="entry">
                            <h2>Eye type</h2>
                            <p>${requestScope.r.eye_type}</p>
                        </div>
                        
                    </div>
                    <div class="clear"></div>
                    <div class="paper-bottom"></div>
                </div>
                <!-- End Paper -->
            </div>
            <div class="wrapper-bottom"></div><br/>
            <a class="btn btn-primary btn-lg" style="border-radius: 5px; margin-left:  500px;" href="OptionView"><span style="font-size: 30px">See another records</span></a> 
        </div>

        <!-- End Wrapper -->
    </body>
</html>
