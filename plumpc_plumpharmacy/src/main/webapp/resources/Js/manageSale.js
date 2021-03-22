
// var date = document.getElementById("checkDate");
var today = new Date().toISOString().substr(0, 10);
var showMessage = document.getElementById("showMessage");
var checkAge = document.getElementById("checkAge");
var showMessageAge = document.getElementById("showMessageAge");
var phone = document.getElementById("phone");
var addOrder = document.getElementById("addOrder");
var rowList = 2; //Row id của modal thêm thuốc
var rowIdx = 2; //Row id của modal chi tiết toa thuốc
var myVar;


//Lấy giới hạn ngày lớn nhất là ngày hiện tại
// date.max = new Date().toISOString().split("T")[0];
document.querySelector("#checkDate").value = today;

$(document).ready(function() {

	//Hiện modal chi tiết hóa đơn
	//Lấy dữ liệu đang trong quá trình thử nghiệm
	$("#btnDetailPre").click(function() {
		if ($("#tableRetail tr").hasClass("table-primary")) {
			$('#modalPre').modal('hide');
			$('#modalPre').on('hidden.bs.modal', function() {
				$('#modalDetailPre').modal('show');
			})
		} else
			alert("Chưa chọn toa thuốc");
	});

	//Ẩn modal Danh sách toa thuốc
	$(".btnBackHome").click(function() {
		$('#modalPre').modal('toggle');
	})

	//Thêm mới một hóa đơn
	$("#addOrder").click(function() {
		if ($("#numDay").val() == "")
			alert("Chưa chọn số ngày uống!");
		else if ($("#chooseMedicine").val() == null)
			alert("Chọn tối thiếu một loại thuốc");
		else if (checkClick == false)
			if (confirm("Chưa in toa thuốc. Bạn có muốn in toa thuốc không?")) {
				alert("Bạn đã in toa thuốc thành công!");
				alert("Thêm vào hóa đơn thành công");
				$('#modalDetailPre').modal('hide');
			} else
				alert("Bạn đã in toa thuốc không thành công!");
	})

	//Highlight row được chọn
	$("#tableRetail tr").click(function() {
		var selected = $(this).hasClass("table-primary")
		$("#tableRetail tr").removeClass("table-primary")
		if (!selected)
			$(this).addClass("table-primary")
	});

	//In hóa đơn
	$("#print").click(function() {
		checkClick = true;
		alert("Bạn đã in toa thuốc thành công!");
	})

	//Kiểm tra kiểu số trong form sdt và hiện lỗi
	$("#phone").change(function() {
		if (isNaN($(this).val())) {
			showMessage.style.display = "block";
			phone.classList.add("is-invalid");
		} else {
			showMessage.style.display = "none";
			phone.classList.remove("is-invalid");
		}
	})

	//Kiểm tra số tuổi không được <=0
	$("#checkAge").change(function() {
		if (Math.sign($(this).val()) == -1 || (Math.sign($(this).val()) == 0)) {
			showMessageAge.style.display = "block";
			checkAge.classList.add("is-invalid");
		} else {
			showMessageAge.style.display = "none";
			checkAge.classList.remove("is-invalid");
		}
	})

	//Tìm kiếm hóa đơn
	$("#searchOrder").click(function() {
		if ($("#keywordOrder").val() == "")
			alert("Không được để trống khung mã hóa đơn");
		else if ($("#keywordOrder").val() != "HDBS002")
			alert("Không tìm thấy hóa đơn");
	})

	//Tìm kiếm toa thuốc
	$("#searchPrescription").click(function() {
		if ($("#keywordPrescription").val() == null)
			alert("Chưa chọn toa để tham khảo");
		else if ($("#keywordPrescription").val() != "HDBS002")
			alert("Không tìm thấy toa");
	})

	//Thêm thuốc

	$("#addDrug").click(function() {
		$('#drug').append(`<tr class="R${rowIdx}"> 
           <th scope="row" id="numericalOrder" rowspan="2">${rowIdx}</th>
				<td style="width: 50%"><select name="" class="form-control" id="chooseMedicine" required>
					<option disabled selected>Chọn thuốc</option>
					<option>Viêm họng</option>
					<option>Cảm cúm</option>
					</select></td>
					<td style="width: 30%">
					<div class="form-group row">
						<div class="col-sm-7">
							<input type="number" class="form-control" min="1">
						</div>
						<label for="numberMedicine" class="col-form-label">viên</label>
					</div>
				</td>
				<td style="width: 20%">
					<div class="row justify-content-center">
						<button type="button" class="btn btn-danger"
							data-toggle="modal" data-target="#modalDelete">
							<i class="fa fa-trash"></i>
						</button>
					</div>
				</td>
              </tr>
              <tr class="RR${rowIdx}">
			<td colspan="3 ">
				<div class="form-group row" id="styleNumberMedicine">
					<label for="numberMedicine " class="col-form-label ">Ngày
						uống</label>
					<div class="col-sm-3 ">
						<input type="number" class="form-control"
							id="numberMedicine" value="" min="1" max="30"
							name="textNumber">
					</div>
					<label for="numberMedicine" class="col-form-label ">lần,
						mỗi lần</label>
					<div class="col-sm-3 ">
						<input type="number" class="form-control"
							id="numberMedicine" value="" min="1" max="30"
							name="textNumber">
					</div>
					<label for="numberMedicine" class="col-form-label">viên</label>
				</div>
			</td>
		</tr>`)
		rowIdx++;
	})


	//Thêm thuốc vào bảng danh sách thuốc
	$("#addDrugList").click(function() {
		var nameDrug = $("#nameDrug").val();
		var dvt = $("#dvt").val();
		var numberDrug = $("#numberDrug").val();
		var money = $("#money").val();

		if (nameDrug == "")
			alert("Chưa điền tên thuốc!");
		else if (dvt == "")
			alert("Chưa điền đơn vị tính!");
		else if (numberDrug == "")
			alert("Chưa điền số lượng thuốc!");
		else if (money == "")
			alert("Chưa điền đơn giá!");
		else {
			$('.drugList').append(`<tr class="R${rowList}"> 
            <th scope="row ">${nameDrug}</th>
            <td>${dvt}</td>
            <td>${numberDrug}</td>
            <td>${money}</td>
            <td>${money * numberDrug}</td>
            <td>
                <!--Xóa dữ liệu ở một hàng -- gọi modal Delete-->
                <button type="button" class="btn btn-danger" title="Xóa"
                    data-toggle="modal" data-target="#modalDelete">
                    <i class="fa fa-trash"></i>
                </button>
            </td>
        </tr>`)
			rowList++;
			alert("Thêm thuốc thành công");
			$('#openAddDrug').modal('toggle');
		}
	})

	$("#cancel").click(function() {
		$("#nameMedicine").val("");
		$("#symptom").val("");
		$("#numDay").val("");
		$("#numDug").val("");
		$("#numDay").val("");
		$("#numTime").val("");
	})


	$("#slide").on("click", function() {
		if ($(this).prop('checked') == true) {
			$("#header").html('Bán theo đơn');
			$("#retail-content").css("display", "none");
			$("#soldPre-content").css("display", "inline");
			$("#wholesale").css("display", "none");
		}
		else {
			$("#header").html('Bán lẻ');
			$("#retail-content").css("display", "inline");
			$("#soldPre-content").css("display", "none");
			$("#wholesale").css("display", "none");
		}
	})


	$('#buttonS').click(function() {
		$.ajax({
			type: "POST",
			url: 'searchDrug',
			data: "name=" + $('#drugNameS').val(),
			success: function(response) {
				var htmlAdd = "";
				for (var i in response) {
					var dataSend = response[i].id + response[i];
					var myJSON = JSON.stringify(dataSend);
					var myvar = '<tr>'
						+ '<th>'
						+ response[i].id.substring(0, 6)
						+ '</th>'
						+ '<th scope="col">'
						+ response[i].name
						+ '</th>'
						+ '<th scope="col">'
						+ '<button id="addDrugList_'
						+ response[i].id
						+ '"'
						+ 'onclick="'
						+ 'addDrugAjax( '
						+ "'"
						+ response[i].id
						+ "'"
						+ '  )'
						+ '"type="button"'
						+ 'data-target="#modalAddDrugToRetail" data-toggle="modal" class="btn btn-primary">'
						+ '<i class="fa fa-plus iconFunc"></i>Thêm vào toa</button>'
						+ '</th>'
						+  '</tr>';
					htmlAdd += myvar;
				}
				$('#ajaxDataSearch').html(htmlAdd);
			}
		});
	});
})
$(function() {

	$("#payment").click(function() {
		
		$.ajax({
			type: "POST",
			url: 'paymentRetail',
			data:{
					"check" :  $('#slide').is(':checked')?"true":"false",
					"doctor":$('#doctorName').val(),
					"address":$('#addressH').val(),
					"diagnostic":$('#diagnosticH').val(),
					"cusfalse":$('#cusCheckfalse').val(),
					"custrue":$('#cusChecktrue').val(),
					"symptom":$('#symptom').val(),
					"note":$('#textnote').val()
					
				},
			success: function(response) {

				switch (response) {
					case "finish":
						$.notify({
							title: '<strong>Thanh Toán Thành Công</strong>',
							icon: 'fa fa-check',
							message: ""
						}, {
							type: 'success',
							animate: {
								enter: 'animated fadeInDown',
								exit: 'animated fadeOutUp'
							},
							placement: {
								from: "top",
								align: "center"
							}
						});
						
							$('#bodyTableRetail').remove();
							$('#totalRetail').val("0.0");

						break;
					case "error":
						$.notify({
							title: '<strong>Thanh Toán Không Thành Công Đã Có Lỗi Xãy Ra</strong>',
							icon: 'fa fa-check',
							message: ""
						}, {
							type: 'danger',
							animate: {
								enter: 'animated fadeInDown',
								exit: 'animated fadeOutUp'
							},
							placement: {
								from: "top",
								align: "center"
							}
						});
						break;
					case "isEmpty":
						$.notify({
							title: '<strong>Không có sản phẩm nào!</strong>',
							icon: 'fa fa-check',
							message: ""
						}, {
							type: 'danger',
							animate: {
								enter: 'animated fadeInDown',
								exit: 'animated fadeOutUp'
							},
							placement: {
								from: "top",
								align: "center"
							}
						});
						break;



				}



			}

		});

	});
	$("#printOrder").click(function() {
		$.notify({
			title: '<strong>In phiếu thành công</strong>',
			icon: 'fa fa-check',
			message: ""
		}, {
			type: 'success',
			animate: {
				enter: 'animated fadeInDown',
				exit: 'animated fadeOutUp'
			},
			placement: {
				from: "top",
				align: "center"
			}
		});
	});
})
