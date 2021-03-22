<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- theme stylesheet-->
<link rel="stylesheet" href="resources/Css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="resources/Css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="resources/images/logo.png">
<script src="resources/Js/managementInventory_MerchandiseReturn.js"></script>
</head>
<body>
	<div class="page-holder w-100 d-flex flex-wrap">
		<div class="container-fluid px-xl-2">
			<section class="py-2">
				<div class="col-lg-12 mb-5">
					<div class="card">
						<div class="card-header">
							<h3 class="h6 text-uppercase mb-0">HÓA ĐƠN XUẤT KHO</h3>
						</div>
						<div class="card-body">
							<form class="form-group">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Nhân viên : </label> <input
													type="text" class="form-control" value="Nhân viên A"
													readonly>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Loại hóa đơn</label> <select
													name="account" id="selectFunction" class="form-control">
													<option value=null disabled selected>Chọn Loại Hóa
														Đơn</option>
													<option value="1">Xuất Hoàn Trả</option>
													<option value="2">Xuất Hủy</option>
												</select>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label" id="selectSupplier">Nhà
													cung cấp</label>
													
													<select id="selectSupplier" class="form-control">
														<%@ include file="ComboBox/comboBoxSupplier.jsp"%>
														<option value="1">Xuất Hoàn Trả</option>
												</select>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Địa Chỉ NCC:</label> <input
													type="text" class="form-control" id="labelAddress" readonly>
											</div>
										</div>

									</div>

									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Ngày lập</label> <input
													type="date" placeholder="Ngày Lập" class="form-control">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Lý do</label> <input
													type="text" placeholder="Lý Do" class="form-control">
											</div>
										</div>

									</div>
									<div class="card-body ">
										<div class="card">
											<div class="card-header ">
												<h6 class="text-uppercase mb-0 ">Danh sách thuốc</h6>
											</div>
											<div class="card-body ">
												<table
													class="table  table-striped table-hover card-text border">
													<thead>
														<tr>
															<th>Tên Thuốc</th>
															<th>Đơn Vị Tính</th>
															<th>Số Lượng</th>
															<th>Đơn Giá</th>
															<th>%CK</th>
															<th>Tiền CK</th>
															<th>VAT</th>
															<th>Thành Tiền</th>
															<th>Hạn Dùng</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row">Aerius (0.5mg/ml)</th>
															<td>Chai</td>
															<td>1</td>
															<td>50.000 VNĐ</td>
															<td>5 %</td>
															<td>2.500 VNĐ</td>
															<td>2.500 VNĐ</td>
															<td>2.500 VNĐ</td>
															<td>22/12/2021</td>
														<tr>
															<th scope="row">Aerius (0.5mg/ml)</th>
															<td>Chai</td>
															<td>1</td>
															<td>50.000 VNĐ</td>
															<td>5 %</td>
															<td>2.500 VNĐ</td>
															<td>2.500 VNĐ</td>
															<td>2.500 VNĐ</td>
															<td>22/12/2021</td>
															</td>
														<tr>
															<th scope="row">Aerius (0.5mg/ml)</th>
															<td>Chai</td>
															<td>1</td>
															<td>50.000 VNĐ</td>
															<td>5 %</td>
															<td>2.500 VNĐ</td>
															<td>2.500 VNĐ</td>
															<td>2.500 VNĐ</td>
															<td>22/12/2021</td>
													</tbody>
												</table>

											</div>
										</div>

									</div>
									<div class="form-group" style="float: right;">
										<li class="list-inline-item">
											<button class=" btn btn-primary btn btn-primary"
												type="submit" data-toggle="tooltip" data-placement="top">Hoàn
												Tất</button>
										</li>
									</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
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
	<script src="resources/Js/managementInventory_MerchandiseReturn.js"></script>
	<script src="resources/Js/managementInventory_MerchandiseReturn.js"></script>

</body>
</html>