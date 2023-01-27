<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="staff/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<style>
.tr-mr { height: 100px; }
.textarea-mr { height: 100px !important; }
</style>
</head>
<body>
	<input type="hidden" id="patient_id"/>
	<input type="hidden" id="time"/>
	<div class="container-fluid">
		<div class="flex">
			<h1 class="h3 mb-2 text-gray-800">환자진료</h1>
			<div id="spinner" class="ml-2 spinner-border text-primary" role="status" style="display: none"></div>
		</div>
		<div class="row">
			<div class="col-lg-3 mb-4">
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
				<div class="card shadow" style="height: 370px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">과거 진료기록</h6>
					</div>
					<div class="card-body">
						<table id="old_medical_record" class="table">
							<thead>
								<tr>
									<th scope="col">시간</th>
									<th scope="col">담당의</th>
									<th scope="col">증상</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card shadow py-1 border-left-info h-100">
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
								<td><textarea id="treatment_mr" class="form-control textarea-mr"></textarea></td>
							</tr>
							<tr class="tr-mr">
								<td>처방</td>
								<td><textarea id="prescription_mr" class="form-control textarea-mr"></textarea></td>
							</tr>
							<tr class="tr-mr">
								<td>의사소견</td>
								<td><textarea id="staff_memo_mr" class="form-control textarea-mr"></textarea></td>
							</tr>
						</table>
						<div class="flexb flexc mt-3">
							<div class="form-check form-switch" style="font-weight: bold; color: black;">
							  <input class="form-check-input" type="checkbox" id="isAdmission">
							  <label class="form-check-label" for="isAdmission">입원</label>
							</div>
							<a onclick="saveMedicalRecord()" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 mb-4">
				<div class="card shadow h-100">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">진료 예약/대기 목록</h6>
					</div>
					<div class="card-body">
						<table id="receipt_table" class="table">
							<thead>
								<tr>
									<th scope="col">시간</th>
									<th scope="col">환자명</th>
									<th scope="col">증상</th>
								</tr>
							</thead>
							<tbody id="receipt">

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		let json = "";
		
		$(document).ready(function () {
			poll();
		});
		
		function poll() {
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
								str += "<td>" + getTime(res[i].time) + "</td>"
								str += "<td>" + res[i].patient_name + "</td>"
								if (typeof res[i].memo == "undefined") str += "<td>-</td>";
								else str += "<td>" + res[i].memo + "</td>";
								str += "<td style='display:none;'>" + res[i].time + "</td>";
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
							$('#time').val($(this).children("td:eq(4)").text());
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
		}
		
		function saveMedicalRecord() {
			if ($('#patient_id').val() == '') {
				toast('error', '선택된 환자가 없습니다.');
			} else if ($('#treatment_mr').val() == '') {
				toast('error', '진료를 작성해 주세요.');
			} else {
				if ($('#prescription_mr').val() == '' && !$('#isAdmission').is(":checked")) {
					confirm('info', '진료 확인', '환자의 처방이 기록되지 않았습니다.\n해당 환자의 진료기록을 저장하시겠습니까?', function(res) {
						if (res.isConfirmed) insertMedicalRecord();
					})
				} else {
					confirm('info', '진료 확인', '해당 환자의 진료기록을 저장하시겠습니까?', function(res) {
						if (res.isConfirmed) insertMedicalRecord();
					})
				}
			}
		}
		
		function insertMedicalRecord() {
			$('#spinner').css('display', 'inline');
			$.ajax({
				url: 'insertMedicalRecord.st',
				data: {
					patient_id : $('#patient_id').val(),
					treatment_name : $('#treatment_mr').val(),
					prescription_name : $('#prescription_mr').val(),
					admission : $('#isAdmission').is(":checked") ? 'Y' : 'N',
					memo : $('#staff_memo_mr').val()
				},
				success: function(res) {
					if (res) {
						toast('success', '환자의 진료가 저장되었습니다.');
						clearMedicalReceipt();
					} else {
						toast('error', '환자의 진료를 저장하는데 실패했습니다.');
					} 
				},
				error: function(req, text) {
					errorToast(req.status);
				},
				complete: function() {
					$('#spinner').css('display', 'none');
				}
			});
		}
		
		function clearMedicalReceipt() {
			$.ajax({
				url: ''
			});
			$('#patient_id').val('');
			$('#time').val('');
		}
	</script>
</body>
</html>