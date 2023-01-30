<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="staff/css/calendar-picker/classic.css" rel="stylesheet">
<link href="staff/css/calendar-picker/classic.date.css" rel="stylesheet">
<style>
.ward { width: 19%; }
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
.fa-calendar-alt { font-size: 1.5rem; }
#admission_record_table td:first-child {
	background: whitesmoke;
	font-weight: bold;
	width: 30%;
}
#admission_memo_table td, #admission_memo_table th, #admission_record_search_table td, #admission_record_search_table th {
	padding: 0.3rem;
}
#admission_memo_table span { font-weight: bold; }
#admission_memo_table tbody { overflow-y: scroll; }
#admission_memo_table tbody tr td:last-child {
	vertical-align: middle;
	text-align: center;
	color: red;
	font-size: 1.2rem;
}
.form-check { font-size: 0.8rem; }
.form-check-input { margin-top: 0.2rem; }
#admission_memo_table tbody {
    display: block;
    height: 350px;
    overflow: auto;
}
#admission_memo_table tbody::-webkit-scrollbar {
	display: none;
}
#admission_memo_table thead, #admission_memo_table tbody tr {
    display: table;
    width: 100%;
    table-layout: fixed;
}
</style>
<body>
	<input type="hidden" id="patient_id"/>
	<input type="hidden" id="admission_record_id"/>
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
								<td colspan="3"><input class="form-control" id="allergy" type="text" disabled/></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">환자 입원 정보</h6>
							<div id="spinner-mini-art" class="spinner-border text-primary" role="status" style="display: none;"></div>
						</div>
					</div>
					<div class="card-body">
						<table id="admission_record_table" class="table">
							<tr style="display: none;">
								<td>staff_id_reocrd</td>
								<td id="staff_id_record"></td>
							</tr>
							<tr>
								<td>병명</td>
								<td id="treatment_name"></td>
							</tr>
							<tr>
								<td>담당의</td>
								<td id="staff_name"></td>
							</tr>
							<tr>
								<td>부서</td>
								<td id="department"></td>
							</tr>
							<tr>
								<td>입원일자</td>
								<td id="admission_date"></td>
							</tr>
							<tr>
								<td style="vertical-align: middle;">퇴원일자</td>
								<td>
									<div class="calendar form-group mb-0 flexb flexc">
										<input type="text" class="form-control" id="discharge_date"> <i class="far fa-calendar-alt ml-2"></i>
									</div>
								</td>
							</tr>
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
							<a onclick="updateDischargeDate()" class="btn btn-primary">퇴원일자 저장</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5 mb-4">
				<div class="card shadow h-100">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">환자상태기록</h6>
					</div>
					<div class="card-body">
						<div style="height: 86%">
							<table id="admission_memo_table" class="table">
								<thead>
									<tr>
										<th scope="col" style="width: 12%">시간</th>
										<th scope="col" style="width: 12%">작성자</th>
										<th scope="col" style="width: 66%">기록</th>
										<th scope="col" style="width: 10%; text-align: center;">삭제</th>
									</tr>
								</thead>
								<tbody id="admission_memo">
	
								</tbody>
							</table>
						</div>
						<hr/>
						<div class="flexa flexb">
							<input id="admission_memo_input" type="text" class="form-control" onkeyup="searchEnterKey('memo')" style="width: 80%;"/>
							<a id="insert_memo_button" onclick="insertAdmissionMemo()" class="btn btn-primary" style="width: 15%;">저장</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card shadow h-100">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">병동 환자 검색</h6>
							<div id="spinner-mini" class="spinner-border text-primary" role="status" style="display: none;"></div>
						</div>
					</div>
					<div class="card-body">
						<div class="form-inline mb-1">
							<input id="patient_name_search" onkeyup="searchEnterKey('patient_name')" class="form-control mr-sm-2" placeholder="환자명" aria-label="Search">
							<button id="patient_name_search_button" class="btn btn-primary my-2 my-sm-0" onclick="getAdmissionRecordSearch()">검색</button>
						</div>
						<small class="form-text text-muted mb-1">빈칸으로 검색할 시 설정된 조건에서 전체 검색됩니다.</small>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="flexRadioDefault" id="all_search" checked>
							<label class="form-check-label" for="all_search">입원 환자 전체 검색</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="flexRadioDefault" id="department_search">
							<label class="form-check-label" for="department_search">부서 입원 환자 검색</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="flexRadioDefault" id="mypatient_search" 
							${loginInfo.staff_level == 1 ? '' : 'disabled'}>
							<label class="form-check-label" for="mypatient_search">담당중인 환자 검색 (의사)</label>
						</div>
						<hr/>
						<table id="admission_record_search_table" class="table">
							<thead>
								<tr>
									<th scope="col">이름</th>
									<th scope="col">병동</th>
									<th scope="col">병명</th>
									<th scope="col">담당의</th>
								</tr>
							</thead>
							<tbody id="admission_record_search">

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="staff/js/calendar-picker/popper.min.js"></script>
	<script src="staff/js/calendar-picker/picker.js"></script>
	<script src="staff/js/calendar-picker/picker.date.js"></script>
	<script>
		$(document).ready(function(){
			if ('${loginInfo.department_name}' == '6병동') $("#ward6").trigger('click');
			else if ('${loginInfo.department_name}' == '7병동') $("#ward7").trigger('click');
			else $("#ward5").trigger('click');
			$('#discharge_date').pickadate();
		});
	
		$('#discharge_date').click(function(e){
			e.preventDefault();
			toast('error', 'test');
		});
		
		function wardSelect(ward) {	
			$("#spinner").css('display', 'inline');
			$.ajax ({
				url: 'getAdmissionRecordWard.st',
				dataType: 'json',
				data: {
					ward_number : ward
				},
				success: function(res) {
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
						$("#" + wardId).click(function() {			
							$('#patient_id').val(res[i].patient_id);
							$('#admission_record_id').val(res[i].admission_record_id);
							$('#treatment_name').text(res[i].treatment_name);
							$('#staff_name').text(res[i].staff_name);
							$('#department').text(res[i].department_name);
							$('#admission_date').text(res[i].admission_date);
							$('#staff_id_record').text(res[i].staff_id);
							if (res[i].discharge_date != null) {
								$('#discharge_date').val(res[i].discharge_date);
							} else $('#discharge_date').val('-');
							getPatient(res[i].patient_id);
							getAdmissionMemo();
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
							$("#" + i).off('click');
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
		
		function getAdmissionRecordSearch() {
			let option = '';
			if ($('#department_search').is(":checked")) option = 'department';
			else if ($('#mypatient_search').is(":checked")) option = 'mypatient';
			$('#spinner-mini').css('display', 'inline');
			$.ajax({
				url: 'getAdmissionRecordSearch.st',
				dataType: 'json',
				data: {
					patient_name: $("#patient_name_search").val(),
					option: option
				},
				success: function(res) {
					$('#admission_record_search *').remove();
					let str = "";
					$.each(res, function (i) {
						str += "<tr>"
						str += "<td style='display:none;'>" + res[i].patient_id + "</td>";
						str += "<td style='display:none;'>" + res[i].admission_record_id + "</td>";
						str += "<td style='display:none;'>" + res[i].treatment_name + "</td>";
						str += "<td style='display:none;'>" + res[i].staff_name + "</td>";
						str += "<td style='display:none;'>" + res[i].department_name + "</td>";
						str += "<td style='display:none;'>" + res[i].admission_date + "</td>";
						str += "<td style='display:none;'>" + res[i].discharge_date + "</td>";
						str += "<td style='display:none;'>" + res[i].staff_id + "</td>";
						str += "<td>" + res[i].patient_name + "</td>"
						str += "<td>" + getWard(res[i].ward_id) + "</td>"
						str += "<td>" + res[i].treatment_name + "</td>"
						str += "<td>" + res[i].staff_name + "</td>"
						str += "</tr>"
					});
					$('#admission_record_search').append(str);
					$('#admission_record_search tr').hover(function() {
						$(this).css('background-color', '#D0E2F4');
						$(this).css('cursor', 'pointer');
					}, function() {
						$(this).css('background-color', 'white');
					})
					$('#admission_record_search tr').click(function() {
						$('#patient_id').val($(this).children('td:eq(0)').text());
						$('#admission_record_id').val($(this).children('td:eq(1)').text());
						$('#treatment_name').text($(this).children('td:eq(2)').text());
						$('#staff_name').text($(this).children('td:eq(3)').text());
						$('#department').text($(this).children('td:eq(4)').text());
						$('#admission_date').text($(this).children('td:eq(5)').text());
						if ($(this).children('td:eq(6)').text() != 'undefined') {
							$('#discharge_date').val($(this).children('td:eq(6)').text());
						} else $('#discharge_date').val('-');
						$('#staff_id_record').text($(this).children('td:eq(7)').text());
						getPatient($(this).children('td:eq(0)').text());
						getAdmissionMemo();
					})
				},
				error: function(req, text) {
					errorToast(req.status);
				},
				complete: function() {
					$('#spinner-mini').css('display', 'none');
				}
			})
		}
		
		function getAdmissionMemo() {
			$("#spinner").css('display', 'inline');
			$.ajax({
				url: 'getAdmissionMemo.st',
				dataType: 'json',
				data: {
					id: $('#admission_record_id').val()
				},
				success: function(res) {
					$('#admission_memo *').remove();
					let str = "";
					$.each(res, function (i) {
						str += "<tr>"
						if (i == 0 || getDate(res[i].write_date) != getDate(res[i - 1].write_date)) {
							str += "<td style='width: 12%;'><span>" + getMonthDay(res[i].write_date) + '</span><br>' + getTime(res[i].write_date) + "</td>"
						}  else str += "<td style='width: 12%;'>" + getTime(res[i].write_date) + "</td>"
						str += "<td style='width: 12%;'>" + res[i].name+ "</td>"
						str += "<td style='width: 66%;'>" + res[i].memo + "</td>"
						if (${loginInfo.staff_id} == res[i].staff_id) {
							str += "<td style='width: 10%;'><i class='fas fa-times'><p style='display:none;'>" + res[i].admission_memo_id + "</p></i></td>"
						} else str += "<td style='width: 10%;'></td>"
						str += "</tr>";	
					});
					$('#admission_memo').append(str);
					$('#admission_memo i').hover(function() {
						$(this).css('cursor', 'pointer');
					});
					$('#admission_memo i').click(function() {
						let id = $(this).children('p').text();
						confirm('warning', '환자상태기록 삭제', '정말로 환자상태기록을 삭제하시겠습니까?', function(res) {
							if (res.isConfirmed) deleteAdmissionMemo(id);
						})
					});
				},
				error: function(req, text) {
					errorToast(req.status);
				},
				complete: function() {
					$("#spinner").css('display', 'none');
				}
			});
		}
		
		function insertAdmissionMemo() {
			let memo = $('#admission_memo_input').val();
			if ($('#admission_record_id').val() == '') {
				toast('error', '선택된 환자가 없습니다.');
			} else if (memo.trim() == '') {
				toast('error', '기록을 작성해 주세요.');
			} else {
				$("#spinner").css('display', 'inline');
				$.ajax({
					url: 'insertAdmissionMemo.st',
					data: {
						id: $('#admission_record_id').val(),
						memo: memo
					},
					success: function(res) {
						if (res) {
							toast('success', '환자상태기록이 저장되었습니다.');
							getAdmissionMemo();
							 $('#admission_memo_input').val('');
						} else {
							toast('error', '환자상태기록을 저장하는데 실패했습니다.');
						}
					},
					error: function(req, text) {
						errorToast(req.status);
					}
				});
			}
		}
		
		function deleteAdmissionMemo(id) {
			$("#spinner").css('display', 'inline');
			$.ajax({
				url: 'deleteAdmissionMemo.st',
				data: {
					id: id,
				},
				success: function(res) {
					if (res) {
						toast('success', '환자상태기록이 삭제되었습니다.');
						getAdmissionMemo();
					} else {
						toast('error', '환자상태기록을 삭제하는데 실패했습니다.');
					}
				},
				error: function(req, text) {
					errorToast(req.status);
				}
			});
		}
		
		function searchEnterKey(keyword) {
			if (window.event.keyCode == 13) {
				if (keyword == 'patient_name') $("#patient_name_search_button").trigger("click");
				else if (keyword == 'memo')  $("#insert_memo_button").trigger("click");
			}
		}
		
		function updateDischargeDate() {
			if ($('#admission_record_id').val() == '') {
				toast('error', '선택된 환자가 없습니다.');
			} else if ($('#staff_id_record').text() != $('#id').val()) {
				toast('error', '환자의 담당의만 퇴원일자를 수정할 수 있습니다.');
			} else {
				let date = $('#discharge_date').val();
				confirm('warning', '퇴원일자 수정', '정말로 퇴원일자(예정)를 "' + date + '" 로 수정하시겠습니까?' , function(res) {
					if (res.isConfirmed) {
						$('#spinner-mini-art').css('display', 'inline');
						$.ajax({
							url: 'updateDischargeDate.st',
							data: {
								date: date,
								id: $('#admission_record_id').val()
							},
							success: function(res) {
								if (res) {
									toast('success', '환자의 퇴원일자(예정)를 수정했습니다.');
								} else {
									toast('error', '환자의 퇴원일자(예정)를 수정하는데 실패했습니다.');
								}
							},
							error: function(req, text) {
								errorToast(req.status);
							}, 
							complete: function() {
								$('#spinner-mini-art').css('display', 'none');
							}
						});
					}
				})
			}
		}
	</script>
</body>
</html>