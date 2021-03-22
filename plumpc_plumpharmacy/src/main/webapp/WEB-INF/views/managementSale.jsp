<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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

	<div class="page-holder w-100 d-flex flex-wrap">
		<div class="container-fluid px-xl-2">
			<section class="py-2">
				<div class="col-lg-12 mb-5">
					<div class="card">
						<div class="card-header">
							<h3 class="h6 text-uppercase mb-0">QUẢN LÝ BÁN HÀNG</h3>
						</div>
						<div class="card-body">
							<form class="form-group">
								<div class="col-md-12">
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Từ ngày</label> <input
													type="date" placeholder="Từ Ngày" class="form-control">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Đến ngày</label> <input
													type="date" placeholder="Đến Ngày" class="form-control">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Từ giờ</label> <input
													type="time" placeholder="Từ Giờ" class="form-control">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Đến giờ</label> <input
													type="time" placeholder="Đến Giờ" class="form-control">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Sắp xếp theo</label> <select
													name="account" class="form-control">
													<option>Mã hóa đơn</option>
													<option>Tên khách hàng</option>
													<option>Ngày lập/ Giờ lập</option>
													<option>Tổng tiền</option>
												</select>
											</div>
										</div>

										<div class="col-md-3 offset-md-6">
											<div class="form-group">
												<button type="submit" class="btn btn-primary" id="seeInfo">
													<i class="fa fa-eye iconFunc"></i>Xem
												</button>
											</div>
										</div>

									</div>
									<hr>

									<div class="col-lg-12 mb-6">
										<div class="card">
											<div class="card-header">
												<h6 class="text-uppercase mb-0">Danh sách hóa đơn</h6>
											</div>
											<div class="card-body">
												<table class="table table-striped table-hover card-text">
													<thead>
														<tr>
															<th>Mã Hóa Đơn</th>
															<th>Tên Khách Hàng</th>
															<th>Ngày Lập</th>
															<th>Giờ Lập</th>
															<th>Người Lập</th>
															<th>Tổng Tiền</th>
															<th>Chức năng</th>

														</tr>
													</thead>
													<tbody>
														<c:forEach var="data" items="${managementSaleFindAdd}">
															<tr>
																<th scope="row">${data.getId().substring(0,6)}</th>
																<td>${data.getCustomerId()}</td>
																<td>${data.getInitializationTime()}</td>
																<td></td>
																<td>${data.getUser()}</td>
																<td></td>
																<td><button type="button"
																		class="btn btn-primary btnFunc">
																		<i class="material-icons" data-toggle="tooltip"
																			title="In phiếu">local_printshop</i>
																	</button>
																	<button type="button" data-toggle="modal"
																		data-target="#deleteModal_${data.getId()}"
																		class="btn btn-danger">
																		<i class="material-icons" title="Xóa">delete</i>
																	</button></td>
															</tr>
															<!-- Modal delete -->
															<div id="deleteModal_${data.getId()}" tabindex="-1"
																role="dialog" aria-labelledby="modalLabelDelete"
																aria-hidden="true" class="modal fade text-left">
																<div role="document" class="modal-dialog">
																	<form:form action="deleteManagementSale" method="post"
																		modelAttribute="ManagementSaleEdit">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="titleDelete">Xóa dữ
																					liệu</h5>
																				<button type="button" data-dismiss="modal"
																					aria-label="Close" class="close">
																					<span aria-hidden="true">×</span>
																				</button>
																			</div>
																			<div class="modal-body">
																				<p class="pDelete">Bạn có chắc muốn xóa trường
																					này không?</p>
																			</div>
																			<form:input id="idInvoice" type="hidden"
																				class="form-control" value="${data.getId()}"
																				path="id" />
																			<div class="modal-footer justify-content-center">
																				<button type="submit"
																					class="btn btn-danger btnModalDelete">Xóa</button>
																				<button type="button"
																					class="btn btn-secondary btnModalDelete"
																					data-dismiss="modal">Hủy</button>
																			</div>
																		</div>
																	</form:form>
																</div>
															</div>

														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="resources/vendor/chart.js/Chart.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
</body>
</html>