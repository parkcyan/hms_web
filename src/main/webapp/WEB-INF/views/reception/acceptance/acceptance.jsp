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

.textarea-mr {
	height: 100px !important;
}
.tr{
	margin:10px;
}
.tr td {
	margin-top: 20px;
}

.btn {
	margin-right: 20px;
}

.navbar-search{
	margin-top: 10px;
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
		<h1 class="h3 mb-4 text-gray-800">수납조회</h1>
				<div class="row">
			<div class="col-lg-3">				
		</div>
		</div>
		
		<div class="row">
			<div class="col-lg-3">

			
		<div class="card shadow mb-4 py-1 border-left-primary">			
		<form
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-3 small"
				placeholder="환자명을 입력하세요" aria-label="Search" name="name"
				aria-describedby="basic-addon2" value="${name}">
			<div class="input-group-append">
				<a class="btn btn-primary" onclick="$('form').submit();"  >
					<i class="fas fa-search fa-sm"></i>
				</a>
			</div>
		</div>
	</form>
		</div>
				<div class="card shadow mb-4 py-1 border-left-primary">
					<div class="card-body patient-mini-table">
						<table id="patient-mini-table">
							<tr>
								<td>이름</td>
								<td><input class="form-control input-mini" id="gender"
									type="text" disabled placeholder="${vo.acceptance_date}" /></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><input class="form-control input-mini" id="gender"
									type="text" disabled /></td>
							</tr>
							<td>연락처</td>
								<td><input class="form-control input-mini" id="phone_number"
									type="text" disabled /></td>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control" id="social_id" type="text" disabled /></td>
							</tr>
							
						</table>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">과거 수납 이력</h6>
					</div>
					<div class="card-body">
						<table id="old_medical_record" class="table">
							<thead>
								<tr>
									<th scope="col">수납일자</th>
									<th scope="col">진료일자</th>
									<th scope="col">금액</th>
								</tr>
							</thead>
							<c:forEach items="${list}" var="vo">
							<tr>
								<td>${vo.acceptance_date}</td>
								<td>${vo.acceptance_date}</td>
								<td>${vo.medical_expenses}</td>
								<td style="display: none;">${vo.acceptance_date}</td>
								<td style="display: none;">${vo.doctor}</td>
								<td style="display: none;">${vo.acceptance_record_id}</td>
								<td style="display: none;">${vo.medical_expenses}</td>
								<td style="display: none;">${vo.acceptance_record_id}</td>
								<td style="display: none;">${vo.acceptance_record_id}</td>
							</tr>
							
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card shadow mb-4 py-1 border-left-info h1000">
					<div class="card-body">
						<table id="medical_record_table">
						<div class="py-3">
						<h6 class="m-0 font-weight-bold text-primary">진료비 내역</h6>
					</div>
						<c:if test="${list eq null }">
						<tr>
								<td>진료일자</td>
								<td><input class="form-control" id="acceptance_date" type="text" disabled/></td>
								<td>담당의사</td>
								<td><input class="form-control" id="doctor" type="text" disabled /></td>
							</tr>

							<tr>
								<td>총진료비</td>
								<td><input class="form-control" id="" type="text" disabled /></td>
							</tr>
							<tr>
								<td>진료비</td>
								<td><input class="form-control" id="" type="text" disabled /></td>
							</tr>
							<tr>
								<td>검사비</td>
								<td><input class="form-control" id="memo_mr" type="text" disabled/></td>
							</tr>
							<tr>
								<td>입원비</td>
								<td><input class="form-control" id="memo_mr" type="text" disabled /></td>
							</tr>
							<tr>
								<td>처치 및 처방비</td>
								<td><input class="form-control" id="memo_mr" type="text" disabled /></td>
							</tr>
											
						</c:if>
							
						<c:if test="${list ne null }"	>
							<tr>
								<td>진료일자</td>
								<td><input class="form-control" id="acceptance_date" type="text" value="${list[0].doctor }" disabled/></td>
								<td>담당의사</td>
								<td><input class="form-control" id="doctor" type="text" disabled /></td>
							</tr>

							<tr>
								<td>총진료비</td>
								<td><input class="form-control" id="" type="text" disabled /></td>
							</tr>
							<tr>
								<td>진료비</td>
								<td><input class="form-control" id="" type="text" disabled /></td>
							</tr>
							<tr>
								<td>검사비</td>
								<td><input class="form-control" id="memo_mr" type="text" disabled/></td>
							</tr>
							<tr>
								<td>입원비</td>
								<td><input class="form-control" id="memo_mr" type="text" disabled /></td>
							</tr>
							<tr>
								<td>처치 및 수술비</td>
								<td><input class="form-control" id="operation_fee" type="text" disabled /></td>
							</tr>
						</c:if>		
						</table>					
					</div>
				</div>
			</div>
			<div class="card shadow mb-4 py-1 border-left-primary">
					<div class="card-body patient-mini-table">
						<table id="patient-mini-table">
							<tr>
								<td>받을 금액</td>
								<td><input class="form-control" type="text" id="patient_name" disabled /></td>
							</tr>
							<tr>
								<td>공단부담금</td>
								<td><input class="form-control input-mini" id="gender"
									type="text" disabled /></td>
							</tr>
							<td>환자부담금</td>
								<td><input class="form-control input-mini" id="phone_number"
									type="text" disabled /></td>	
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
					
							<button type="button" class="btn btn-primary ptient-insert" href='patientInfo.re'>납부</button>
							<button type='button' class="btn btn-primary" onclick ="history.go(-1)">취소</button>
				
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
		
		$('#old_medical_record tr').click(function(){
			let acceptance_date = $(this).children('td:eq(3)').text();
			let doctor = $(this).children('td:eq(4)').text();
			let medical_expenses =$(this).children('td:eq(5)').text();
			let inspection_fee =$(this).children('td:eq(6)').text();
			let operation_fee =$(this).children('td:eq(7)').text();
			let admission_fee =$(this).children('td:eq(8)').text();
			$('#acceptance_date').val(acceptance_date);
			$('#doctor').val(doctor);
			$('#medical_expenses').val(medical_expenses);
			$('#inspection_fee').val(inspection_fee);
			$('#operation_fee').val(operation_fee);
			$('#admission_fee').val(admission_fee);	
			
			
			
			<td>${vo.acceptance_date}</td>
			<td>${vo.acceptance_date}</td>
			<td>${vo.medical_expenses}</td>
			<td style="display: none;">${vo.acceptance_date}</td>d
			<td style="display: none;">${vo.doctor}</td>
			<td style="display: none;">${vo.medical_expenses}</td>
			<td style="display: none;">${vo.inspection_fee}</td>d
			<td style="display: none;">${vo.operation_fee}</td>
			<td style="display: none;">${vo.admission_fee}</td>
		});
	</script>
</body>
</html>