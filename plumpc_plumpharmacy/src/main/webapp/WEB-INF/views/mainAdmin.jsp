<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
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
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/Css/custom.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/Css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/Css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="resources/images/logo.png">

<script type="text/javascript">
	function loadPage() {
		myVar = setTimeout(function() {
			document.getElementById("loader").style.display = "none";
			document.getElementById("sale").style.display = "block";
		}, 1000);
	}
</script>

</head>

<body onload="loadPage()">
	<header class="header">
		<nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">
			<a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i
				class="fas fa-align-left"></i></a><a href="#"
				class="navbar-brand font-weight-bold text-uppercase text-base">Plum
				<span style="color: #7cf29c;">Pharmacy</span>
			</a>
			<ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
				<li class="nav-item dropdown ml-auto"><a id="userInfo" href="#"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					class="nav-link dropdown-toggle"><img
						src="resources/images/avatar-6.jpg" alt=""
						style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
					<div aria-labelledby="userInfo" class="dropdown-menu">
						<a href="#" class="dropdown-item"><strong
							class="d-block text-uppercase headings-font-family">${pageContext.request.userPrincipal.name}</strong><small>Role_Admin</small></a>
						<div class="dropdown-divider"></div>
						<a href="#changePassModal" class="dropdown-item"
							data-toggle="modal">Thay đổi mật khẩu</a> 
							  
							   <form action="<c:url value="/j_spring_security_logout" />" method="post">
								    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								    <input class="dropdown-item" type="submit" value="Logout" />
								  </form>
							
					</div></li>
			</ul>
		</nav>
	</header>

	<div class="d-flex align-items-stretch">
		<div id="sidebar" class="sidebar">
			<div
				class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">MAIN
			</div>
			<ul class="sidebar-menu list-unstyled">
				<li class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted" data-toggle="collapse"
					data-target="#system" aria-expanded="false" aria-controls="system"><i
						class="text-gray"></i><span>Hệ thống</span></a>
					<div id="system" class="collapse">
						<ul
							class="sidebar-menu list-unstyled border-left border-primary border-thick">
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5" id="manageAccount">Quản
									lý tài khoản</a></li>
						</ul>
					</div></li>
				<li class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted" data-toggle="collapse"
					data-target="#function" aria-expanded="false"
					aria-controls="function"><i class="text-gray"></i><span>Chức
							năng</span></a>
					<div id="function" class="collapse">
						<ul
							class="sidebar-menu list-unstyled border-left border-primary border-thick">
							<li class="sidebar-list-item"><a href="#dropdown-lvl2"
								data-toggle="collapse" class="sidebar-link text-muted pl-lg-5"
								id="manageSale">Quản lý bán hàng</a>
								<div id="dropdown-lvl2" class="collapse">
									<ul class="idebar-menu list-unstyled">
										<li class="sidebar-list-item"><a href="#"
											class="sidebar-link text-muted subLv" id="retail">Bán hàng</a></li>
										<li class="sidebar-list-item"><a href="#"
											class="sidebar-link text-muted subLv" id="customerRefund">Khách
												hoàn trả</a></li>
									</ul>
								</div></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5" id="inventoryManagement">Quản
									lý nhập kho</a></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5" id="exportStock">Quản
									lý xuất kho</a></li>
						</ul>
					</div></li>
				<li class="sidebar-list-item"><a href="#"
					data-toggle="collapse" data-target="#manageInfo"
					aria-expanded="false" aria-controls="manageInfo"
					class="sidebar-link text-muted"><i class="text-gray"></i><span>Quản
							lý thông tin</span></a>
					<div id="manageInfo" class="collapse">
						<ul
							class="sidebar-menu list-unstyled border-left border-primary border-thick">
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5" id="drugGroup">Nhóm
									thuốc</a></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5"
								id="drugInformationManager">Thông tin thuốc</a></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5" id="manageCustomer">Khách
									hàng</a></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5" id="manageSupplier">Nhà
									cung cấp</a></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5" id="employeeManager">Nhân
									viên</a></li>
							<li class="sidebar-list-item"><a href="#"
								class="sidebar-link text-muted pl-lg-5" id="medicineInformation">Thông
									tin toa thuốc</a></li>
						</ul>
					</div></li>
				<li class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted" id="search"><i
						class="text-gray"></i><span>Tra cứu</span></a></li>
				<li class="sidebar-list-item"><a href="#"
					class="sidebar-link text-muted" id="report"><i
						class="text-gray"></i><span>Báo cáo</span></a></li>
			</ul>

		</div>
		<div class="page-holder w-100 d-flex flex-wrap" id="contentRight">
			<div id="loader"></div>
			<iframe src="managementSale" id="sale"
				style="overflow: hidden; border: none;" width="100%;"
				class="animate-bottom"></iframe>
		</div>

		<!-- Modal change password -->
		<div id="changePassModal" tabindex="-1" role="dialog"
			aria-labelledby="modalLabelDelete" aria-hidden="true"
			class="modal fade text-left">
			<div role="document" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="titleChangePass">Thay đổi mật
							khẩu</h5>
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="" class="mt-4">
							<div class="form-group mb-4">
								<label for=""><span>Mã nhân viên</span></label> <input
									type="text" name="idemployee" disabled class="form-control">
							</div>
							<div class="form-group mb-4">
								<label for=""><span>Tên nhân viên</span></label> <input
									type="text" name="nameemployee" class="form-control">
							</div>
							<div class="form-group mb-4">
								<label for=""><span>Mật khẩu cũ</span></label> <input
									type="password" name="oldpass" class="form-control">
							</div>
							<div class="form-group mb-4">
								<label for=""><span>Mật khẩu mới</span></label> <input
									type="password" name="newpass" class="form-control">
							</div>
							<div class="form-group mb-4">
								<label for=""><span>Nhập lại mật khẩu</span></label> <input
									type="password" name="repass" class="form-control">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary btnModalDelete">Chấp
							nhận</button>
						<button type="submit" class="btn btn-primary btnModalDelete">Reset</button>
						<button type="button" class="btn btn-secondary btnModalDelete"
							data-dismiss="modal">Trở về</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- JavaScript files-->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="resources/vendor/chart.js/Chart.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap-notify.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script src="resources/Js/front.js"></script>
</body>

</html>