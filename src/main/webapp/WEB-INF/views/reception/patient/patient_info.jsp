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
#info td { color: black; }
#info td:first-child, #info td:nth-child(3) {
	width: 100px;
	font-weight: bold;
	padding-left: 5px;
}
#info td:nth-child(3) { width: 90px; }
.form-control {	display: inline; }
.form-control:disabled { background: white; }
.input-mini { width: 80px; }
textarea { height: 75% !important; }
</style>
</head>
<body>
	<input id="patient_id" type="hidden" value="${patient_id}" name='patient_id'/>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">환자 상세정보 조회</h1>
		<p class="mb-4">환자의 정보, 진료이력을 조회하실 수 있습니다.</p>
		<div class="row">
			<div class="col-lg-6 mb-4">
				<div class="card shadow py-1 border-left-primary" style="height: 14rem;">
					<div class="card-body">
					<form action= 'patient_info.re'  method='get'>
					<input id="patient_id" type="hidden" value="${patient_id}" name="id" />
						<table id="info">
							<tr>
								<td>이름</td>
								<td><input class="form-control" type="text"
									value="${list[0].patient_name}" disabled /></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input class="form-control input-mini" id="age"
									type="text" value="${list[0].social_id}" disabled /> 세</td>
								<td>성별</td>
								<td><input class="form-control input-mini" id="age"
									type="text" value="${list[0].gender eq 'M' ? '남' : '여'}"
									disabled /></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control" id="birthdate" type="text"
									value="${list[0].social_id}" disabled /></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input class="form-control" id="birthdate" type="text"
									value="${list[0].phone_number}" disabled /></td>
							</tr>
					
							
						</table>
						</form>
					</div>
				</div>
			</div>
		
			
		</div>
		<div class="row">
			<div class="col-lg-6 mb-4">
				<div class="card shadow h-100"">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">진료기록</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered medical_record" id="dataTable"
								width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>진료의</th>
										<th>진단</th>
										<th>진료날짜</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="vo">
										<tr>
											<td>${vo.staff_name}</td>
											<td>${vo.treatment_name}</td>
											<td>${vo.treatment_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		
			<div class="col-lg-6 mb-4">
				<div class="card shadow h-100">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">입원기록</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered admission_record"
								id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>담당의</th>
										<th>입원기간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${admission_record}" var="va">
										<tr>
											<td>${va.staff_name}(${va.department_name})</td>
											<td>${va.admission_date}~${va.discharge_date}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function send_payment() {
		var patient_id = $('#patient_id').val();
		console.log(patient_id);
		console.log($('#total_money').val());
		$.ajax({
			  data : {
			    	money : money, 
			    	id : $('#acceptance_record_id').val() 
				},
		    url:'acceptance_update.re',
		    type:"POST",
		  
		    success: function(result) {
		    	if($('#confirm').val() != null){
		    		alert('이미 수납처리 된 항목입니다.');
		    	}else {
						alert('수납 되었습니다.');
        					location.reload();
			
						}
		    	
		    }
		    	
		   
		});
	}
	
	
		$(document).ready(function() {
			$('#age').val(getAge($('#age').val()));
			$('#birthdate').val(getBirthDate($('#birthdate').val()));

			$('.admission_record').DataTable({
				searching : false,
				paging : false,
				language : {
					info : "",
					infoEmpty : "",
					scrollY : "200px"
				}
			});
			$('.medical_record').DataTable({
				searching : false,
				paging : false,
				language : {
					info : "",
					infoEmpty : "",
					scrollY : "200px"
				}
			});
		})
		function updateInfo() {
			if ($('#height').val() > 300 || $('#height').val() < 10)
				toast('error', '정확한 신장을 입력해 주세요.')
			else if ($('#weight').val() > 300 || $('#weight').val() < 10)
				toast('error', '정확한 체중을 입력해 주세요.')
			else {
				$.ajax({
					url : 'updatePatient.st',
					data : {
						patient_id : $("#id").val(),
						blood_type : $('#blood_type').val(),
						height : $("#height").val(),
						weight : $("#weight").val(),
						underlying_disease : $("#underlying_disease").val(),
						allergy : $("#allergy").val()
					},
					success : function(response) {
						toast('success', '환자의 정보가 수정되었습니다.');
					},
					error : function(req, text) {
						errorToast(req.status);
					}
				});
			}
		}
		function updateMemo() {
			$.ajax({
				url : 'updatePatientMemo.st',
				data : {
					id : $("#id").val(),
					memo : $("#memo").val()
				},
				success : function(response) {
					toast('success', '환자의 메모가 저장되었습니다.');
				},
				error : function(req, text) {
					errorToast(req.status);
				}
			});
		}
	</script>
	<!-- Page level plugins -->
	<script src="staff/vendor/datatables/jquery.dataTables.js"></script>
	<script src="staff/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Page level custom scripts -->
	<script src="staff/js/demo/datatables-demo.js"></script>
</body>
</html>