<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
								<h3 class="h6 text-uppercase mb-0">QUẢN LÝ THÔNG TIN TOA
									THUỐC</h3>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Lọc theo: </label> <select
												name="account" class="form-control">
												<option value="1">Mã thuốc</option>
												<option value="2">Tên thuốc</option>
												<option value="3">Hoạt chất</option>
												<option value="4">Giá nhập</option>
												<option value="5">Giá bán lẻ</option>
												<option value="6">Giá bán sỉ</option>
											</select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group" id="findForm">
											<div class="input-group mb-4">
												<input type="text" placeholder="Tìm kiếm"
													aria-label="Recipient's username"
													aria-describedby="button-addon2" class="form-control">
												<div class="input-group-append">
													<button id="button-addon2" type="button"
														class="btn btn-primary">
														<i class="fa fa-search iconFunc"></i>Lọc kết quả
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<label class="form-control-label">Sắp xếp: </label>
										<div class="form-group">
											<select name="account" class="form-control">
												<option value="0">Mã toa thuốc</option>
												<option value="1">Tên toa</option>
												<option value="2">Đối tượng</option>
												<option value="3">Triệu chứng</option>
											</select>
										</div>
									</div>
								</div>
								<div class="line"></div>
								<div class="col-lg-12 mb-6">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Kết quả</h6>
										</div>
										<div class="card-body">
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th>Mã toa thuốc</th>
														<th>Tên toa thuốc</th>
														<th>Đối tượng</th>
														<th>Triệu chứng</th>
														<th>Ghi chú</th>
														<th colspan="2">Chức năng</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>T001</td>
														<td>Bổ</td>
														<td>Mật ong</td>
														<td>Hộp</td>
														<td>Lọ</td>
														<td><a href="#editModal"
															class="btn btn-primary btnFunc" data-toggle="modal"><i
																class="material-icons" data-toggle="tooltip"
																title="Sửa thông tin">&#xE254;</i></a> <a
															href="#deleteModal" class="btn btn-danger btnFunc"
															data-toggle="modal"> <i class="material-icons"
																data-toggle="tooltip" title="Xóa">&#xE872;</i></a></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<div class="row justify-content-end">
									<div class="col-md-auto">
										<div class="col-md-12 form-group right bolder">
											<button type="button" data-toggle="modal"
												data-target="#myModal" class="btn btn-primary">
												<i class="fa fa-plus iconFunc"></i>Thêm toa thuốc
											</button>
										</div>
									</div>
								</div>
								<!-- Modal-->
								<div id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="exampleModalLabel" aria-hidden="true"
									class="modal fade text-left">
									<div role="document" class="modal-dialog">
										<div class="modal-content" style="width: 600px">
											<div class="modal-header">
												<h4 id="exampleModalLabel" class="modal-title">Thông
													tin toa thuốc</h4>
												<button type="button" data-dismiss="modal"
													aria-label="Close" class="close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">
												<h4 id="exampleModalLabel" class="modal-title"
													style="text-align: center;">ĐƠN THUỐC</h4>
												<form>
													<div class="form-group">
														<label>Tên đơn thuốc</label> <input type="text"
															class="form-control" required>
													</div>
													<div class="form-group">
														<label>Triệu chứng</label> <input type="text"
															class="form-control" required>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label>Đối tượng</label> <select name="account"
																	class="form-control">
																	<option value="1">Trẻ em</option>
																	<option value="2">Người lớn</option>
																	<option value="3">Phụ nữ mang thai</option>
																</select>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label>Số ngày uống</label> <input type="number" min="0"
																	class="form-control" required>
															</div>
														</div>
													</div>

													<div class="col-md-12 form-group">
														<div class="form-group">
															<label class="h6 scheduler-border">Chỉ định</label>
															<button type="button" class="btn btn-primary"
																id="addDrug" style="float: right">
																<i class="fa fa-plus iconFunc"></i>Thêm thuốc
															</button>
														</div>
														<div class="control-group">
															<table class="table card-text">
																<tbody id="drug">
																	<tr>
																		<th scope="row" id="numericalOrder" rowspan="2">1</th>
																		<td style="width: 50%"><select name=""
																			class="form-control" id="chooseMedicine" required>
																				<option disabled selected>Chọn thuốc</option>
																				<option>Viêm họng</option>
																				<option>Cảm cúm</option>
																		</select></td>
																		<td style="width: 30%">
																			<div class="form-group row">
																				<div class="col-sm-7">
																					<input type="number" class="form-control" min="1">
																				</div>
																				<label for="numberMedicine" class="col-form-label">viên</label>
																			</div>
																		</td>
																		<td style="width: 20%">
																			<div class="row justify-content-center">
																				<button type="button" class="btn btn-danger"
																					data-toggle="modal" data-target="#modalDelete">
																					<i class="fa fa-trash"></i>
																				</button>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td colspan="3 ">
																			<div class="form-group row" id="styleNumberMedicine">
																				<label for="numberMedicine " class="col-form-label ">Ngày
																					uống</label>
																				<div class="col-sm-3 ">
																					<input type="number" class="form-control"
																						id="numberMedicine" value="" min="1" max="30"
																						name="">
																				</div>
																				<label for="numberMedicine" class="col-form-label ">lần,
																					mỗi lần</label>
																				<div class="col-sm-3 ">
																					<input type="number" class="form-control"
																						id="numberMedicine" value="" min="1" max="30"
																						name="">
																				</div>
																				<label for="numberMedicine" class="col-form-label">viên</label>
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>

												</form>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary">Thêm</button>
												<button type="button" data-dismiss="modal"
													class="btn btn-secondary">Hủy</button>
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

		<!-- Edit-->
		<div id="editModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true"
			class="modal fade text-left">
			<div role="document" class="modal-dialog">
				<div class="modal-content" style="width: 600px">
					<div class="modal-header">
						<h4 id="exampleModalLabel" class="modal-title">Thông tin toa
							thuốc</h4>
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<h4 id="exampleModalLabel" class="modal-title"
							style="text-align: center;">ĐƠN THUỐC</h4>
						<form>
							<div class="form-group">
								<label>Tên đơn thuốc</label> <input type="text"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label>Triệu chứng</label> <input type="text"
									class="form-control" required>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Đối tượng</label> <select name="account"
											class="form-control">
											<option value="1">Trẻ em</option>
											<option value="2">Người lớn</option>
											<option value="3">Phụ nữ mang thai</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Số ngày uống</label> <input type="number" min="0"
											class="form-control" required>
									</div>
								</div>
							</div>
							<div class="line"></div>
							<div class="form-group">
								<fieldset class="scheduler-border">
									<legend class="h6 scheduler-border">Chỉ định</legend>
									<div class="control-group">
										<table class="table card-text">
											<tbody>
												<tr>
													<th scope="row" id="numericalOrder" rowspan="2">1</th>
													<td style="width: 50%"><select name=""
														class="form-control" id="chooseMedicine" required>
															<option disabled selected>Chọn thuốc</option>
															<option>Viêm họng</option>
															<option>Cảm cúm</option>
													</select></td>
													<td style="width: 20%">
														<div class="form-group row">
															<div class="col-sm-9">
																<input type="number" class="form-control" min="1">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
													<td style="width: 30%">
														<div class="row justify-content-center">
															<button type="button" class="btn btn-danger"
																data-toggle="modal" data-target="#modalDelete">
																<i class="fa fa-trash"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="3 ">
														<div class="form-group row" id="styleNumberMedicine">
															<label for="numberMedicine " class="col-form-label ">Ngày
																uống</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label ">lần,
																mỗi lần</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" id="numericalOrder" rowspan="2">2</th>
													<td style="width: 50%"><select name=""
														class="form-control" id="chooseMedicine" required>
															<option disabled selected>Chọn thuốc</option>
															<option>Viêm họng</option>
															<option>Cảm cúm</option>
													</select></td>
													<td style="width: 20%">
														<div class="form-group row">
															<div class="col-sm-9">
																<input type="number" class="form-control" min="1">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
													<td style="width: 30%">
														<div class="row justify-content-center">
															<button type="button" class="btn btn-danger"
																data-toggle="modal" data-target="#modalDelete">
																<i class="fa fa-trash"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="3 ">
														<div class="form-group row" id="styleNumberMedicine">
															<label for="numberMedicine " class="col-form-label ">Ngày
																uống</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label ">lần,
																mỗi lần</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" id="numericalOrder" rowspan="2">3</th>
													<td style="width: 50%"><select name=""
														class="form-control" id="chooseMedicine" required>
															<option disabled selected>Chọn thuốc</option>
															<option>Viêm họng</option>
															<option>Cảm cúm</option>
													</select></td>
													<td style="width: 20%">
														<div class="form-group row">
															<div class="col-sm-9">
																<input type="number" class="form-control" min="1">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
													<td style="width: 30%">
														<div class="row justify-content-center">
															<button type="button" class="btn btn-danger"
																data-toggle="modal" data-target="#modalDelete">
																<i class="fa fa-trash"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="3 ">
														<div class="form-group row" id="styleNumberMedicine">
															<label for="numberMedicine " class="col-form-label ">Ngày
																uống</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label ">lần,
																mỗi lần</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" id="numericalOrder" rowspan="2">4</th>
													<td style="width: 50%"><select name=""
														class="form-control" id="chooseMedicine" required>
															<option disabled selected>Chọn thuốc</option>
															<option>Viêm họng</option>
															<option>Cảm cúm</option>
													</select></td>
													<td style="width: 20%">
														<div class="form-group row">
															<div class="col-sm-9">
																<input type="number" class="form-control" min="1">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
													<td style="width: 30%">
														<div class="row justify-content-center">
															<button type="button" class="btn btn-danger"
																data-toggle="modal" data-target="#modalDelete">
																<i class="fa fa-trash"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="3 ">
														<div class="form-group row" id="styleNumberMedicine">
															<label for="numberMedicine " class="col-form-label ">Ngày
																uống</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label ">lần,
																mỗi lần</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row" id="numericalOrder" rowspan="2">5</th>
													<td style="width: 50%"><select name=""
														class="form-control" id="chooseMedicine" required>
															<option disabled selected>Chọn thuốc</option>
															<option>Viêm họng</option>
															<option>Cảm cúm</option>
													</select></td>
													<td style="width: 20%">
														<div class="form-group row">
															<div class="col-sm-9">
																<input type="number" class="form-control" min="1">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
													<td style="width: 30%">
														<div class="row justify-content-center">
															<button type="button" class="btn btn-danger"
																data-toggle="modal" data-target="#modalDelete">
																<i class="fa fa-trash"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr>
													<td colspan="3 ">
														<div class="form-group row" id="styleNumberMedicine">
															<label for="numberMedicine " class="col-form-label ">Ngày
																uống</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label ">lần,
																mỗi lần</label>
															<div class="col-sm-3 ">
																<input type="number" class="form-control"
																	id="numberMedicine" value="" min="1" max="30"
																	name="textNumber">
															</div>
															<label for="numberMedicine" class="col-form-label">viên</label>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</fieldset>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Hoàn tất</button>
						<button type="button" data-dismiss="modal"
							class="btn btn-secondary">Hủy</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal delete -->
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
	<script src="resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="resources/vendor/chart.js/Chart.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
	<script src="resources/Js/front.js"></script>
	<script src="resources/Js/medicineInformation.js"></script>
	<script src="resources/Js/manageSale.js"></script>
</body>
</html>
