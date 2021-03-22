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

<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body>
	<form>
		<div class="page-holder w-100 d-flex flex-wrap">
			<div class="container-fluid px-xl-2">
				<section class="py-2">
					<div class="row">
						<!-- Form thời gian -->
						<div class="col-lg-12 mb-5">
							<div class="card">
								<div class="card-header">
									<h3 class="h6 text-uppercase mb-0">Thống kê</h3>
								</div>
								<div class="card-body border">
									<form class="form-group">
										<div class="row">
											<div class="col-md-3 col-6 form-group">
												<label class="form-control-label">Từ ngày</label> <input
													id="dateFrom" type="datetime-local"
													class="mr-3 form-control">
											</div>
											<div class="col-md-3 col-6 form-group">
												<label class="form-control-label">Đến ngày</label> <input
													id="dateTo" type="datetime-local" class="mr-3 form-control">
											</div>

										</div>
									</form>
								</div>

								<!-- Form Báo cáo -->
								<div class="card-body">
									<form class="form-group">
										<div class="row">
											<div class="col-md-12 col-12 form-group"
												style="text-align: center;">
												<label class="h6 form-control-label text-uppercase">Hệ
													thống báo cáo</label>
											</div>
											<div class="col-md-4 col-6 form-group" id="contentInput">
												<label class="form-control-label text-uppercase">Hàng
													hóa, khách hàng</label>
												<hr>

												<div>
													<input id="optionsRadios4" type="radio" value="banLe"
														name="optionsRadios" checked=""> <label
														for="optionsRadios4">Báo cáo chi tiết bán lẻ</label>
												</div>
												<div>
													<input id="optionsRadios5" type="radio" value="banSi"
														name="optionsRadios"> <label for="optionsRadios5">Báo
														cáo chi tiết bán sỉ</label>
												</div>
												<div>
													<input id="optionsRadios6" type="radio" value="banTheoDon"
														name="optionsRadios"> <label for="optionsRadios6">Báo
														cáo chi tiết bán theo đơn</label>
												</div>
												<div>
													<input id="optionsRadios7" type="radio"
														value="thuocDangCungCap" name="optionsRadios"> <label
														for="optionsRadios7">Báo cáo thuốc đang cung cấp</label>
												</div>
												<div>
													<input id="optionsRadios8" type="radio"
														value="dsNhaCungCap" name="optionsRadios"> <label
														for="optionsRadios8">Báo cáo danh sách nhà cung
														cấp</label>
												</div>
												<div>
													<input id="optionsRadios9" type="radio" value="dsKhachHang"
														name="optionsRadios"> <label for="optionsRadios9">Báo
														cáo danh sách nhà khách hàng</label>
												</div>
											</div>
											<div class="col-md-4 col-6 form-group">
												<label class="form-control-label text-uppercase">Thu
													chi - công nợ</label>
												<hr class="mr-5" />
												<div>
													<input id="optionsRadios10" type="radio" value="danhThu"
														name="optionsRadios"> <label for="optionsRadios10">Báo
														cáo danh thu</label>
												</div>

												<div>
													<input id="optionsRadios13" type="radio" value="nkBanHang"
														name="optionsRadios"> <label for="optionsRadios13">Nhật
														ký bán hàng</label>
												</div>

											</div>
											<div class="col-md-4 col-6 form-group">
												<label class="form-control-label text-uppercase">Danh
													sách, phân tích</label>
												<hr class="mr-5" />
												<div>
													<input id="optionsRadios14" type="radio" value="nhapThem"
														name="optionsRadios"> <label for="optionsRadios14">Báo
														cáo thuốc cần nhập thêm</label>
												</div>

												<div>
													<input id="optionsRadios17" type="radio" value="hetHan"
														name="optionsRadios"> <label for="optionsRadios17">Báo
														cáo thuốc sắp hết hạn</label>
												</div>

												<div>
													<input id="optionsRadios18" type="radio" value="top100Thuoc"
														name="optionsRadios"> <label for="optionsRadios17">100
														thuốc bán chạy nhất</label>
												</div>
											</div>
										</div>
									</form>
								</div>
								<form id="checkRDO" action="banLe">
									<div class="row">
										<div class="col-md-2 offset-md-8 ">
											<button type="submit" id="export" class="btn btn-primary">
												<i class="fa fa-print" aria-hidden="true"></i> Xuất Excel

											</button>
										</div>

									</div>
								</form>
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
	<script src="resources/Js/front.js"></script>

	<script type="text/javascript">
		var data;

		data = $("input[type='radio'][name='optionsRadios']:checked").val();
		document.getElementById("checkRDO").action = data;
		$("input[type='radio'][name='optionsRadios']").change(function() {
			alert(this.value);
			$("#checkRDO").attr("action", this.value);

		});

		$("#export").click(function name() {

			Cookies.set('dateForm', $('#dateFrom').val());
			Cookies.set('dateTo', $('#dateTo').val());
		});
	</script>

</body>
</html>