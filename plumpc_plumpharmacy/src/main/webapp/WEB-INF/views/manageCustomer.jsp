<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Quản lý khách hàng</title>
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
								<h3 class="h6 text-uppercase mb-0">QUẢN LÝ KHÁCH HÀNG</h3>
							</div>
							<div class="card-body">
								<div class="row">

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
										<div class="form-group">
											<label class="form-control-label">Sắp xếp: </label> <select
												name="account" class="form-control">
												<option value="1">Mã khách hàng</option>
												<option value="2">Nhóm khách hàng</option>
												<option value="3">Tên khách hàng</option>
												<option value="4">Địa chỉ</option>
												<option value="5">Điện thoại</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-6">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Kết quả</h6>
										</div>
										<div class="card-body">
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th>Mã khách hàng</th>
														<th>Tên khách hàng</th>
														<th>Số điện thoại</th>
														<th>Địa chỉ</th>
														<th colspan="2">Chức năng</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="data" items="${cutomerFindAdd}">
														<!--Modal delete-->
														<div id="modalDelete_${data.getId()}" class="modal fade"
															tabindex="-1" role="dialog"
															aria-labelledby="myModalLabel" aria-hidden="true">
															<div role="document " class="modal-dialog ">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="titleDelete">Xóa dữ
																			liệu</h5>
																		<button type="button " data-dismiss="modal"
																			aria-label="Close" class="close">
																			<span aria-hidden="true">×</span>
																		</button>
																	</div>
																	<form:form action="deletecustomer" method="post"
																		modelAttribute="CustomerEdit">

																		<div class="modal-body">
																			<p class="pDelete">Bạn có chắc muốn xóa nhóm
																				thuốc có tên : ${data.getName()} không?</p>
																		</div>
																		<div class="modal-footer justify-content-center ">
																			<button type="submit"
																				class="btn btn-danger btnModalDelete">Xóa</button>
																			<button type="button"
																				class="btn btn-secondary btnModalDelete"
																				data-dismiss="modal">Hủy</button>
																		</div>
																		<form:input id="idNewCustomer" type="hidden"
																			class="form-control" value="${data.getId()}"
																			path="id" />
																	</form:form>


																</div>
															</div>
														</div>
														<!-- Modal edit-->
														<div id="editModal_${data.getId()}" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalLabel"
															aria-hidden="true" class="modal fade text-left">
															<div role="document" class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<h4 id="exampleModalLabel" class="modal-title">Thay
																			đổi thông tin khách hàng</h4>
																		<button type="button" data-dismiss="modal"
																			aria-label="Close" class="close">
																			<span aria-hidden="true">×</span>
																		</button>
																	</div>
																	<div class="modal-body">

																		<form:form action="editcustomer" method="post"
																			modelAttribute="CustomerEdit">
																			<div class="col-md-12">
																				<div class="form-group">
																					<form:input id="idNewCustomer" type="text"
																						class="form-control"
																						value="${data.getId().substring(0,6)}"
																						disabled="true" path="id" />
																				</div>
																				<form:input id="idNewCustomer" type="hidden"
																					class="form-control" value="${data.getId()}"
																					path="id" />
																				<div class="form-group">
																					<label class="form-control-label">Tên khách
																						hàng</label>
																					<form:input id="nameNewCustomer" type="text"
																						placeholder="Nhập tên" class="form-control"
																						value="${data.getName()}" path="name" />
																				</div>
																				<div class="form-group">
																					<label class="form-control-label">Số điện
																						thoại</label>
																					<form:input id="phoneNewCustomer" type="number"
																						placeholder="Nhập tên" class="form-control"
																						value="${data.getPhone()}" path="phone" />

																				</div>
																				<div class="form-group">
																					<label class="form-control-label">Địa chỉ </label>
																					<form:input id="addressNewCustomer" type="text"
																						placeholder="Nhập tên" class="form-control"
																						value="${data.getAddress()}" path="address" />

																				</div>
																			</div>
																			<div class="form-groub float-right">
																				<button class="btn btn-success" type="submit"
																					id="btnDangNhap">Hoàn Thành</button>


																			</div>
																			<button type="button" data-dismiss="modal"
																				class="btn btn-secondary">Trở về</button>
																		</form:form>
																	</div>
																	<div class="modal-footer"></div>
																</div>
															</div>
														</div>
														<tr>
															<th>${data.getId().substring(0,6)}</th>
															<th>${data.getName()}</th>
															<th>${data.getPhone()}</th>
															<th>${data.getAddress()}</th>
															<th><a href="#editModal_${data.getId()}"
																class="btn btn-primary btnFunc" data-toggle="modal"><i
																	class="material-icons" data-toggle="tooltip"
																	title="Sửa thông tin">&#xE254;</i> </a> <a
																href="#modalDelete_${data.getId()}"
																class="btn btn-danger btnFunc" data-toggle="modal">
																	<i class="material-icons" data-toggle="tooltip"
																	title="Xóa">&#xE872;</i>
															</a></th>

														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<div class="row justify-content-end">
										<div class="col-md-auto">
											<div class="col-md-12 form-group right bolder">
												<button type="button" data-toggle="modal"
													data-target="#myModal" class="btn btn-primary">
													<i class="fa fa-plus iconFunc"></i>Thêm khách hàng
												</button>
											</div>
										</div>
									</div>
									<!-- Modal-->
									<div id="myModal" tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLabel" aria-hidden="true"
										class="modal fade text-left">
										<div role="document" class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 id="exampleModalLabel" class="modal-title">Thông
														tin khách hàng</h4>
													<button type="button" data-dismiss="modal"
														aria-label="Close" class="close">
														<span aria-hidden="true">×</span>
													</button>
												</div>
												<div class="modal-body">
													<form:form action="createcustomer" method="post"
														modelAttribute="CustomerEdit">

														<div class="form-group">
															<form:input id="idNewCustomer" type="text"
																class="form-control" value="" disabled="true" path="id" />
														</div>

														<div class="form-group">
															<label class="form-control-label">Tên khách hàng</label>
															<form:input id="nameNewCustomer" type="text"
																placeholder="Nhập tên" class="form-control" value=""
																path="name" />
														</div>
														<div class="form-group">
															<label class="form-control-label">Số điện thoại</label>
															<form:input id="phoneNewCustomer" type="number"
																placeholder="Nhập tên" class="form-control" value=""
																path="phone" />

														</div>
														<div class="form-group">
															<label class="form-control-label">Địa chỉ </label>
															<form:input id="addressNewCustomer" type="text"
																placeholder="Nhập tên" class="form-control" value=""
																path="address" />

														</div>
												</div>
												<div class="modal-footer">
													<button type="submit" id="btnDangNhap"
														class="btn btn-primary">Thêm</button>

													<button type="button" data-dismiss="modal"
														class="btn btn-secondary">Trở về</button>
												</div>
												</form:form>
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
