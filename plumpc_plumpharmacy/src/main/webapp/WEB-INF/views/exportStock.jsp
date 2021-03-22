<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Quản lý xuất kho</title>
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
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
	<form>
		<div class="page-holder w-100 d-flex flex-wrap">
			<div class="container-fluid px-xl-2">
				<section class="py-2">
					<div class="col-lg-12 mb-5">
						<div class="card">
							<div class="card-header">
								<h3 class="h6 text-uppercase mb-0">QUẢN LÝ XUẤT KHO</h3>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Từ ngày: </label> <input
												type="date" class="form-control" id="datepicker1">
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Đến ngày: </label> <input
												type="date" class="form-control" id="datepicker2"
												onblur="timecompare();"> <span id="error2"></span>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Từ giờ: </label> <input
												type="time" class="form-control" id="timepicker1">
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Đến giờ: </label> <input
												type="time" class="form-control" id="timepicker2"
												onblur="timecompare();"> <span id="error3"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Sắp xếp theo: </label> <select
												name="account" class="form-control">
												<option value="1">Xuất hoàn trả</option>
												<option value="2">Xuất hủy</option>
											</select>
										</div>
									</div>
									<div class="col-md-1 offset-md-6">
										<div class="form-group">
											<button class="btn btn-primary" type="submit" id="head"><i class="fa fa-eye iconFunc"></i>Xem</button>
										</div>
									</div>
								</div>
								<hr>
								<div class="col-lg-12 mb-6">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Kết quả</h6>
										</div>
										<div class="card-body">
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th>Mã HĐ</th>
														<th>Ngày lập</th>
														<th>Giờ lập</th>
														<th>Người lập</th>
														<th>Tổng tiền</th>
														<th>Tên nhà cung cấp</th>
														<th>Lý do hoàn trả</th>
														<th>Chức năng</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>HDN001</td>
														<td>20/01/2015</td>
														<td>02:03 CH</td>
														<td>Nguyễn Văn A</td>
														<td>500000</td>
														<td>Công ty dược phẩm</td>
														<td>Thuốc lỗi</td>
														<td><a href="#modalDelete" class="btn btn-danger"
															data-toggle="modal"><i class="material-icons"
																data-toggle="tooltip" title="Xóa">&#xE872;</i></a></td>
													</tr>
													<tr>
														<td>HDN001</td>
														<td>20/01/2015</td>
														<td>02:03 CH</td>
														<td>Nguyễn Văn A</td>
														<td>500000</td>
														<td>Công ty dược phẩm</td>
														<td>Thuốc lỗi</td>
														<td><a href="#modalDelete" class="btn btn-danger"
															data-toggle="modal"><i class="material-icons"
																data-toggle="tooltip" title="Xóa">&#xE872;</i></a></td>
													</tr>
													<tr>
														<td>HDN001</td>
														<td>20/01/2015</td>
														<td>02:03 CH</td>
														<td>Nguyễn Văn A</td>
														<td>500000</td>
														<td>Công ty dược phẩm</td>
														<td>Thuốc lỗi</td>
														<td><a href="#modalDelete" class="btn btn-danger"
															data-toggle="modal"><i class="material-icons"
																data-toggle="tooltip" title="Xóa">&#xE872;</i></a></td>
													</tr>
													<tr>
														<td>HDN001</td>
														<td>20/01/2015</td>
														<td>02:03 CH</td>
														<td>Nguyễn Văn A</td>
														<td>500000</td>
														<td>Công ty dược phẩm</td>
														<td>Thuốc lỗi</td>
														<td><a href="#modalDelete" class="btn btn-danger"
															data-toggle="modal"><i class="material-icons"
																data-toggle="tooltip" title="Xóa">&#xE872;</i></a></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<div class="form-group">
									<button type="button" class="btn btn-primary"
										onclick="openInvoice()">
										<i class="fa fa-plus iconFunc"></i>Thêm hóa đơn xuất kho
									</button>
									<button type="button" class="btn btn-primary"
										data-toggle="modal" id="btnPrint">
										<i class="fa fa-print iconFunc"></i>In phiếu
									</button>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

		<!--Modal delete-->
		<div id="modalDelete" tabindex="-1 " role="dialog"
			aria-labelledby="modalLabelDelete" aria-hidden="true"
			class="modal fade text-left">
			<div role="document " class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="titleDelete">Xóa dữ liệu</h5>
						<button type="button " data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="pDelete">Bạn có chắc muốn xóa trường này không?</p>
					</div>
					<div class="modal-footer justify-content-center ">
						<button type="button" class="btn btn-danger btnModalDelete">Xóa</button>
						<button type="button" class="btn btn-secondary btnModalDelete"
							data-dismiss="modal">Hủy</button>
					</div>
				</div>
			</div>
		</div>
		<!--Kết thúc Modal delete-->
	</form>
	<!-- JavaScript files-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="resources/vendor/chart.js/Chart.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
	<script src="resources/Js/front.js"></script>
	<script src="resources/Js/inventoryManagement.js"></script>
</body>
</html>