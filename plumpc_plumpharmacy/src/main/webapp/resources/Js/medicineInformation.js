(function() {
	'use strict';
	window.addEventListener('load', function() {
		// Get the forms we want to add validation styles to
		var forms = document.getElementsByClassName('needs-validation');
		// Loop over them and prevent submission
		var validation = Array.prototype.filter.call(forms, function(form) {
			form.addEventListener('submit', function(event) {
				if (form.checkValidity() === false) {
					event.preventDefault();
					event.stopPropagation();
				}
				form.classList.add('was-validated');
			}, false);
		});
	}, false);
})();

$(document).ready(function(ev) {
	ev.preventDefault();
	var rowIdx = 1;
	//Thêm thuốc
	$("#addDrug").click(function() {
		$('#drug').append(`<tr> 
           <th scope="row" id="numericalOrder" rowspan="2">${++rowIdx}</th>
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
              <tr>
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
	})
})


