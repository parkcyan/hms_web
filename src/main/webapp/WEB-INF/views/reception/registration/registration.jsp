<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="reception/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<style>
.tr-mr {
	height: 100px;
}

.btn {
margin-right: 10px;
}
.textarea-mr {
	height: 100px !important;
	}
.input-group{
 	margin:10px;
}	
</style>
</head>
<body>
	<input type="hidden" id="patient_id"/>
	<input type="hidden" id="time"/>
	<div class="container-fluid">
		<h1 class="h3 mb-4 text-gray-800">신규 등록</h1>
				<div class="row">
			<div class="col-lg-3">
		
		</div>
		</div>
		
		<div class="row">
		
			<div class="col-lg-3">
	
		</div>
				<div class="card shadow mb-4 py-1 border-left-primary">
					<div class="card-body patient-mini-table">
						<table id="patient-mini-table">
				
							<tr>
								<td>이름</td>
								<td><input class="form-control" type="text" id="patient_name" disabled /></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><lable><input type ='radio' value ='M' name ='gender' >남</lable>
								<label></label><input type ='radio' value ='W' name ='gender' checked >여</label> </td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control" id="birthdate" type="text" placeholder="yyyymmdd" /></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input class="form-control input-mini" id="phone_number" type="text" 
								placeholder="-없이 입력하세요" maxlength="13" /></td>
							</tr>
							
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
					
							<button type="button" class="btn btn-primary ptient-insert" href='patientInfo.re'>취소</button>
							<button type='button' class="btn btn-primary" onclick ="history.go(-1)">등록</button>
				
						</div>			
					</div>
				</div>
			
			</div>
				
		</div>
	</div>
	<script>
		$(document).ready(function () {
			let json = "";
			(function poll() {
				$.ajax({
					url: 'getMedicalReceipt.st',
					dataType: 'json',
					success: function (res) {
						if (JSON.stringify(res) != JSON.stringify(json)) {
							$('#receipt *').remove();
							let str = "";
							if (res == "[]") 
								str += "<tr><td>데이터가 없습니다.</td></tr>"
							else {
								$.each(res, function (i) {
									str += "<tr>"
									str += "<td style='display:none;'>" + res[i].patient_id + "</td>";
									str += "<td>" + res[i].time + "</td>"
									str += "<td>" + res[i].patient_name + "</td>"
									if (typeof res[i].memo == "undefined") 
										str += "<td>-</td>";
									else 
										str += "<td>" + res[i].memo + "</td>"
									str += "</tr>"
								});
							}
							$('#receipt').append(str);
							$('#receipt tr').hover(function () {
								$(this).css('background-color', '#D0E2F4');
								$(this).css('cursor', 'pointer');
							}, function () {
								$(this).css('background-color', 'white');
							})
							$('#receipt tr').click(function () {
								$('#patient_id').val($(this).children("td:eq(0)").text());
								$('#time').val($(this).children("td:eq(1)").text());
								$('#patient_name_mr').val($(this).children("td:eq(2)").text());
								$('#memo_mr').val($(this).children("td:eq(3)").text());
								getPatient($(this).children("td:eq(0)").text());
							})
						}
						json = res;
					},
					timeout: 3000,
					complete: setTimeout(function () {
						poll();
					}, 5000)
				})
			})();
		});
		
		function insertMedicalRecord() {
			if ($('#patient_id').val() == '') {
				toast('error', '선택된 환자가 없습니다.');
			}
		}
	</script>
</body>
</html>