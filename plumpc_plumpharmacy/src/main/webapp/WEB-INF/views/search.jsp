<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
								<h3 class="h6 text-uppercase mb-0">TRA CỨU THÔNG TIN</h3>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-3">
										<div class="form-group">
											<label class="form-control-label">Tra cứu theo: </label> <select
												name="account" class="form-control" id="main">
												<option value="1">Thuốc</option>
												<option value="2">Toa thuốc</option>
												<option value="3">Nhân viên</option>
												<option value="4">Hóa đơn</option>
												<option value="5">Nhà cung cấp</option>
												<option value="6">Khách hàng</option>
											</select>
										</div>
									</div>
									<div class="col-md-3" style="margin-top: 29px;">
										<div class="form-group" id="medicine" style="display: inline;">
											<select name="account" class="form-control">
												<option value="0">Mã thuốc</option>
												<option value="1">Tên thuốc</option>
												<option value="2">Nhóm thuốc</option>
												<option value="3">Hoạt chất</option>
											</select>
										</div>
										<div class="form-group" id="prescription"
											style="display: none;">
											<select name="account" class="form-control">
												<option value="0">Tên toa</option>
												<option value="1">Đối tượng</option>
												<option value="2">Triệu chứng</option>
											</select>
										</div>
										<div class="form-group" id="employee" style="display: none;">
											<select name="account" class="form-control">
												<option value="0">Mã nhân viên</option>
												<option value="1">Tên nhân viên</option>
												<option value="2">Chức vụ</option>
												<option value="3">Địa chỉ</option>
												<option value="4">Điện thoại</option>
											</select>
										</div>
										<div class="form-group" id="receipt" style="display: none;">
											<select name="account" class="form-control">
												<option value="0">Mã hóa đơn</option>
												<option value="1">Khách hàng</option>
												<option value="2">Ngày lập</option>
												<option value="3">Giờ lập</option>
												<option value="4">Tổng tiền</option>
											</select>
										</div>
										<div class="form-group" id="supplier" style="display: none;">
											<select name="account" class="form-control">
												<option value="0">Mã nhà cung cấp</option>
												<option value="1">Tên nhà cung cấp</option>
												<option value="2">Địa chỉ</option>
												<option value="3">Số điện thoại</option>
											</select>
										</div>
										<div class="form-group" id="customer" style="display: none;">
											<select name="account" class="form-control">
												<option value="0">Mã khách hàng</option>
												<option value="1">Nhóm khách hàng</option>
												<option value="2">Tên khách hàng</option>
												<option value="3">Địa chỉ</option>
												<option value="4">Điện thoại</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group" id="findForm">
											<div class="input-group mb-4">
												<input id ="searchValue"  type="text" placeholder="Tìm kiếm"
													aria-label="Recipient's username"
													aria-describedby="button-addon2" class="form-control">
												<div class="input-group-append">
													<button id="button-addon2" type="button" onclick="search()"
														class="btn btn-primary">
														<i class="fa fa-search iconFunc"></i>Tra cứu
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-6" id="medicine1"
									style="display: inline;">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Kết quả</h6>
										</div>
										<div class="card-body">
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th style="width: 7%">Mã thuốc</th>
														<th style="width: 12%">Tên thuốc</th>
														<th style="width: 15%">Hoạt chất</th>
														<th style="width: 7%">ĐVT</th>
														<th style="width: 9%">Nhóm thuốc</th>
														<th>Giá sỉ</th>
														<th>Giá lẻ</th>
														<th>% CK</th>
														<th>Nhà sản xuất</th>
														<th>Xuất xứ</th>
														<th >Ghi chú</th>
													</tr>
												</thead>
												<tbody id="table_drug">
													<tr>
														<td>T001</td>
														<td>Bổ</td>
														<td>Mật ong</td>
														<td>Hộp</td>
														<td>Lọ</td>
														<td>100</td>
														<td>11783</td>
														<td>11783</td>
														<td>11783</td>
														<td>11783</td>
														<td>3</td>
														<td>11</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-6" style="display: none;"
									id="prescription1">
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
														<th>Ngày dùng</th>
														
													</tr>
												</thead>
												<tbody id="searchPrescription_table">
													<tr>
														<td>TT001</td>
														<td>Viêm họng TE</td>
														<td>Trẻ em</td>
														<td>Viêm họng, ho</td>
														<td>3</td>
													
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-6" style="display: none;"
									id="employee1">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Kết quả</h6>
										</div>
										<div class="card-body">
											<table  class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th>Mã nhân viên</th>
														<th>Tên nhân viên</th>
														<th>Địa chỉ</th>
														<th>Số điên thoại</th>
														<th>Ngày vào làm</th>
														<th>Chức vụ</th>
														<th>Ghi chú</th>
													</tr>
												</thead>
												<tbody id="searchUser_table">
													<tr>
														<td>NV001</td>
														<td>Nguyễn Văn A</td>
														<td>Đà Nẵng</td>
														<td>0948493298</td>
														<td>08/07/2020</td>
														<td>Nhân viên</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-6" style="display: none;" id="receipt1">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Kết quả</h6>
										</div>
										<div class="card-body">
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th>Mã hóa đơn</th>
														<th>Khách hàng</th>
														<th>Nhân Viên Lập</th>
														<th>Ngày Giờ lập</th>
														<th>Tổng tiền</th>
														<th>Ghi chú</th>
													</tr>
												</thead>
												<tbody id = "searchInvoice_table">
													<tr>
														<td>HD001</td>
														<td>Công ty A</td>
														<td>07/30/2012</td>
														<td>12:40:02</td>
														<td>730000</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-6" style="display: none;"
									id="supplier1">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Kết quả</h6>
										</div>
										<div class="card-body">
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th>Mã nhà cung cấp</th>
														<th>Tên nhà cung cấp</th>
														<th>Địa chỉ</th>
														<th>Số điện thoại</th>
														<th>Ghi chú</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>DOMECO</td>
														<td>Công ty DOMECO</td>
														<td>Quảng Nam</td>
														<td>0973678888</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="col-lg-12 mb-6" style="display: none;"
									id="customer1">
									<div class="card">
										<div class="card-header">
											<h6 class="text-uppercase mb-0">Kết quả</h6>
										</div>
										<div class="card-body">
											<table class="table table-striped table-hover card-text">
												<thead>
													<tr>
														<th>Mã khách</th>
														<th>Tên khách</th>
														<th>Tuổi</th>
														<th>Địa chỉ</th>
														<th>Số điện thoại</th>
														<th>Nhóm khách hàng</th>
														<th>Ghi chú</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>KL</td>
														<td>Khách lẻ</td>
														<td>13</td>
														<td>Đà Nẵng</td>
														<td>0937947465</td>
														<td>Khách lẻ</td>
														<td></td>
													</tr>
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
	<script src="resources/Js/search.js"></script>
	<script type="text/javascript">
		function search() {
			var check = $('#main').val();
			var key =$('#searchValue').val();
			
			switch (check) {
			case "1":
			
				$.ajax({

					type : "POST",
					url : 'searchDrugInPageSearch',
					data : {
						"keyValue" : key
					},
					success : function(response) {

						var htmlAdd = "";
						for ( var i in response) {
							
							
							var myvar = '<tr>'+
							'														<th>'+response[i].id.substring(0, 6)+'</th>'+
							'														<th>'+response[i].name+'</th>'+
							'														<th>'+response[i].ingredient+'</th>'+
							'														<th>'+response[i].countingUnits+'/'+response[i].countingUnitsExchange+'</th>'+
							'														<th>'+response[i].drugClassification+'</th>'+
							'														<th>'+response[i].wholesalePrime+'</th>'+
							'														<th>'+response[i].retailPrime+'</th>'+
							'														<th>'+response[i].discount+'</th>'+
							'														<th>'+response[i].drugManufacturer+'</th>'+
							'														<th>'+response[i].origin+'</th>'+
							'														<th>'+response[i].note+'</th>'+
							'													</tr>';
								
							
								

								
							
							htmlAdd += myvar;
							
							
							

						}
						
						
						$('#table_drug').html(htmlAdd);
					}

				}); 
				break;
			case "2":
				$.ajax({

					type : "POST",
					url : 'searchPrescriptionByPharmacyInPageSearch',
					data : {
						"keyValue" : key
					},
					success : function(response) {
						
						var htmlAdd = "";
						for ( var i in response) {
							

							var myvar = '<tr>'+
							'														<td>'+response[i].id.substring(0, 6)+'</td>'+
							'														<td>'+response[i].name+'</td>'+
							'														<td>'+response[i].patientId+'</td>'+
							'														<td>'+response[i].symptom+'</td>'+
							'														<td>'+response[i].numberOfDay+'</td>'+
							'													</tr>';
							
								
							
								

								
							
							htmlAdd += myvar;
							
							
							

						}
						
						
						$('#searchPrescription_table').html(htmlAdd);
					}

				}); 
				break;
			case "3":
				$.ajax({

					type : "POST",
					url : 'searchUserInPageSearch',
					data : {
						"keyValue" : key
					},
					success : function(response) {
						
						var htmlAdd = "";
						for ( var i in response) {
							

							var myvar = '<tr>'+
							'														<th>'+response[i].id.substring(0,6)+'</th>'+
							'														<th>'+response[i].name+'</th>'+
							'														<th>'+response[i].address+'</th>'+
							'														<th>'+response[i].phone+'</th>'+
							'														<th>'+response[i].dateJoin+'</th>'+
							'														<th>'+response[i].decentralization+'</th>'+
							'														<th>'+response[i].note+'</th>'+
							'													</tr>';
							
								
							
								

								
							
							htmlAdd += myvar;
							
							
							

						}
						
						
						$('#searchUser_table').html(htmlAdd);
					}

				}); 
				break;
			case "4":
				$.ajax({

					type : "POST",
					url : 'searchInvoiceInPageSearch',
					data : {
						"keyValue" : key
					},
					success : function(response) {
						
						var htmlAdd = "";
						for ( var i in response) {
							
							var myvar = '<tr>'+
							'														<th>'+response[i][0].id.substring(0,6)+'</th>'+
							'														<th>'+response[i][0].customerId+'</th>'+
							'														<th>'+response[i][0].user+'</th>'+
							'														<th>'+response[i][1]+'</th>'+
							'														<th>'+response[i][0].total+'</th>'+
							'														<th>'+response[i][0].note+'</th>'+
							'													</tr>';
								
							
							
								
							
								

								
							
							htmlAdd += myvar;
							
							
							

						}
						
						
						$('#searchInvoice_table').html(htmlAdd);
					}

				}); 
				break;
			case 5:
				// code block
				break;

			}
			/* $.ajax({
			
				type : "POST",
				url : 'deleteDrugRetail',
				data : {"idDrug":id},
				success : function(response) {
					
					$('#'+id).remove();
					$('#totalRetail').val(response); 
				}
						
			}); */
		}
	</script>
</body>
</html>

