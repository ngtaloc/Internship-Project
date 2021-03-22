<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thông tin thuốc</title>
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
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap"
	rel="stylesheet">
</head>
<body>
	<form>
		<div class="d-flex align-items-stretch">
			<div class="page-holder w-100 d-flex flex-wrap">
				<div class="container-fluid px-xl-2">
					<section class="py-2">
						<div class="row">
							<!-- Form lọc -->
							<div class="col-lg-12 mb-5">
								<div class="card">
									<div class="card-header">
										<h3 class="h6 text-uppercase mb-0">Danh sách thuốc</h3>
									</div>
									<div class="card-body pb-0 ">
										<form class="form-inline">
											<div class="row">
												<div class="col-md-3 col-6 form-group">
													<label class="form-control-label">Lọc theo: </label> <select
														name="account" class="form-control">
														<option value="1">Mã thuốc</option>
														<option value="2">Nhóm thuốc</option>
														<option value="3">Tên thuốc</option>
														<option value="4">Hoạt chật</option>
														<option value="5">Giá nhập</option>
														<option value="6">Giá bán lẻ</option>
														<option value="7">Giá bán sỉ</option>
													</select>
												</div>
												<div class="col-md-3 col-6 form-group">
													<select name="account" class="form-control"
														style="margin-top: 30px">
														<option value="" disabled selected>- Điều kiện -</option>
														<option value="1">Bằng</option>
														<option value="2">Lớn hơn</option>
														<option value="3">Nhỏ hơn</option>
														<option value="4">Lớn hơn bằng</option>
														<option value="5">Nhỏ hơn bằng</option>
														<option value="6">Khác</option>
														<option value="7">Tất cả</option>
													</select>
												</div>

												<div class="col-md-6 col-6 form-group" id="findForm">
													<div class="input-group mb-4">
														<input type="text" placeholder="Tìm kiếm"
															aria-label="Recipient's username"
															aria-describedby="button-addon2" class="form-control">
														<div class="input-group-append">
															<button id="search" type="button" class="btn btn-primary">
																<i class="fa fa-search iconFunc"></i>Lọc kết quả
															</button>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>

									<!-- Form ds thuốc -->
									<div class="card-body">
										<div class="row ">
											<div class="col-lg-12">
												<div class="card">
													<div class="card-header">
														<h6 class="text-uppercase mb-0">Danh sách thuốc</h6>
													</div>
													<div class="card-body">
														<table class="table table-striped table-hover card-text">
															<thead>
																<tr>
																	<th>Mã thuốc</th>
																	<th>Nhóm thuốc</th>
																	<th scope="col">Tên Thuốc</th>
																	<th scope="col">Hoạt chất</th>
																	<th scope="col">ĐVT</th>
																	<th scope="col">ĐVQĐ</th>
																	<th scope="col">Giá nhập</th>
																	<th scope="col">Giá sỉ</th>
																	<th scope="col">Giá lẻ</th>
																	<th scope="col">% CK</th>
																	<th scope="col">% LN XC</th>
																	<th scope="col">% LN XL</th>
																	<th scope="col">VAT</th>
																	<th scope="col" colspan="2">Chức năng</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="data" items="${drugInformationManagerFindAdd}">
																	<tr>
																		<th scope="row">${data.getId().substring(0,6)}</th>
																		<td>${data.getDrugClassification()}</td>
																		<td>${data.getName()}</td>
																		<td>${data.getIngredient()}</td>
																		<td>${data.getCountingUnits()}</td>
																		<td>${data.getCountingUnitsExchange()}</td>
																		<td>${data.getPrimeCost()}</td>
																		<td>${data.getWholesalePrime()}</td>
																		<td>${data.getRetailPrime()}</td>
																		<td>${data.getDiscount()}</td>
																		<td>${data.getWholesaleProfit()}</td>
																		<td>${data.getRetailProfit()}</td>
																		<td>${data.getVat()}</td>
																		<td><a href="#editModal_${data.getId()}"
																			class="btn btn-primary btnFunc" data-toggle="modal"><i
																				class="material-icons" data-toggle="tooltip"
																				title="Sửa thông tin">&#xE254;</i> </a></td>
																		<td><a href="#deleteModal_${data.getId()}"
																			class="btn btn-danger" data-toggle="modal"><i
																				class="material-icons" data-toggle="tooltip"
																				title="Xóa">&#xE872;</i> </a></td>
																	</tr>

																	<!-- Modal edit-->
																	<div id="editModal_${data.getId()}" tabindex="-1"
																		role="dialog" aria-labelledby="exampleModalLabel"
																		aria-hidden="true" class="modal fade text-left">
																		<div role="document" class="modal-dialog modal-lg">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h4 id="exampleModalLabel" class="modal-title">Thay
																						đổi thông tin thuốc</h4>
																					<button type="button" data-dismiss="modal"
																						aria-label="Close" class="close">
																						<span aria-hidden="true">×</span>
																					</button>
																				</div>
																				<form:form action="editDrugInformationManager"
																					method="post"
																					modelAttribute="DrugInformationManagerEdit">
																					<div class="modal-body">
																						<form:input id="idNewDrugInfo" type="hidden"
																							class="form-control" value="${data.getId()}"
																							path="id" />
																						<div class="form-group row">
																							<label class="col-md-2 form-control-label">Tên
																								thuốc</label>
																							<div class="col-md-9">
																								<form:input required="required" type="text"
																									value="${data.getName()}" class="form-control"
																									path="name" />
																							</div>
																							<label class="col-md-1 form-control-label">(*)</label>
																						</div>
																						<div class="form-group row">
																							<label class="col-md-2 form-control-label">Hoạt
																								chất</label>
																							<div class="col-md-9">
																								<form:input required="required" type="text"
																									value="${data.getIngredient()}"
																									class="form-control" path="ingredient" />
																							</div>
																							<label class="col-md-1 form-control-label">(*)</label>
																						</div>
																						<div class="form-group row">
																							<label class="col-md-2 form-control-label">Nhóm
																								thuốc</label>
																							<div class="col-md-9 select mb-3">
																								<form:select name="drugGroup" id="drugGroup"
																									class="form-control" path="drugClassification">
																									<%@ include
																										file="ComboBox/comboBoxDrugGroup.jsp"%>
																								</form:select>

																							</div>
																							<label class="col-md-1 form-control-label">(*)</label>
																						</div>
																						<hr>
																						<div class="form-group row">
																							<label class="col-md-2 form-control-label">Đơn
																								vị</label>
																							<div class="col-md-3 select mb-3">
																								<form:select name="countingUnits"
																									id="countingUnits" class="form-control"
																									path="countingUnits">
																									<%@ include
																										file="ComboBox/comboBoxCountingUnits.jsp"%>
																								</form:select>
																							</div>
																							<label class="col-md-1 form-control-label">(*)</label>
																							<label class="col-md-2 form-control-label">ĐVT
																								quy đổi</label>
																							<div class="col-md-3 select mb-3">
																								<form:select name="drugGroup" id="drugGroup"
																									class="form-control"
																									path="countingUnitsExchange">
																									<%@ include
																										file="ComboBox/comboBoxCountingUnits.jsp"%>
																								</form:select>
																							</div>
																							<label class="col-md-1 form-control-label">(*)</label>
																						</div>
																						<div class="form-group row">
																							<label class="col-md-2 form-control-label">Giá
																								nhập</label>
																							<div class="col-md-3">
																								<form:input type="text"
																									value="${data.getPrimeCost()}"
																									class="form-control primeCost" path="primeCost" />
																							</div>
																							<label class="col-md-1 form-control-label">đ/hộp</label>
																							<label class="col-md-2 form-control-label">Tỷ
																								lệ quy đổi</label>
																							<div class="col-md-3">
																								<form:input required="required" type="text"
																									class="form-control conversionRate"
																									value="${data.getConversionRate()}"
																									path="conversionRate" />
																							</div>
																							<label class="col-md-1 form-control-label">(*)</label>
																						</div>
																						<div class="form-group row">
																							<label class="col-md-2 form-control-label">Tỷ
																								lệ CK</label>
																							<div class="col-md-3">
																								<form:input type="text" class="form-control"
																									value="${data.getDiscount()}" path="discount" />
																							</div>
																							<label class="col-md-1 form-control-label">%</label>
																							<label class="col-md-2 form-control-label">VAT</label>
																							<div class="col-md-3">
																								<form:input type="text" value="${data.getVat()}"
																									class="form-control vat" path="vat" />
																							</div>
																							<label class="col-md-1 form-control-label">%
																								(*)</label>
																						</div>
																						<div class="form-group row"></div>
																						<div class="form-group row">
																							<label class="col-md-2 form-control-label">%
																								Lợi nhuận XC</label>
																							<div class="col-md-3">
																								<form:input required="required" type="text"
																									class="form-control wholesaleProfit"
																									value="${data.getWholesaleProfit()}"
																									path="wholesaleProfit" />
																							</div>
																							<label class="col-md-1 form-control-label">(*)</label>
																							<label class="col-md-2 form-control-label">%
																								Lợi nhuận XL</label>
																							<div class="col-md-3">
																								<form:input type="text"
																									value="${data.getRetailProfit()}"
																									class="form-control retailProfit"
																									path="retailProfit" />
																							</div>
																							<label class="col-md-1 form-control-label"></label>
																						</div>
																						<hr>

																						<div class="form-group row">
																							<label class="col-md-2 form-control-label">Nhà
																								sản xuất</label>
																							<div class="col-md-3">
																								<form:input type="text" class="form-control"
																									value="${data.getDrugManufacturer()}"
																									path="drugManufacturer" />
																							</div>
																							<label class="col-md-1 form-control-label"></label>
																							<label class="col-md-2 form-control-label">Xuất
																								xứ</label>
																							<div class="col-md-3 select mb-3">
																								<form:input type="text" class="form-control"
																									value="${data.getOrigin()}" path="origin" />
																							</div>
																							<label class="col-md-1 form-control-label">(*)</label>
																							<form:label for="noteDrug"
																								class="form-control-label"
																								style="margin-left: 15px" path="note">Ghi chú</form:label>
																							<form:textarea class="form-control rounded-0"
																								id="noteDrug" rows="3"
																								style="margin-left: 78px;width: 72%;" value=""
																								path="note"></form:textarea>
																						</div>
																					</div>
																					<div class="modal-footer">
																						<span class="mr-auto">(*) Thông tin bắt
																							buộc</span>
																						<div>
																							<button type="submit" class="btn btn-primary">Hoàn
																								thành</button>
																							<button type="button" data-dismiss="modal"
																								class="btn btn-secondary">Trở về</button>
																						</div>
																					</div>
																				</form:form>
																			</div>
																		</div>
																	</div>

																	<!-- Modal delete -->
																	<div id="deleteModal_${data.getId()}"
																		class="modal fade" tabindex="-1" role="dialog"
																		aria-labelledby="myModalLabel" aria-hidden="true">
																		<div role="document " class="modal-dialog ">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="titleDelete">Xóa
																						dữ liệu</h5>
																					<button type="button" data-dismiss="modal"
																						aria-label="Close" class="close">
																						<span aria-hidden="true">×</span>
																					</button>
																				</div>
																				<form:form action="deleteDrugInformationManager"
																					method="post"
																					modelAttribute="DrugInformationManagerEdit">

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
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<div class="row justify-content-end">
											<div class="col-md-auto" style="margin-top: 30px">
												<div class="col-md-12 form-group right bolder">
													<button type="button" data-toggle="modal"
														data-target="#myModal" class="btn btn-primary">
														<i class="fa fa-plus iconFunc"></i> Thêm thuốc mới
													</button>
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
		</div>

		<!-- Modal thêm thuốc mới -->
		<div id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true"
			class="modal fade text-left">
			<div role="document" class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 id="exampleModalLabel" class="modal-title">Thay đổi thông
							tin thuốc</h4>
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<form:form action="createDrugInformationManager" method="post"
						modelAttribute="DrugInformationManagerEdit">
						<div class="modal-body">
							<div class="form-group row">
								<label class="col-md-2 form-control-label">Tên thuốc</label>
								<div class="col-md-9">
									<form:input required="required" type="text" value=""
										class="form-control" path="name" />
								</div>
								<label class="col-md-1 form-control-label">(*)</label>
							</div>
							<div class="form-group row">
								<label class="col-md-2 form-control-label">Hoạt chất</label>
								<div class="col-md-9">
									<form:input required="required" type="text" value=""
										class="form-control" path="ingredient" />
								</div>
								<label class="col-md-1 form-control-label">(*)</label>
							</div>
							<div class="form-group row">
								<label class="col-md-2 form-control-label">Nhóm thuốc</label>
								<div class="col-md-9 select mb-3">
									<form:select name="drugGroup" id="drugGroup"
										class="form-control" path="drugClassification">
										<%@ include file="ComboBox/comboBoxDrugGroup.jsp"%>
									</form:select>

								</div>
								<label class="col-md-1 form-control-label">(*)</label>
							</div>
							<hr>
							<div class="form-group row">
								<label class="col-md-2 form-control-label">Đơn vị</label>
								<div class="col-md-3 select mb-3">
									<form:select name="countingUnits" id="countingUnits"
										class="form-control" path="countingUnits">
										<%@ include file="ComboBox/comboBoxCountingUnits.jsp"%>
									</form:select>
								</div>
								<label class="col-md-1 form-control-label">(*)</label> <label
									class="col-md-2 form-control-label">ĐVT quy đổi</label>
								<div class="col-md-3 select mb-3">
									<form:select name="drugGroup" id="drugGroup"
										class="form-control" path="countingUnitsExchange">
										<%@ include file="ComboBox/comboBoxCountingUnits.jsp"%>
									</form:select>
								</div>
								<label class="col-md-1 form-control-label">(*)</label>
							</div>
							<div class="form-group row">
								<label class="col-md-2 form-control-label">Giá nhập</label>
								<div class="col-md-3">
									<form:input type="text" value="" class="form-control"
										id="primeCost" path="primeCost" />
								</div>
								<label class="col-md-1 form-control-label">đ/hộp</label> <label
									class="col-md-2 form-control-label">Tỷ lệ quy đổi</label>
								<div class="col-md-3">
									<form:input required="required" type="text"
										class="form-control" value="" id="conversionRate"
										path="conversionRate" />
								</div>
								<label class="col-md-1 form-control-label">(*)</label>
							</div>
							<div class="form-group row">
								<label class="col-md-2 form-control-label">Tỷ lệ CK</label>
								<div class="col-md-3">
									<form:input type="text" class="form-control" value=""
										path="discount" />
								</div>
								<label class="col-md-1 form-control-label">%</label> <label
									class="col-md-2 form-control-label">VAT</label>
								<div class="col-md-3">
									<form:input type="text" id="vat" value="" class="form-control"
										path="vat" />
								</div>
								<label class="col-md-1 form-control-label">% (*)</label>
							</div>
							<div class="form-group row"></div>
							<div class="form-group row">
								<label class="col-md-2 form-control-label">% Lợi nhuận
									XC</label>
								<div class="col-md-3">
									<form:input required="required" type="text"
										class="form-control" value="" id="wholesaleProfit"
										path="wholesaleProfit" />
								</div>
								<label class="col-md-1 form-control-label">(*)</label> <label
									class="col-md-2 form-control-label">% Lợi nhuận XL</label>
								<div class="col-md-3">
									<form:input type="text" value="" class="form-control"
										id="retailProfit" path="retailProfit" />
								</div>
								<label class="col-md-1 form-control-label"></label>
							</div>
							<hr>
							<div class="form-group row">
								<label class="col-md-2 form-control-label">Nhà sản xuất</label>
								<div class="col-md-3">
									<form:input type="text" class="form-control" value=""
										path="drugManufacturer" />
								</div>
								<label class="col-md-1 form-control-label"></label> <label
									class="col-md-2 form-control-label">Xuất xứ</label>
								<div class="col-md-3 select mb-3">
									<form:input type="text" class="form-control" value=""
										path="origin" />
								</div>
								<label class="col-md-1 form-control-label">(*)</label>
								<form:label for="noteDrug" class="form-control-label"
									style="margin-left: 15px" path="note">Ghi chú</form:label>
								<form:textarea class="form-control rounded-0" id="noteDrug"
									rows="3" style="margin-left: 78px;width: 72%;" value=""
									path="note"></form:textarea>
							</div>

						</div>

						<div class="modal-footer">
							<span class="mr-auto">(*) Thông tin bắt buộc</span>
							<div>
								<button type="submit" class="btn btn-primary">Hoàn
									thành</button>
								<button type="button" data-dismiss="modal"
									class="btn btn-secondary">Trở về</button>
							</div>
						</div>
					</form:form>
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
	<script src="resources/Js/drugInfo.js"></script>
</body>
</html>

