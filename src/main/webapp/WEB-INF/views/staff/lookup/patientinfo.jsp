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
#info .form-control { display: inline; }
#info .form-control:disabled { background: white; }
.input-mini { width: 80px; }
textarea { height: 75% !important; }
</style>
</head>
<body>
	<input id="id" type="hidden" value="${patient.patient_id}" />
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">환자 상세정보 조회</h1>
		<p class="mb-4">환자의 정보, 메모를 조회, 수정하거나 진료이력을 조회하실 수 있습니다.</p>
		<div class="row">
			<div class="col-lg-5 mb-4">
				<div class="card shadow py-1 border-left-primary" style="height: 24rem;">
					<div class="card-body">
						<table id="info">
							<tr>
								<td>이름</td>
								<td><input class="form-control" type="text"
									value="${patient.name}" disabled /></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input class="form-control input-mini" id="age"
									type="text" value="${patient.social_id}" disabled /> 세</td>
								<td>성별</td>
								<td><input class="form-control input-mini" id="age"
									type="text" value="${patient.gender eq 'M' ? '남' : '여'}"
									disabled /></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control" id="birthdate" type="text"
									value="${patient.social_id}" disabled /></td>
							</tr>
							<tr>
								<td>혈액형 <i class="fas fa-pen"></i></td>
								<td><input class="form-control input-mini" id="blood_type"
									type="text" value="${patient.blood_type}" /></td>
							</tr>
							<tr>
								<td>신장 <i class="fas fa-pen"></i></td>
								<td><input class="form-control input-mini" id="height"
									type="number" value="${patient.height}" /> cm</td>
								<td>체중 <i class="fas fa-pen"></i></td>
								<td><input class="form-control input-mini" id="weight"
									type="number" value="${patient.weight}" /> kg</td>
							</tr>
							<tr>
								<td>기저질환 <i class="fas fa-pen"></i></td>
								<td colspan="3"><input class="form-control"
									id="underlying_disease" type="text"
									value="${patient.underlying_disease}" placeholder="없음" /></td>
							</tr>
							<tr>
								<td>알레르기 <i class="fas fa-pen"></i></td>
								<td colspan="3"><input class="form-control" id="allergy"
									type="text" value="${patient.allergy}" placeholder="없음"/></td>
							</tr>
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
							<a onclick="updateInfo()" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5 mb-4">
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
									<c:forEach items="${medical_record}" var="vo">
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
			
		</div>
		<div class="row">
			<div class="col-lg-5 mb-4">
				<div class="card shadow" style="height: 24rem;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">메모</h6>
					</div>
					<div class="card-body">
						<textarea id="memo" class="form-control" spellcheck="false">${patient.memo}</textarea>
						<div class="d-sm-flex flex-row-reverse mt-2">
							<a onclick="updateMemo()" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5 mb-4">
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