<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<title>Thông tin thuốc</title>
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

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap"
	rel="stylesheet">
<script src="resources/Js/inventoryManagement.js"></script>
</head>
<body>

	<form>
		<div class="page-holder w-100 d-flex flex-wrap">
			<div class="container-fluid px-xl-2">
				<section class="py-2">
					<!-- Form  -->
					<div class="col-lg mb-5 ">
						<div class="card">
							<div class="card-header">
								<h3 class="h6 text-uppercase mb-0">Nhóm thuốc</h3>
							</div>
							<div class="card-body">

								<div class="col-lg-12 mb-6">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Kết quả</h6>
										</div>
										<div class="card-body">
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th style="width: 15%;">Mã nhóm thuốc</th>
														<th style="width: 45%;">Tên nhóm thuốc</th>
														<th style="width: 40%;" colspan="2">Chức Năng</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach var="data" items="${drugClassificationFindAdd}">

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
																	<form:form action="deletedrugGroup" method="post"
																		modelAttribute="DrugClassificationEdit">

																		<div class="modal-body">
																			<p class="pDelete">Bạn có chắc muốn xóa nhóm
																				thuốc có tên : ${data.getName()} không?</p>
																		</div>

																		<form:input id="idNewDrugGroup" type="hidden"
																			class="form-control" value="${data.getId()}"
																			path="id" />

																		<div class="modal-footer justify-content-center ">
																			<button type="submit"
																				class="btn btn-danger btnModalDelete">Xóa</button>
																			<button type="button"
																				class="btn btn-secondary btnModalDelete"
																				data-dismiss="modal">Hủy</button>
																		</div>
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
																			đổi thông tin nhóm thuốc</h4>
																		<button type="button" data-dismiss="modal"
																			aria-label="Close" class="close">
																			<span aria-hidden="true">×</span>
																		</button>
																	</div>
																	<div class="modal-body">

																		<form:form action="editdrugGroup" method="post"
																			modelAttribute="DrugClassificationEdit">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label class="form-control-label">Nhập tên
																						nhóm thuốc mới</label>
																					<form:input id="nameNewDrugGroup" type="text"
																						placeholder="Nhập tên" class="form-control"
																						value="${data.getName()}" path="name" />

																				</div>
																				<form:input id="idNewDrugGroup" type="hidden"
																					class="form-control" value="${data.getId()}"
																					path="id" />
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
							</div>
							<div class="modal-footer">
								<div class="form-group row">
									<div class="col-md-auto text-right">
										<div class="col-md-12 form-group">
											<button type="button" data-toggle="modal"
												data-target="#modalAddDrugGroup" class="btn btn-primary">
												<i class="fa fa-plus iconFunc"></i> Thêm nhóm thuốc
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



		<!--Modal addDrugGroup-->
		<div id="modalAddDrugGroup" class="modal fade" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div role="document " class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Thêm nhóm thuốc</h5>
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form:form action="adddrugGroup" method="post"
							modelAttribute="newDrugClassificationEdit">

							<label class="form-control-label">Tên nhóm thuốc mới</label>
							<form:input id="nameNewDrugGroup" type="text"
								placeholder="Nhập tên" class="form-control" value="" path="name" />
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-plus iconFunc"></i>Thêm
								</button>
							</div>
						</form:form>

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
	<script src="resources/Js/drugGroup.jsp"></script>

</body>
</html>

