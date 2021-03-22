

function validate2() {
	var username = document.getElementById("username");
	var password = document.getElementById("password");
	if (username.value == null || username.value == "") {
		alert("Vui lòng nhâp tên đăng nhập.");
		username.focus();
		return false;
	}
	if (password.value == null || password.value == "") {
		alert("Vui lòng nhập mật khẩu.");
		password.focus();
		return false;
	}
	
	// Validate length
	if(password.value.length < 8) {
		alert("Mật khẩu phải có ít nhất 8 kí tự.");
		password.focus();
		return false;
	}
	
	// Validate dấu tiếng việt
	var dau = /à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ|è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ|ì|í|ị|ỉ|ĩ|ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ|ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ|ỳ|ý|ỵ|ỷ|ỹ|đ/;
	if(username.value.match(dau)) {
		alert("Tên đăng nhập không được có dấu.");
		username.focus();
		return false;
	}
	if(password.value.match(dau)) {
		alert("Mật khẩu không được có dấu.");
		password.focus();
		return false;
	}
	// Validate lowerCaseLetters
	
} 

$("#btnDangNhap").on("click", validate2) 








