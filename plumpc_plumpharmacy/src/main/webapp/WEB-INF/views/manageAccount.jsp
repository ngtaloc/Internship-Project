<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Quản lý tài khoản</title>
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
	<form>
		<div class="page-holder w-100 d-flex flex-wrap">
			<div class="container-fluid px-xl-2">
				<section class="py-2">
					<div class="col-lg-12 mb-5">
						<div class="card">
							<div class="card-header">
								<h3 class="h6 text-uppercase mb-0">QUẢN LÝ TÀI KHOẢN</h3>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Lọc theo: </label> <select
												name="account" class="form-control">
												<option value="1">Mã nhân viên</option>
												<option value="2">Tên nhân viên</option>
												<option value="3">Tên tài khoản</option>
												<option value="4">Loại tài khoản</option>

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
										<div class="form-group">
											<label class="form-control-label">Sắp xếp: </label> <select
												name="account" class="form-control">
												<option value="1">Mã nhân viên</option>
												<option value="2">Tên nhân viên</option>
												<option value="3">Tên tài khoản</option>
												<option value="4">Loại tài khoản</option>
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
														<th>Mã nhân viên</th>
														<th>Tên nhân viên</th>
														<th>Tên tài khoản</th>
														<th>Loại tài khoản</th>
														<th>Chức năng</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="data" items="${userFindAdd}">
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
																	<div class="modal-body">
																		<p class="pDelete">Bạn có chắc muốn xóa tài khoản
																			có tên : ${data.getUserName()} không?</p>
																	</div>
																	<div class="modal-footer justify-content-center ">
																		<form:form action="deleteUsers" method="post"
																			modelAttribute="UserEdits">
																			<button type="submit"
																				class="btn btn-danger btnModalDelete">Xóa</button>
																			<form:input id="iddeleteUser" type="hidden"
																				class="form-control" value="${data.getId()}"
																				path="id" />
																		</form:form>
																		<button type="button"
																			class="btn btn-secondary btnModalDelete"
																			data-dismiss="modal">Hủy</button>
																	</div>
																</div>
															</div>
														</div>
														<!-- Modal Edit-->
														<div id="editModal_${data.getId()}" tabindex="-1"
															role="dialog" aria-labelledby="exampleModalLabel"
															aria-hidden="true" class="modal fade text-left">
															<div role="document" class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<h4 id="exampleModalLabel" class="modal-title">Thay
																			đổi thông tin tài khoản</h4>
																		<button type="button" data-dismiss="modal"
																			aria-label="Close" class="close">
																			<span aria-hidden="true">×</span>
																		</button>
																	</div>
																	<form:form action="editUsers" method="post"
																		modelAttribute="UserEdits">
																		<div class="modal-body">
																			<div class="form-group">
																				<form:input id="idEditUser" type="text"
																					class="form-control" value="${data.getId()}"
																					path="id" />
																			</div>
																			<div class="form-group">
																				<label>Tên nhân viên</label>
																				<form:input id="nameUser" type="text"
																					class="form-control" value="${data.getName()}"
																					path="name" readonly="true" />
																			</div>
																			<div class="form-group">
																				<form:input id="nameNewCustomer" type="hidden"
																					class="form-control" value="${data.getAddress()}"
																					path="address" />
																			</div>
																			<div class="form-group">
																				<form:input id="nameNewCustomer" type="hidden"
																					class="form-control" value="${data.getPhone()}"
																					path="phone" />
																			</div>
																			<div class="form-group">
																				<form:input id="nameNewCustomer" type="hidden"
																					class="form-control" value="${data.getDateJoin()}"
																					path="dateJoin" />
																			</div>
																			<div class="form-group">
																				<label>Tên tài khoản</label>
																				<form:input id="nameNewCustomer" type="text"
																					class="form-control" value="${data.getUserName()}"
																					path="userName" />
																			</div>
																			<div class="form-group">
																				<form:input id="password" type="hidden"
																					class="form-control" value="${data.getPassword()}"
																					path="password" />
																			</div>
																			<div class="form-group">
																				<label>Chức vụ</label>
																				<form:select name="decentralization"
																					id="decentralization" class="form-control"
																					path="decentralization" value="">
																					 <%@ include file="ComboBox/comboBoxDecentralization.jsp" %>
																				</form:select>

																			</div>
																		</div>
																		<div class="modal-footer">
																			<button type="submit" class="btn btn-primary">Hoàn
																				thành</button>
																			<button type="button" data-dismiss="modal"
																				class="btn btn-secondary">Trở về</button>
																		</div>
																	</form:form>
																</div>
															</div>
														</div>
														<!-- Modal change password -->
														<div id="changePassModal" tabindex="-1" role="dialog"
															aria-labelledby="modalLabelDelete" aria-hidden="true"
															class="modal fade text-left">
															<div role="document" class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="titleChangePass">Thay
																			đổi mật khẩu</h5>
																		<button type="button" data-dismiss="modal"
																			aria-label="Close" class="close">
																			<span aria-hidden="true">×</span>
																		</button>
																	</div>
																	<div class="modal-body">
																		<form action="" class="mt-4">
																			<div class="form-group mb-4">
																				<label for=""><span>Mã nhân viên</span></label> <input
																					type="text" name="idemployee" disabled
																					class="form-control">
																			</div>
																			<div class="form-group mb-4">
																				<label for=""><span>Tên nhân viên</span></label> <input
																					type="text" name="nameemployee"
																					class="form-control">
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
																				<label for=""><span>Nhập lại mật khẩu</span></label>
																				<input type="password" name="repass"
																					class="form-control">
																			</div>
																		</form>
																	</div>
																	<div class="modal-footer">
																		<button type="submit"
																			class="btn btn-primary btnModalDelete">Chấp
																			nhận</button>																	
																		<button type="button"
																			class="btn btn-secondary btnModalDelete"
																			data-dismiss="modal">Trở về</button>
																	</div>
																</div>
															</div>
														</div>
														<tr>
															<th>${data.getId().substring(0,6)}</th>
															<td>${data.getName()}</td>
															<td>${data.getUserName()}</td>
															<td>${decentralizationDAO.findById(data.getDecentralization()).getName()}</td>
															<td><a href="#editModal_${data.getId()}"
																class="btn btn-primary btnFunc" data-toggle="modal"><i
																	class="material-icons" data-toggle="tooltip"
																	title="Sửa đổi thông tin tài khoản">&#xE254;</i></a> <a
																href="#changePassModal"
																class="btn btn-primary btnFunc" data-toggle="modal"><i
																	class="material-icons" data-toggle="tooltip"
																	title="Đổi mật khẩu">lock_open</i></a> <a
																href="#modalDelete_${data.getId()}"
																class="btn btn-danger" data-toggle="modal"><i
																	class="material-icons" data-toggle="tooltip"
																	title="Xóa">&#xE872;</i> </a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
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
	<script src="resources/Js/inventoryManagement.js"></script>
</body>
</html>