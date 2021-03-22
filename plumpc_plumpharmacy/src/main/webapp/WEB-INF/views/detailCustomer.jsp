<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Quản lý cửa hàng thuốc tây</title>
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
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif&display=swap" rel="stylesheet">
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
            <div class="col-lg-12 mb-5">
                <div class="card">
                    <div class="card-header">
                        <h3 class="h6 text-uppercase mb-0">CHI TIẾT KHÁCH HÀNG</h3>
                    </div>
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Mã khách hàng</label>
                                    <input type="text" class="form-control" id="keywordOrder" disabled>
                                </div>
                            </div>
                            
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Tên khách hàng </label>
                                    <input type="text" class="form-control" disabled >
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Số điện thoại </label>
                                    <input type="text" class="form-control" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Địa chỉ</label>
                                    <input type="text" class="form-control" id="keywordOrder" disabled>
                                </div>
                            </div>
                            
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Nhóm khách hàng </label>
                                    <input type="text" class="form-control" disabled >
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Ghi chú </label>
                                    <input type="text" class="form-control" disabled>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-header">
                        <h3 class="h6 text-uppercase mb-0">THỜI GIAN</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Từ ngày</label>
                                    <input type="date" class="form-control is-valid">
                                </div>
                            </div> 
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Đến ngày</label>
                                    <input type="date" class="form-control is-valid">
                                </div>
                            </div> 
                            
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Từ giờ </label>
                                    <input type="time" class="form-control is-valid">
                                </div>
                            </div> 
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="form-control-label">Đến giờ </label>
                                    <input type="time" class="form-control is-valid">
                                </div>
                            </div> 
                            
                                    <button class="btn btn-primary" type="submit">Xem</button> 
                            
                        </div>
                        </div>
                        <div class="line"></div>
                        <div class="col-lg-12 mb-6">
                            <div class="card">
                                <div class="card-header">
                                    <h6 class="text-uppercase mb-0">Danh sách hóa đơn</h6>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-hover card-text">
                                        <thead>
                                          <tr>
                                              <th>Mã hóa đơn</th>
                                              
                                              <th>Ngày lập</th>
                                              <th>Giờ lập</th>
                                              <th>Người lập</th>
                                              <th>Tổng tiền</th>
                                              
                                              
                                              <th></th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>HDN007</td>
                                                
                                                <td>21/01/2021</td>
                                                <td>07:45:46</td>
                                                <td>Nguyễn Văn B</td>
                                                <td>12000000</td>
                                                
                                                <td>
                                                    <a href="#deleteModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                                </td>
                                              </tr>
                                              
                                        </tbody>
                                    </table>    
                                </div>
                            </div>
                        </div>
                    </div>
                    
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