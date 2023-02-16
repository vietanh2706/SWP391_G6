
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

        <link href="css/signin/fonts/icomoon/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/signin/css/owl.carousel.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Bootstrap CSS -->
        <link href="css/signin/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- Style -->
        <link rel="stylesheet" href="css/signin/css/style.css">
        <link href="css/signin/css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/png" href="img/iconlogo.png"/>
        <title>Login</title>
    </head>
    <body>


        <div class="d-lg-flex half">
            <div class="bg order-1 order-md-2" style="background-image: url('img/m1.jpg');"></div>
            <div class="contents order-2 order-md-1">

                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7">
                            <div class="mb-4">
                                <h3 style="font-size: 50px">Sign In</h3>
                                <p class="text-danger">${requestScope.message}</p>
                            </div>
                            <form action="signin" method="post">
                                <div class="form-group first">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="user">

                                </div>
                                <div class="form-group last mb-3">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="pass">

                                </div>

                                <div class="d-flex mb-5 align-items-center">
                                    <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                                        <input type="checkbox" checked="checked" name="remember" value="1"/>
                                        <div class="control__indicator"></div>
                                    </label>

                                </div>
                                <p style="color: red">${requestScope.err}</p>
                                <input type="submit" value="Sign-In" class="btn btn-block btn-primary">
                                <br/><br/>
                                <a href="signup">Don't have account? Create one</a><br>
                                <a href="reset">Forgot password?</a>
                                <br/><br/><br/><br/>
                                <span class="d-block text-center my-4 text-muted">&mdash; build with <i class="fa fa-heart" style="font-size:26px; color: red"></i> by Team3 &mdash;</span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="css/signin/js/jquery-3.3.1.min.js"></script>
        <script src="css/signin/js/popper.min.js"></script>
        <script src="css/signin/js/bootstrap.min.js"></script>
        <script src="css/signin/js/main.js"></script>
    </body>
</html>
