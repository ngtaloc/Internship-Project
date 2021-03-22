<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
								<h3 class="h6 text-uppercase mb-0">HÓA ĐƠN NHẬP KHO</h3>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-8">
										<div class="row">
											<div class="col-md-6">
												<div class="row">
													<div class="col-md-9">
														<div class="form-group">
															<label class="form-control-label">Mã nhà cung
																cấp: </label>
															<div class="form-inline">
																<select name="account" class="form-control"
																	id="supplier">
																	<option value="1">Option 1</option>
																	<option value="2">Option 2</option>
																	<option value="3">Option 3</option>
																	<option value="4">Option 4</option>
																</select>
															</div>
														</div>
													</div>
													<div class="col-md-1">
														<button type="button" class="btn btn-primary btnCustom"
															title="Thêm mới nhà cung cấp" id="btnAddSupplier">
															<i class="fa fa-plus iconFunc"></i>
														</button>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="form-control-label">Số HĐ: </label> <input
														type="number" class="form-control" disabled>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="form-control-label">Tên nhà cung cấp:
													</label> <input type="text" class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="form-control-label">Số CT: </label> <input
														type="number" class="form-control" min="0">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="form-control-label">Địa chỉ: </label> <input
														type="text" class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="form-control-label">Ngày lập: </label> <input
														type="date" class="form-control">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="form-control-label">Ghi chú: </label> <input
														type="text" class="form-control">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="form-control-label">Nhân viên: </label> <input
														type="text" class="form-control" disabled>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group" id="abc">
													<label class="form-control-label">Tiền thuốc: </label> <input
														type="number" class="form-control" min="0" id="money"
														onblur="check();"> <span id="error"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="form-control-label">% chiết khấu: </label> <input
														type="number" class="form-control" min="0" id="money1"
														onblur="check();"> <span id="error1"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="form-control-label">Tổng tiền: </label> <input
														type="number" class="form-control" min="0" id="money2"
														onblur="check();"> <span id="error2"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="form-control-label">Thanh toán: </label> <input
														type="number" class="form-control" min="0" id="money3"
														onblur="check();"> <span id="error3"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<label class="form-control-label">Còn lại: </label> <input
														type="number" class="form-control" min="0" id="money4"
														onblur="check();"> <span id="error4"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="line"></div>
								<div class="col-lg-12 mb-6">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Danh sách thuốc</h6>
										</div>
										<div class="card-body">
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th>Tên thuốc</th>
														<th>Đơn vị tính</th>
														<th>Số lượng</th>
														<th>Đơn giá</th>
														<th>% CK</th>
														<th>VAT</th>
														<th>Thành tiền</th>
														<th>Số lô</th>
														<th>Hạn dùng</th>
														<th>Chức năng</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th scope="row"><select name="" class="form-control">
																<option value="" disabled selected></option>
																<option>Viêm họng</option>
																<option>Cảm cúm</option>
														</select></th>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
													</tr>
													<tr>
														<td>ABINTA</td>
														<td>Hộp</td>
														<td>10</td>
														<td>500000</td>
														<td>0</td>
														<td>5</td>
														<td>9837299</td>
														<td>9837299</td>
														<td>03/08/2020</td>
														<td><a href="#deleteModal" class="btn btn-danger"
															data-toggle="modal"><i class="material-icons"
																data-toggle="tooltip" title="Xóa">&#xE872;</i></a></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row justify-content-end">
								<div class="col-md-auto">
									<div class="form-group btnCustom">
										<button type="button" class="btn btn-primary" id="completed">Hoàn
											tất</button>
									</div>
								</div>
								<div class="col-md-auto">
									<div class="form-group btnCustom">
										<button type="button" class="btn btn-secondary">Trở
											về</button>
									</div>
								</div>
							</div>
								</div>
							</div>
							
						</div>
					</div>

				</section>
			</div>
		</div>
		<div id="deleteModal" tabindex="-1" role="dialog"
			aria-labelledby="modalLabelDelete" aria-hidden="true"
			class="modal fade text-left">
			<div role="document" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="titleDelete">Xóa dữ liệu</h5>
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="pDelete">Bạn có chắc muốn xóa trường này không?</p>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="submit" class="btn btn-danger btnModalDelete">Xóa</button>
						<button type="button" class="btn btn-secondary btnModalDelete"
							data-dismiss="modal">Hủy</button>
					</div>
				</div>
			</div>
		</div>
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
	<script src="resources/Js/warehouseReceipt.js"></script>
</body>
</html>
