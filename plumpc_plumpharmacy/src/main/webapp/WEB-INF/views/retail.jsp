<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<form action="">
		<div class="page-holder w-100 d-flex flex-wrap">
			<div class="container-fluid px-xl-2">
				<section class="py-2">
					<div class="col-lg-12 mb-5">
						<div class="card ">
							<div class="card-header ">
								<div class="row">
									<div class="col-md-2 label-header">
										<h3 class="h6 text-uppercase mb-0" id="header">Bán lẻ</h3>
									</div>
									<div class="col-md-3 offset-md-7 d-flex justify-content-end">
										<label class="form-control-label" id="header-label">Chuyển
											qua Bán theo đơn</label>
										<!-- Rounded switch -->
										<label class="switch"> 
										<input type="checkbox"
											id="slide"> <span class="slider round"></span>
										</label>
									</div>
								</div>


							</div>
							<!--Bộ lọc-->
							<div class="card-body">
								<!--Nội dung bán lẻ -->
								<div id="retail-content">
									<div class="row">

										<div class="col-md-3">
											<div class="form-group ">
												<label class="form-control-label ">Nhân viên</label> <input
													type="text" class="form-control" value="" readonly>
											</div>

										</div>
										<div class="col-md-3 ">
											<div class="form-group ">
												<label class="form-control-label">Tham khảo toa: </label>
												<div class="select mb-3">
													<select name="" class="form-control"
														id="keywordPrescription">
														<option value="" selected disabled>Chọn toa để
															tham khảo</option>
														<option>Viêm họng</option>
														<option>Cảm cúm</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-3 ">
											<div class="form-group">
												<label class="form-control-label">Ngày lập: </label> <input
													type="date" class="form-control" id="checkDate" readonly>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group btnCustom">
												<!--Gọi modal Toa thuốc sẵn có-->
												<button type="button" data-toggle="modal"
													data-target="#modalPre" class="btn btn-primary ">
													<i class="fa fa-edit iconFunc"></i>Nhập thuốc từ toa sẵn
												</button>
											</div>
										</div>

									</div>
									<div class="row">

										<div class="col-md-6 ">
											<div class="row">
												<div class="col-md-9">
													<div class="form-group">
														<label class="form-control-label">Khách hàng: </label>
														<div class="select mb-3"><!--bán lẻ--> 
															<select id="cusCheckfalse" name="customer" class="form-control selectCus">
																<%@ include file="ComboBox/comboBoxCustomer.jsp"%>
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
												</div>
											</div>
										</div>
										<div class="col-md-6 ">
											<div class="form-group ">
												<label for="note">Ghi chú</label>
												<textarea class="form-control rounded-0" id="note" rows="3"></textarea>
											</div>
										</div>
										
									</div>
								</div>
								<!--Nội dung bán theo đơn -->
								<div id="soldPre-content">
									<!--Hàng 1-->
									<div class="row justify-content-center">

										<div class="col-md-4">
											<div class="row">
												<div class="col-md-9">
													<div class="form-group">
														<label class="form-control-label">Khách hàng: </label>
														<div class="select mb-3">
															<select id="cusChecktrue" name="" class="form-control">
																<%@ include file="ComboBox/comboBoxCustomer.jsp"%>
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
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Tên bác sĩ: </label> <input id = "doctorName"
													type="text" class="form-control">
											</div>
										</div>
									</div>
									<!--Hàng 2-->
									<div class="row justify-content-center">
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Nhân viên</label> <input
													type="text" class="form-control" readonly>
											</div>
											<div class="form-group">
												<label class="form-control-label">Ngày lập: </label> <input
													type="date" class="form-control" id="checkDate">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="note">Triệu chứng</label>
												<textarea id="symptom" class="form-control rounded-0" id="note" rows="5"></textarea>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Địa chỉ BS: </label> <input id="addressH"
													type="text" class="form-control ">
											</div>
											<div class="form-group">
												<label class="form-control-label">Chuẩn đoán: </label> <input id="diagnosticH"
													type="text" class="form-control">
											</div>
										</div>
									</div>
								</div>
								<!--Nội dung bán sỉ -->
								<div id="wholesale">
									<div class="row justify-content-center">
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Số phiếu: </label> <input
													type="text" class="form-control" readonly>
											</div>
											<div class="form-group">
												<label class="form-control-label">Nhân viên</label> <input
													type="text" class="form-control" readonly>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="form-control-label">Ngày lập: </label> <input
													type="date" class="form-control" id="checkDate">
											</div>
											<div class="row">
												<div class="col-md-9">
													
												</div>
												<div class="col-md-2">
													<!--Thêm thông tin khách hàng-->
													<div class="form-group btnCustom">
														<button type="button" class="btn btn-primary"
															data-toggle="modal" data-target="#modalAddNewCustomer">
															<i class="fa fa-plus" aria-hidden="true"></i>
														</button>
													</div>

												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="note">Ghi chú:</label>
												<textarea id="textnote" class="form-control rounded-0" id="note" rows="5"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!--Thông tin-->
							<div class="card-body">
								<div class="card">
									<div class="card-header ">
										<div class="row">
											<div class="col-md-3">
												<h6 class="text-uppercase mb-0" style="margin-top: 10px;">Danh
													sách thuốc ${listRetail.getAllItem().size()}</h6>
											</div>
											<div class="col-md-2 offset-md-7">
												<button type="button" data-toggle="modal"
													data-target="#openAddDrug" class="btn btn-primary">
													<i class="fa fa-plus iconFunc"></i>Thêm thuốc
												</button>
											</div>
										</div>
										<div class="card-body ">
											<table id="tableRetail"
												class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th width="9%">Id thuốc</th>
														<th width="25%">Tên thuốc</th>
														<th width="11%">Đơn vị tính</th>
														<th width="11%">Số lượng</th>
														<th>Đơn giá</th>
														<th>Thành tiền</th>
														<th>Chức năng</th>
													</tr>
												</thead>
												<tbody id="bodyTableRetail" class="drugList">
													<c:forEach var="data" items="${listRetail.getAllItem()}">
														<tr id="${data.getDrugId() }">
															<th>${data.getDrugId().substring(0,6) }</th>
															<td>${drugSV.findById(data.getDrugId()).getName() }</td>
															<td><select id="${data.getCountingUnits() }"
																onchange="onchangeCount('${data.getDrugId() }',this.value)"
																class="form-control slAA" style="" name="selectCount"
																id="selectCount">
																	<option
																		${data.getCountingUnits() == drugSV.findById(data.getDrugId()).getCountingUnits() ? 'selected' : ''}
																		value="${drugSV.findById(data.getDrugId()).getCountingUnits() }">${countingUnits.findById(drugSV.findById(data.getDrugId()).getCountingUnits()).getName() }</option>
																	<option
																		${data.getCountingUnits() == drugSV.findById(data.getDrugId()).getCountingUnits() ? '' : 'selected'}
																		value="${drugSV.findById(data.getDrugId()).getCountingUnitsExchange() }">${countingUnits.findById(drugSV.findById(data.getDrugId()).getCountingUnitsExchange()).getName() }</option>


															</select></td>
															<td><input class="form-control" type="number"
																id="slInput_${data.getDrugId() }"
																onchange=" addDrug('${data.getDrugId() }',this.value,this)"
																name="quantity" min="1" max="100"
																value="${data.getTotalOfDrug()}" /></td>
															<td id="dongia_${data.getDrugId() }">${ listRetail.getPrice(data.getDrugId())}</td>
															<td id="thanhtien_${data.getDrugId()  }">${ listRetail.getPrice(data.getDrugId())*data.getTotalOfDrug()}</td>
															<td><button type="button"
																	onclick="deleteDrugRetail('${data.getDrugId()}')"
																	class="btn btn-danger btnDeleteDrugRetail">Xóa</button></td>


														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3 offset-md-9 btnCustom">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">Tổng tiền</span>
											</div>
											<input type="text" id="totalRetail"
												value="${ listRetail.getAmount()}" class="form-control"
												readonly>
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
										<div class="form-group btnCustom">
											<button type="button" class="btn btn-primary" id="printOrder">
												<i class="fa fa-print iconFunc"></i>In phiếu
											</button>
										</div>
									</div>
								</div>

							</div>

							<!-- Modal của Toa thuốc có sẵn-->
							<div id="modalPre" tabindex="-1" role="dialog"
								aria-labelledby="modalLabel" aria-hidden="true"
								class="modal fade text-left bd-example-modal-lg">
								<div role="document" class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h4 id="modalLabel" class="modal-title">Danh sách toa
												thuốc có sẵn</h4>
											<button type="button" aria-label="Close"
												class="close btnBackHome">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="">
												<div class="form-group">
													<div class="row">
														<div class="col-md-5">
															<label>Tìm kiếm theo</label>
															<div class="select mb-3">
																<select name="" class="form-control">
																	<option>Tên toa thuốc</option>
																	<option>Triệu trứng</option>
																</select>
															</div>
														</div>
														<div class="col-md-7">
															<!--Tìm kiếm-->
															<div class="input-group mb-3 btnCustom">
																<input type="text" class="form-control"
																	placeholder="Nhập từ khóa">
																<div class="input-group-prepend">
																	<button type="button" class="input-group-text">
																		<i class="fa fa-search"></i>
																	</button>
																</div>
															</div>
														</div>
													</div>

												</div>
												<div class="form-group">
													<table class="table table-striped table-hover card-text"
														id="tableRetail">
														<thead>
															<tr class="unselected">
																<th>Mã toa thuốc</th>
																<th>Tên toa thuốc</th>
																<th>Đối tượng</th>
																<th>Triệu trứng</th>
																<th>Ghi chú</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row" class="inputValue">TT0001</th>
																<td class="inputValue">Viêm họng</td>
																<td class="inputValue">Trẻ em</td>
																<td class="inputValue">Đau họng, ho</td>
																<td class="inputValue"></td>
															</tr>
															<tr>
																<th scope="row" class="inputValue">TT0002</th>
																<td class="inputValue">Cảm cúm</td>
																<td class="inputValue">Trẻ em</td>
																<td class="inputValue">Đau họng, ho</td>
																<td class="inputValue"></td>
															</tr>
														</tbody>
													</table>
												</div>

											</form>
										</div>
										<div class="modal-footer">
											<div class="form-group">
												<!--Gọi modal chi tiết toa thuốc-->
												<button type="button" class="btn btn-primary"
													data-target="#modalDetailPre" id="btnDetailPre">
													<i class="far fa-file-alt iconFunc"></i>Chi tiết toa thuốc
												</button>
												<!--Trở về UI bán lẻ-->
												<button type="button" class="btn btn-secondary btnBackHome">Trở
													về</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Kết thúc Modal của toa thuốc có sẵn-->

							<!-- Modal của Chi tiết toa thuốc-->
							<div id="modalDetailPre" tabindex="-1" role="dialog"
								aria-labelledby="modalLabelDetail" aria-hidden="true"
								class="modal fade text-left bd-example-modal-lg"
								data-backdrop="static" data-keyboard="false">
								<div role="document" class="modal-dialog modal-lg">
									<div class="modal-content">
										<form action="">
											<div class="modal-header">
												<h4 id="modalLabelDetail" class="modal-title">Thông tin
													toa thuốc</h4>
												<button type="button" aria-label="Close"
													data-dismiss="modal" class="close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body" id="wrapper">
												<h5 id="modalLabelDetail" class="modal-title">ĐƠN THUỐC</h5>
												<div class="form-group">
													<div class="form-group">
														<label for="nameMedicine" class="form-control-label">Tên
															đơn thuốc: </label> <input id="nameMedicine" name="nameMedicine"
															type="text" class="form-control" required>
													</div>
												</div>
												<div class="form-group">
													<div class="form-group ">
														<label class="form-control-label">Triệu chứng: </label> <input
															type="text" class="form-control" id="symptom" required>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="form-control-label">Đối tượng: </label>
															<div class="select mb-3">
																<select name="" class="form-control">
																	<option>Trẻ em</option>
																	<option>Người lớn</option>
																	<option>Phụ nữ mang thai</option>
																</select>
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<label class="form-control-label">Số ngày uống: </label> <input
															type="number" min="1" class="form-control"
															name="textNumber" required id="numDay">
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
																					<input type="number" id="numDug"
																						class="form-control" min="1">
																				</div>
																				<label for="numberMedicine" class="col-form-label">viên</label>
																			</div>
																		</td>
																		<td style="width: 20%">
																			<div class="row justify-content-center">
																				<button type="button" class="btn btn-danger"
																					data-toggle="modal" data-target="#modalDelete"
																					title="Xóa">
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
																						id="numDay" value="" min="1" max="30" name="days">
																				</div>
																				<label for="numberMedicine" class="col-form-label ">lần,
																					mỗi lần</label>
																				<div class="col-sm-3 ">
																					<input type="number" class="form-control"
																						id="numberMedicine" value="" min="1" max="30"
																						name="numTime">
																				</div>
																				<label for="numberMedicine" class="col-form-label">viên</label>
																			</div>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<!--Nơi để các nút-->
												<div class="form-group">
													<button type="button" class="btn btn-primary" id="addOrder">
														<i class="fa fa-plus iconFunc"></i>Thêm vào hóa đơn
													</button>
													<button type="button" class="btn btn-primary" id="print">
														<i class="fa fa-print iconFunc"></i>In toa
													</button>
													<button type="button" data-dismiss="modal"
														class="btn btn-secondary">Hủy</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- Kết thúc Modal của Chi tiết toa thuốc-->

							<!-- Modal của Thêm thuốc-->
							<div id="openAddDrug" tabindex="-1" role="dialog"
								aria-labelledby="modalLabel" aria-hidden="true"
								class="modal fade text-left">
								<div role="document" class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h4 id="modalLabel" class="modal-title">Thêm thuốc</h4>
											<button type="button" aria-label="Close" data-dismiss="modal"
												class="close">
												<span aria-hidden="true">×</span>
											</button>
										</div>
										<form action="">

											<div class="col-md-12 col-12 form-group">
												<div class="input-group mb-4">
													<input type="text" placeholder="Tìm kiếm" id="drugNameS"
														aria-label="Recipient's username"
														aria-describedby="button-addon2" class="form-control">
													<div class="input-group-append">
														<button id="buttonS" type="button" class="btn btn-primary">
															<i class="fa fa-search iconFunc"></i>Lọc kết quả ?

														</button>
													</div>
												</div>
											</div>
											<div id="ajaxGetUserServletResponse"></div>
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th style="width: 20%">Mã thuốc</th>
														<th style="width: 60%" scope="col">Tên Thuốc</th>
														<th scope="col">Chức Năng</th>
													</tr>
												</thead>
												<tbody id="ajaxDataSearch">
													<%-- <tr>
														<th>${response[i].id.substring(0, 6) }</th>
														<th scope="col">${esponse[i].name }</th>
														<th scope="col">
															<button id="addDrugList_123"
																onclick="addDrugAjax(${response[i].id})" type="button"
																class="btn btn-primary fas fa-plus-square">
																thêm vào toa</button>

														</th>
													</tr> --%>
												</tbody>
											</table>
										</form>
									</div>
								</div>
							</div>
							<!-- Kết thúc Modal của thêm thuốc-->
						</div>
					</div>
				</section>
			</div>
		</div>


		<!--Modal modalAddDrugToRetail-->
		<div id="modalAddDrugToRetail" tabindex="-1" role="dialog"
			aria-labelledby="modalLabelDelete" aria-hidden="true"
			class="modal fade text-left">
			<div role="document" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="titleAdd">Bạn M2uốn Thêm Thuốc
							Này Vào Trong Hóa Đơn?</h5>
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form:form action="addDrugRetailCart" method="post"
							modelAttribute="newPrescriptionDetailed">
							<div class="col-md-12">

								<form:input id="idDrugToRetail" type="hidden"
									class="form-control" value="" path="drugId" />
							</div>
							<div class="form-groub float-right">
								<button class="btn btn-success" type="submit"
									id="btnAddDrugRetailCF">Thêm Vào</button>


							</div>
							<button type="button" data-dismiss="modal"
								class="btn btn-secondary">Trở về</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>

		<!--Modal delete-->
		<div id="modalDelete" tabindex="-1" role="dialog"
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

		<!--Modal thêm mới khách hàng-->
		<div id="modalAddNewCustomer" tabindex="-1" role="dialog"
			aria-labelledby="modalLabelDelete" aria-hidden="true"
			class="modal fade text-left">
			<div role="document" class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Thông tin khách hàng</h5>
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close" id="closeSubModal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="form-control-label">Nhóm khách hàng (*): </label>
							<div class="select mb-3">
								<select name="" class="form-control" required>
									<option>Khách theo đơn</option>
									<option>Khách theo</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="form-control-label">Tên khách hàng (*): </label> <input
								type="text" class="form-control" required>
						</div>
						<div class="form-group">
							<label class="form-control-label">Địa chỉ: </label> <input
								type="text" class="form-control">
						</div>
						<div class="row">
							<div class="form-group col-md-6">
								<label for="phone" class="form-control-label">Điện thoại
									(*): </label> <input type="tel" class="form-control" id="phone"
									name="phone" pattern="[0-9]{10}" required> <small
									class="invalid-feedback ml-3" id="showMessage">Hãy nhập
									lại số điện thoại</small>
							</div>
							<div class="form-group col-md-6">
								<label class="form-control-label">Tuổi: </label> <input
									type="number" class="form-control" id="checkAge" min="5">
								<small class="invalid-feedback ml-3" id="showMessageAge">Hãy
									nhập lại tuổi</small>
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
	</form>
	<!-- JavaScript files-->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="resources/vendor/chart.js/Chart.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="resources/Js/manageSale.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap-notify.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>



	<script type="text/javascript">
		function setCookie(cname, cvalue, exdays) {
			var d = new Date();
			d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
			var expires = "expires=" + d.toUTCString();
			document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
		}
		function readCookie(name) {
			var nameEQ = name + "=";
			var ca = document.cookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ')
					c = c.substring(1, c.length);
				if (c.indexOf(nameEQ) == 0)
					return c.substring(nameEQ.length, c.length);
			}
			return null;
		}

		function addDrugAjax(data) {
			document.getElementById("idDrugToRetail").value = data;
		}
	</script>
	<script>
		function onchangeCount(id, data) {
			$.ajax({

				type : "POST",
				url : 'changeCountUnitDrugRetail',
				data : {
					"idDrug" : id,
					"data" : data
				},
				success : function(response) {

					var obj = JSON.parse(response);

					$('#dongia_' + id).html(obj[1]);
					$('#thanhtien_' + id).html(obj[2]);
					$('#totalRetail').val(obj[0]);
				}

			});

		}
		function deleteDrugRetail(id) {

			$.ajax({

				type : "POST",
				url : 'deleteDrugRetail',
				data : {
					"idDrug" : id
				},
				success : function(response) {

					$('#' + id).remove();
					$('#totalRetail').val(response);
				}

			});
		}
		function addDrug(id, num, ojb) {

			$.ajax({
				type : "POST",
				url : 'changeQuantityRetail',
				data : {
					"num" : num,
					"idDrug" : id
				},
				success : function(response) {
					var obj = JSON.parse(response);

					$('#dongia_' + id).html(obj[1]);
					$('#thanhtien_' + id).html(obj[2]);
					$('#totalRetail').val(obj[0]);

				}

			});
		}
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$('#buttonS')
									.click(
											function() {
												$
														.ajax({
															type : "POST",
															url : 'searchDrug',
															data : "name="
																	+ $(
																			'#drugNameS')
																			.val(),
															success : function(
																	response) {

																var htmlAdd = "";
																for ( var i in response) {

																	var dataSend = response[i].id
																			+ response[i];
																	var myJSON = JSON
																			.stringify(dataSend);
																	var myvar = '<tr>'
																			+ '														<th>'
																			+ response[i].id
																					.substring(
																							0,
																							6)
																			+ '</th>'
																			+ '														<th  scope="col">'
																			+ response[i].name
																			+ '</th>'
																			+ '														<th scope="col">'
																			+ '															<button id="addDrugList_'
																			+ response[i].id
																			+ '"'
																			+ '															 onclick="'
																			+ 'addDrugAjax( '
																			+ "'"
																			+ response[i].id
																			+ "'"
																			+ '  )'
																			+ '"	 type="button"'
																			+ '														data-target="#modalAddDrugToRetail"	data-toggle="modal" 	 class="btn btn-primary fas fa-plus-square">'
																			+ '																thêm vào toa</button>'
																			+

																			'														</th>'
																			+ '													</tr>';

																	htmlAdd += myvar;

																}

																$(
																		'#ajaxDataSearch')
																		.html(
																				htmlAdd);

															}

														});
											});
						});
	</script>

</body>
</html>