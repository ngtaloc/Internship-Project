<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Quản lý thông tin toa thuốc</title>
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
</head>
<body>
	<form action=" ">
		<div class="page-holder w-100 d-flex flex-wrap">
			<div class="container-fluid px-xl-2">
				<section class="py-2">
					<div class="col-lg-12 mb-5">
						<div class="card">
							<div class="card-header">
								<h3 class="h6 text-uppercase mb-0">Bán theo đơn</h3>
							</div>
							<!--Bộ lọc-->
							<div class="card-body">
								<!--Hàng 1-->
								<div class="row justify-content-center">
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Số phiếu: </label> <input
												type="text" class="form-control" readonly>
										</div>
									</div>
									<div class="col-md-4">
										<div class="row">
											<div class="col-md-9">
												<div class="form-group">
													<label class="form-control-label">Khách hàng: </label>
													<div class="select mb-3">
														<select name="" class="form-control">
															<option>Nguyễn Văn Quỳnh</option>
															<option>Trần Thắm</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-1">
												<!--Thêm thông tin khách hàng-->
												<div class="form-group btnCustom">
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#modalAddNewCustomer">
														<i class="fa fa-plus" aria-hidden="true"></i>
													</button>
												</div>
												<!--Modal thêm mới khách hàng-->
												<div id="modalAddNewCustomer" tabindex="-1" role="dialog"
													aria-labelledby="modalLabelDelete" aria-hidden="true"
													class="modal fade text-left">
													<div role="document" class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">Thông tin khách hàng</h5>
																<button type="button" data-dismiss="modal"
																	aria-label="Close" class="close" id="closeSubModal">
																	<span aria-hidden="true">×</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="form-group">
																	<label class="form-control-label">Nhóm khách
																		hàng (*): </label>
																	<div class="select mb-3">
																		<select name="" class="form-control" required>
																			<option>Khách theo đơn</option>
																			<option>Khách theo...</option>
																		</select>
																	</div>
																</div>
																<div class="form-group">
																	<label class="form-control-label">Mã khách
																		hàng: </label> <input type="text" class="form-control"
																		readonly>
																</div>
																<div class="form-group">
																	<label class="form-control-label">Tên khách
																		hàng (*): </label> <input type="text" class="form-control"
																		required>
																</div>
																<div class="form-group">
																	<label class="form-control-label">Địa chỉ: </label> <input
																		type="text" class="form-control">
																</div>
																<div class="row">
																	<div class="form-group col-md-6">
																		<label for="phone" class="form-control-label">Điện
																			thoại (*): </label> <input type="tel" class="form-control"
																			id="phone" name="phone" pattern="[0-9]{10}" required>
																		<small class="invalid-feedback ml-3" id="showMessage">Hãy
																			nhập lại số điện thoại</small>
																	</div>
																	<div class="form-group col-md-6">
																		<label class="form-control-label">Tuổi: </label> <input
																			type="number" class="form-control" id="checkAge"
																			min="5"> <small class="invalid-feedback ml-3"
																			id="showMessageAge">Hãy nhập lại tuổi</small>
																	</div>
																</div>


															</div>
															<div class="modal-footer">
																<span class="mr-auto">(*) Thông tin bắt buộc</span>
																<button type="submit" class="btn btn-primary">Thêm</button>
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Hủy</button>
															</div>
														</div>
													</div>
												</div>
												<!--Kết thúc Modal thêm mới khách hàng-->
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Tên bác sĩ: </label> <input
												type="text " class="form-control">
										</div>
									</div>
								</div>
								<!--Hàng 2-->
								<div class="row justify-content-center">
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Nhân viên</label> <input
												type="text " class="form-control" readonly>
										</div>
										<div class="form-group">
											<label class="form-control-label">Ngày lập: </label> <input
												type="date" class="form-control" id="checkDate">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="note">Triệu chứng</label>
											<textarea class="form-control rounded-0" id="note" rows="5"></textarea>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Địa chỉ BS: </label> <input
												type="text " class="form-control ">
										</div>
										<div class="form-group">
											<label class="form-control-label">Chuẩn đoán: </label> <input
												type="text" class="form-control">
										</div>
									</div>

								</div>
							</div>
							<!--Thông tin bán theo đơn-->
							<div class="card-body">
								<div class="card">
									<div class="card-header">
										<div class="row">
											<div class="col-md-3">
												<h6 class="text-uppercase mb-0" style="margin-top: 10px;">Danh
													sách thuốc</h6>
											</div>
											<div class="col-md-2 offset-md-7">
												<button type="button" data-toggle="modal"
													data-target="#openAddDrug" class="btn btn-primary">
													<i class="fa fa-plus iconFunc"></i>Thêm thuốc
												</button>
											</div>
										</div>
									</div>
									<div class="card-body">
										<table class="table table-striped table-hover card-text">
											<thead>
												<tr>
													<th>Tên thuốc</th>
													<th>Đơn vị tính</th>
													<th>Số lượng</th>
													<th>Đơn giá</th>
													<th>Thành tiền</th>
													<th>Chức năng</th>
												</tr>
											</thead>
											<tbody class="drugList">
												<tr class="R1">
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
												</tr>
												<tr>
													<th scope="row">ABINTA</th>
													<td>Lọ</td>
													<td>2</td>
													<td>12000</td>
													<td>24000</td>
													<td>
														<!--Xóa dữ liệu ở một hàng -- gọi modal Delete-->
														<button type="button" class="btn btn-danger" title="Xóa"
															data-toggle="modal" data-target="#modalDelete">
															<i class="fa fa-trash"></i>
														</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row ">
									<div class="col-md-3 offset-md-9 btnCustom">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">Tổng tiền</span>
											</div>
											<input type="text" class="form-control" disabled>
										</div>
									</div>
								</div>
								<!--Chức năng: Thanh toán, In phiếu-->
								<div class="row justify-content-end">
									<div class="col-md-auto">
										<div class="form-group btnCustom">
											<button type="button" class="btn btn-primary" id="payment">
												<i class="far fa-credit-card iconFunc"></i>Thanh toán
											</button>
										</div>
									</div>
									<div class="col-md-auto">
										<div class="form-group btnCustom" id="printOrder">
											<button type="button" class="btn btn-primary">
												<i class="fa fa-print iconFunc"></i>In phiếu
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

		<!-- Modal của Thêm thuốc-->
		<div id="openAddDrug" tabindex="-1" role="dialog"
			aria-labelledby="modalLabel" aria-hidden="true"
			class="modal fade text-left">
			<div role="document" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 id="modalLabel" class="modal-title">Thêm thuốc</h4>
						<button type="button" aria-label="Close" data-dismiss="modal"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<form action="">
						<div class="modal-body">
							<div class="form-group">
								<div class="form-group">
									<label for="nameDrug" class="form-control-label">Tên
										thuốc:</label> <input id="nameDrug" name="nameDrug" type="text"
										class="form-control" required>
								</div>
							</div>
							<div class="form-group">
								<div class="form-group ">
									<label class="form-control-label">Đơn vị tính: </label> <input
										type="text" class="form-control" id="dvt" required>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-auto">
										<div class="form-group ">
											<label class="form-control-label">Số lượng: </label> <input
												type="number" id="numberDrug" class="form-control" min="1"
												required>
										</div>
									</div>
									<div class="col-md-auto">
										<div class="form-group ">
											<label class="form-control-label">Đơn giá: </label> <input
												type="number" id="money" class="form-control" min="1000"
												required>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="form-group">
								<button type="button" class="btn btn-primary" id="addDrugList">Hoàn
									tất</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Trở về</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- Kết thúc Modal của thêm thuốc-->
		
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
	<script src="resources/Js/manageSale.js"></script>


</body>
</html>