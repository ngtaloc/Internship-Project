
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix = "form" uri = "http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Quản lý cửa hàng thuốc tây</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
   <link rel="stylesheet"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/Css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/Css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="resources/images/logo.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <div class="page-holder d-flex align-items-center">
      <div class="container">
        <div class="row align-items-center py-5">
          <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
            <div class="pr-lg-5"><img src="resources/images/medicine-system.png" alt="" class="img-fluid"></div>
          </div>
          <div class="col-lg-5 px-lg-4">
            <h1 class="text-base text-primary text-uppercase mb-4">Plum Pharmacy</h1>
            <h2 class="mb-4">Welcome back!</h2>
            
            <form:form name='loginForm' action="checklogin" method='POST' modelAttribute="login">
              <div class="form-group mb-4">
                <form:input id="username" name="username" path="username" placeholder="Tên đăng nhập" class="form-control border-0 shadow form-control-lg"/>
                <%-- <form:input class="col-md-6 " id="username" name="username" path="username"/> --%>
              </div>
              <div class="form-group mb-4">
                <form:input type="password" id="password" name="passowrd" placeholder="Mật khẩu" path="password" class="form-control border-0 shadow form-control-lg text-violet"/>
				<%-- <form:input class="col-md-6" type="password" id="password" name="password" path="password"/>    --%>           
              </div>
              <div class="form-group mb-4">
                <div class="custom-control custom-checkbox">
                  <span class="text-danger" id="mes" role="alert">
					  ${message}
					</span>
                </div>
              </div>
              <button type="submit" name="submit" id="btnDangNhap" class="btn btn-primary shadow px-5">Đăng nhập</button>
              <!-- <button class="btn btn-outline-secondary" type="submit" name="submit" id="btnDangNhap">Đăng nhập</button> -->
            </form:form>
          </div>
        </div>
        <p class="mt-5 mb-0 text-gray-400 text-center">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a> & Your company</p>
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)                 -->
      </div>
    </div>
    <!-- JavaScript files-->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="resources/vendor/chart.js/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <script src="resources/js/front.js"></script>
    <script src="resources/Js/loginJS.js"></script>
    
  </body>
</html>