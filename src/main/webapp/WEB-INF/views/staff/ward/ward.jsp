<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	.ward {
		width: 19%;
	}
	.ward p {
		font-weight: bold;
		margin-bottom: 3px;
	}
	.ward-table {
		width: 100%;
		font-size: 0.8rem;
	}
	.ward-table tr td {
		width: 25%;
		text-align: center;
		padding: 3px;
		vertical-align: middle;
	}
</style>
<body>
	<div class="container-fluid">
		<div class="flexb">
			<div class="flex">
				<h1 class="h3 mb-2 text-gray-800">병동</h1>
				<div id="spinner" class="ml-2 spinner-border text-primary" role="status"></div>
			</div>
			<ul class="nav nav-pills mb-2">
				<li class="nav-item"><a id="ward5" class="nav-link active" data-toggle="tab" href="#ward5">5병동</a></li>
				<li class="nav-item"><a id="ward6" class="nav-link" data-toggle="tab" href="#ward6">6병동</a></li>
				<li class="nav-item"><a id="ward7" class="nav-link" data-toggle="tab" href="#ward7">7병동</a></li>
			</ul>
		</div>
		<div class="row mb-2">
			<div class="col-lg-12">
				<div class="card shadow py-1">
					<div class="card-body pb-2 pt-2">
						<div class="tab-content">
							<div class="tab-pane fade show active" id="ward5">
								<div class="flexb">
									<div class="ward">
										<p>501호</p>
										<table class="table table-bordered ward-table">
											<tr><td>1번 침대</td><td id="1">-</td><td>2번 침대</td><td id="2">-</td></tr>
											<tr><td>3번 침대</td><td id="3">-</td><td>4번 침대</td><td id="4">-</td></tr>
										</table>
									</div>
									<div class="ward">
										<p>502호</p>
										<table class="table table-bordered ward-table">
											<tr><td>1번 침대</td><td id="5">-</td><td>2번 침대</td><td id="7">-</td></tr>
											<tr><td>3번 침대</td><td id="6">-</td><td>4번 침대</td><td id="8">-</td></tr>
										</table>
									</div>
									<div class="ward">
										<p>503호</p>
										<table class="table table-bordered ward-table">
											<tr><td>1번 침대</td><td id="9">-</td><td>2번 침대</td><td id="10">-</td></tr>
											<tr><td>3번 침대</td><td id="11">-</td><td>4번 침대</td><td id="12">-</td></tr>
										</table>
									</div>
									<div class="ward">
										<p>504호</p>
										<table class="table table-bordered ward-table">
											<tr><td>1번 침대</td><td id="13">-</td><td>2번 침대</td><td id="14">-</td></tr>
											<tr><td>3번 침대</td><td id="15">-</td><td>4번 침대</td><td id="16">-</td></tr>
										</table>
									</div>
									<div class="ward">
										<p>505호</p>
										<table class="table table-bordered ward-table">
											<tr><td>1번 침대</td><td id="17">-</td><td>2번 침대</td><td id="18">-</td></tr>
											<tr><td>3번 침대</td><td id="19">-</td><td>4번 침대</td><td id="0">-</td></tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3">
				<div class="card shadow mb-4 py-1 border-left-primary">
					<div class="card-body patient-mini-table">
						<table id="patient-mini-table">
							<tr>
								<td>이름</td>
								<td><input class="form-control" type="text" id="patient_name" disabled /></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input class="form-control input-mini" id="age"
									type="text" disabled /> 세</td>
								<td>성별</td>
								<td><input class="form-control input-mini" id="gender"
									type="text" disabled /></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control" id="birthdate" type="text" disabled /></td>
							</tr>
							<tr>
								<td>혈액형</td>
								<td><input class="form-control input-mini" id="blood_type" type="text" disabled /></td>
							</tr>
							<tr>
								<td>신장</td>
								<td><input class="form-control input-mini" id="height" type="number" disabled /> cm</td>
								<td>체중</td>
								<td><input class="form-control input-mini" id="weight" type="number" disabled /> kg</td>
							</tr>
							<tr>
								<td>기저질환</td>
								<td colspan="3"><input class="form-control" id="underlying_disease" type="text" disabled /></td>
							</tr>
							<tr>
								<td>알레르기</td>
								<td colspan="3"><input class="form-control" id="allergy" type="text"disabled /></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">과거 진료기록</h6>
					</div>
					<div class="card-body">
						
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card shadow py-1 border-left-info h600">
					<div class="card-body">
						<table id="medical_record_table">
							<tr>
								<td>이름</td>
								<td><input class="form-control w-25" id="patient_name_mr" type="text" disabled /></td>
							</tr>
							<tr>
								<td>환자 증상</td>
								<td><input class="form-control" id="memo_mr" type="text" disabled /></td>
							</tr>
							<tr class="tr-mr">
								<td>진료</td>
								<td><textarea class="form-control textarea-mr"></textarea></td>
							</tr>
							<tr class="tr-mr">
								<td>처방</td>
								<td><textarea class="form-control textarea-mr"></textarea></td>
							</tr>
							<tr class="tr-mr">
								<td>의사소견</td>
								<td><textarea class="form-control textarea-mr"></textarea></td>
							</tr>
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
							<a onclick="insertMedicalRecord()" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 mb-4">
				<div class="card shadow h600">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">진료 예약/대기 목록</h6>
					</div>
					<div class="card-body">
						<table id="receipt_table" class="table">
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function wardSelect(ward) {	
			$("#spinner").css('display', 'inline');
			$.ajax ({
				url: 'getAdmissionRecordWard.st',
				dataType: 'json',
				data: {
					ward_number : ward
				},
				success: function(res) {
					console.log(res);
					let patientList = [];
					$.each(res, function(i){
						let wardId = res[i].ward_id % 20;
						patientList.push(wardId);
						$("#" + wardId).text(res[i].patient_name);
						$("#" + wardId).hover(function() {
							$(this).css('background-color', '#D0E2F4');
							$(this).css('cursor', 'pointer');
						}, function() {
							$(this).css('background-color', 'white');
						});
					});
					for (var i = 0; i < 20; i++) {
						if (!patientList.includes(i)) {
							$("#" + i).text('-');
							$("#" + i).hover(function() {
								$(this).css('background-color', 'white');
								$(this).css('cursor', 'default');
							}, function() {
								$(this).css('background-color', 'white');
							});
						}
					}
				},
				error: function(req, text) {
					errorToast(req.status);
					
				},
				complete: function() {
					$('.ward').each(function(index, item) {
						let text = $(this).children('p').text();
						$(this).children('p').text(text.replaceAt(0, ward));
					});
					$("#spinner").css('display', 'none');
				}
			});
		}
		
		$('#ward5').click(function(){
			wardSelect(5);
		});
		
		$('#ward6').click(function(){
			wardSelect(6);
		});
		
		$('#ward7').click(function(){
			wardSelect(7);
		});
	</script>
</body>
</html>