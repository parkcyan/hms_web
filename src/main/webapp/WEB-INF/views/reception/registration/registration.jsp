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
.btn {margin-right: 20px;}
.small{ display: flex;
		justify-content:center;	}
				
.small div{
				margin-top: 20px;
				font-size: 20px; }				
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
.picker__select--month, .picker__select--year { height: 2.5em !important; }
</style>
</head>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">신규 등록</h1>
		<p class="mb-4">
			신규 환자 등록 페이지 입니다.			
		</p>
		<div class="row mb-4">
			<div class="col-lg-4">
				<!-- DataTales Example -->
				<div class="card shadow mb-4 h-100">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">신규환자등록</h6>
							<div id="spinner-mini" class="spinner-border text-primary" style="display: none;" role="status"> </div>
						</div>
					</div>
					<div class="small">
						<div >
						<small class="form-text text-muted mb-1">신규 등록을 해야 접수 및 진료가 가능합니다.</small>
						<small class="form-text text-muted mb-1">이름, 성별, 생년월일, 연락처는 반드시 입력해야 합니다.</small>
						<small class="form-text text-muted mb-1">메모는 신규환자의 특이사항(임신여부, 특이 체질 등)을 입력합니다.</small>
						<small class="form-text text-muted mb-1">메모는 필수 입력사항은 아닙니다.</small>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="card shadow py-1 border-left-info h600">
					<div class="card-body">
					<form action= 'new_patient.re' method="post" onsubmit="if( $('#birthdate').val()=='' ){ alert('생년월일을 선택하세요'); return false }">
						<table id="medical_record_table">
							<tr>
								<td>이름</td>
								<td><input class="form-control w-150" id="patient_name_mr" name='name' type="text" required  /></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><lable><input type ='radio' value ='M' name ='gender' >남</lable>
								<label></label><input type ='radio' value ='W' name ='gender' checked >여</label> </td>
							</tr>
							<tr class="tr-mr">
								<td>생년월일</td>
								<td><input type="text" class="form-control w-100 picker__input" id="birthdate" required
									name ='social_id'  >
								</td>
								
<!-- 								<td><input class="form-control w-100" id="birthdate" type="text" name ='social_id' required -->
<!-- 								 placeholder="yymmdd" maxlength="6"/></td> -->
							<tr class="tr-mr">
								<td>연락처</td>
								<td><input class="form-control w-100 input-mini" id="phone_number" name ='phone_number' required type="text" 
								placeholder="-없이 입력하세요" maxlength="13" /></td>
							</tr>
							<tr class="tr-mr">
								<td>메모사항 <i class="fas fa-pen"></i></td>
								<td><textarea class="form-control textarea-mr" id="memo_mr"></textarea></td>
							</tr>
					
						</table>
							<div class="d-sm-flex flex-row-reverse mt-3">
							<button type="button" class="btn btn-primary" onclick ="history.go(0)">취소</button>
							<button type="submit" class="btn btn-primary">신규등록</button>						
						</div>
						</form>
					
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
    		$('#birthdate').css('background-color', '#fff');
    		$('#birthdate').pickadate({selectYears: true});
    		$('#birthdate').val(getDate(getCurrentTimeStamp()))
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
/* 		function searchMedicalRecord() {
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
		} */
    </script>
</body>
</html>