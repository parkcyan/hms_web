<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="staff/css/calendar-picker/classic.css" rel="stylesheet">
<link href="staff/css/calendar-picker/classic.date.css" rel="stylesheet">
<style>

.form-control:disabled { background: white; }
.textarea-mr { height: 100px !important; }
.form-check { font-size: 0.8rem; }
.form-check-input { margin-top: 0.2rem; }
.fa-calendar-alt { font-size: 1.5rem; }
.calendar { width: 45%; }
#outpatient_record_table td, #outpatient_record_table th { padding: 0.3rem; }
#outpatient_record_table tbody {
    display: block;
    height: 200px;
    overflow: auto;
}
#outpatient_record_table thead, #outpatient_record_table tbody tr {
    display: table;
    width: 100%;
    table-layout: fixed;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">진료 기록 조회</h1>
		<p class="mb-4">
			항목을 클릭하시면 환자의 자세한 정보, 진료기록을 볼 수 있습니다.			
		</p>
		<div class="row mb-4">
			<div class="col-lg-4">
				<!-- DataTales Example -->
				<div class="card shadow mb-4 h-100">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">진료기록 검색</h6>
							<div id="spinner-mini" class="spinner-border text-primary" style="display: none;" role="status"> </div>
						</div>
					</div>
					<div class="card-body">
						<p class="fwb mb-1">환자명</p>
						<div class="form-inline mb-1">
							<input id="patient_name_search" onkeyup="searchEnterKey()" class="form-control mr-sm-2" placeholder="환자명" aria-label="Search">
							<button id="patient_name_search_button" class="btn btn-primary my-2 my-sm-0" onclick="searchMedicalRecord()">검색</button>
						</div>
						<small class="form-text text-muted mb-1">빈칸으로 검색할 시 설정된 조건에서 전체 검색됩니다.</small>
						<p class="fwb mb-1">날짜</p>
						<div class="flexb flexc mb-1">
							<div class="calendar form-group mb-0 flexb flexc">
								<input type="text" class="form-control mb-0" id="date1" placeholder="Pick A Date">
								<i class="far fa-calendar-alt ml-2"></i>
							</div>
							<p class="mb-0">~</p>
							<div class="calendar form-group mb-0 flexb flexc">
								<input type="text" class="form-control" id="date2" placeholder="Pick A Date">
								<i class="far fa-calendar-alt ml-2"></i>
							</div>
						</div>
						
						<table id="outpatient_record_table" class="table mt-2">
							<thead>
								<tr>
									<th scope="col" style="width: 30%;">진료날짜</th>
									<th scope="col" style="width: 15%;">환자명</th>
									<th scope="col" style="width: 15%;">진료의</th>
									<th scope="col" style="width: 30%;">진단명</th>
									<th scope="col" style="width: 10%;">*</th>
								</tr>
							</thead>
							<tbody id="outpatient_record">

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card shadow py-1 border-left-info h600">
					<div class="card-body">
						<table id="medical_record_table">
							
							<tr>
								<td>이름</td>
								<td><input class="form-control w-200" id="patient_name_mr"
									type="text" disabled /></td>
							</tr>
							<tr>
								<td>진료날짜</td>
								<td><input class="form-control w-200" id="patient_name_mr"
									type="text" disabled /></td>
							</tr>
							<tr>
								<td>진료과</td>
								<td><input class="form-control" id="memo_mr" type="text"
									disabled /></td>
								<td>진료의</td>
								<td><input class="form-control" id="memo_mr" type="text"
									disabled /></td>
							</tr>
							<tr class="tr-mr">
								<td>진료내역</td>
								<td><textarea class="form-control textarea-mr  w-200"
										id="treatement_mr" disabled></textarea></td>
							</tr>
							<tr class="tr-mr">
								<td>처방내역</td>
								<td><textarea class="form-control textarea-mr"
										id="prescription_mr" disabled></textarea></td>
							</tr>
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
    		$('#date1').pickadate();
    		$('#date2').pickadate();
    		$('#date1').val(getDate(timeStampOperator(getCurrentTimeStamp(), 'month', -2)));
    		$('#date2').val(getDate(getCurrentTimeStamp()))
    	});
    	
    	// 항목 hover, click 이벤트
    	$('#dataTable tr:not(:first-child)').hover(function(){
    		 $(this).css('background-color','#D0E2F4');
    		 $(this).css('cursor','pointer');
    	}, function(){
    		 $(this).css('background-color','white');
    	});
    	
    	// 엔터키 처리
    	function searchEnterKey() {
			if (window.event.keyCode == 13) {
				 $("#patient_name_search_button").trigger("click");
			}
    	}
			
		// 진료기록 검색
		function searchMedicalRecord() {
			$("#spinner-mini").css('display', 'inline');
			let option = '';
			if ($('#department_search').is(":checked")) option = 'department';
			else if ($('#mypatient_search').is(":checked")) option = 'mypatient';
			$.ajax({
				url: 'getMedicalRecord.st',
				dataType: 'json',
				data: {
					first_date: $("#date1").val(),
					second_date: $("#date2").val(),
					patient_name: $("#patient_name_search").val(),
					option: option	
				}, 
				success: function(res) {
					$('#outpatient_record *').remove();
					let str = "";
					$.each(res, function (i) {
						str += "<tr>"
						str += "<td style='display:none;'>" + res[i].medical_record_id + "</td>";
						str += "<td style='width: 30%;'>" + res[i].treatment_date + "</td>"
						str += "<td style='width: 15%'>" + res[i].patient_name+ "</td>"
						str += "<td style='width: 15%'>" + res[i].staff_name + "</td>"
						str += "<td style='width: 30%'>" + res[i].treatment_name + "</td>"
						str += "<td style='width: 10%'>" + '*' + "</td>"
						str += "</tr>"
					});
					$('#outpatient_record').append(str);
					$('#outpatient_record tr').hover(function() {
						$(this).css('background-color', '#D0E2F4');
						$(this).css('cursor', 'pointer');
					}, function() {
						$(this).css('background-color', 'white');
					});
				},
				error: function(req, text) {
					errorToast(req.status);
				},
				complete: function() {
					$('#spinner-mini').css('display', 'none');
				}
			});
		}
    </script>
</body>
</html>