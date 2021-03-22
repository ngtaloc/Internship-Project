$(function() {


	// ------------------------------------------------------- //
	// Sidebar
	// ------------------------------------------------------ //
	$('.sidebar-toggler').on('click', function() {
		$('.sidebar').toggleClass('shrink show');
	});



	// ------------------------------------------------------ //
	// For demo purposes, can be deleted
	// ------------------------------------------------------ //

	var stylesheet = $('link#theme-stylesheet');
	$("<link id='new-stylesheet' rel='stylesheet'>").insertAfter(stylesheet);
	var alternateColour = $('link#new-stylesheet');

	if ($.cookie("theme_csspath")) {
		alternateColour.attr("href", $.cookie("theme_csspath"));
	}

	$("#colour").change(function() {

		if ($(this).val() !== '') {

			var theme_csspath = 'css/style.' + $(this).val() + '.css';

			alternateColour.attr("href", theme_csspath);

			$.cookie("theme_csspath", theme_csspath, { expires: 365, path: document.URL.substr(0, document.URL.lastIndexOf('/')) });

		}

		return false;
	});

});


Cookies.set('active', 'true');

$(document).ready(function() {

	//Hiển thị UI Quản lý bán hàng
	$("#manageSale").click(function() {
		$('iframe').attr('src', 'managementSale');

	})

	//Hiển thị UI Quản lý nhập kho
	$("#inventoryManagement").click(function() {
		$('iframe').attr('src', 'inventoryManagement');
	})

	//Hiển thị UI Quản lý Xuất kho
	$("#exportStock").click(function() {
		$('iframe').attr('src', 'exportStock');
	})

	//Hiển thị UI Quản lý nhân viên
	$("#employeeManager").click(function() {
		$('iframe').attr('src', 'employeeManager');
	})

	//Hiển thị UI Thông tin toa thuốc
	$("#medicineInformation").click(function() {
		$('iframe').attr('src', 'medicineInformation');
	})

	//Hiển thị UI Tra cứu
	$("#search").click(function() {
		$('iframe').attr('src', 'search');
	})

	//Hiển thị UI Bán sỉ
	$("#wholesale").click(function() {
		$('iframe').attr('src', 'wholesale');
	})

	//Hiển thị UI Bán lẻ
	$("#retail").click(function() {
		$('iframe').attr('src', 'retail');
	})

	//Hiển thị UI Bán theo đơn	
	$("#soldPrescription").click(function() {
		$('iframe').attr('src', 'soldPrescription');
	})

	//Hiển thị UI Khách hoàn trả
	$("#customerRefund").click(function() {
		$('iframe').attr('src', 'customerRefund');
	})

	//Hiển thị UI Báo cáo
	$("#report").click(function() {
		$('iframe').attr('src', 'report');
	})

	//Hiển thị UI Quản lý thuốc
	$("#drugInformationManager").click(function() {
		$('iframe').attr('src', 'drugInformationManager');
	})

	//Hiển thị UI Khách hàng
	$("#manageCustomer").click(function() {
		$('iframe').attr('src', 'manageCustomer');
	})

	//Hiển thị UI Quản lý nhà cung cấp
	$("#manageSupplier").click(function() {
		$('iframe').attr('src', 'manageSupplier');
	})

	//Hiển thị UI Quản lý tài khoản
	$("#manageAccount").click(function() {
		$('iframe').attr('src', 'manageAccount');
	})

	//Hiển thị UI Nhóm thuốc
	$("#drugGroup").click(function() {
		$('iframe').attr('src', 'drugGroup');

	})

})

function openReceipt() {
	window.open("warehouseReceipt");
}

function openInvoice() {
	window.open("warehouseInvoice");
}