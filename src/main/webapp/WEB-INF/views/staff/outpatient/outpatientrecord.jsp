<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="staff/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
<style>
.form-control:disabled {
	background: white;
}
.textarea-mr {
	height: 100px !important;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">진료 기록 조회</h1>
		<p class="mb-4">
			항목을 클릭하시면 환자의 자세한 정보, 진료기록을 볼 수 있습니다.			
		</p>
		<div class="row">
			<div class="col-lg-6">
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">환자 목록</h6>
							<div id="spinner-mini" class="spinner-border text-primary" role="status"> </div>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card shadow mb-4 py-1 border-left-info h600">
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
								<td><textarea class="form-control textarea-mr" id="treatement_mr" disabled></textarea></td>
							</tr>
							<tr class="tr-mr">
								<td>처방</td>
								<td><textarea class="form-control textarea-mr" id="prescription_mr" disabled></textarea></td>
							</tr>
							<tr class="tr-mr">
								<td>의사소견 <i class="fas fa-pen"></i></td>
								<td><textarea class="form-control textarea-mr" id="memo_mr"></textarea></td>
							</tr>
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
							<a onclick="updateMedicalRecordMemo()" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <script>
    	$(document).ready(function(){
    		
    	});
    	// 항목 hover, click 이벤트
    	$('#dataTable tr:not(:first-child)').hover(function(){
    		 $(this).css('background-color','#D0E2F4');
    		 $(this).css('cursor','pointer');
    	}, function(){
    		 $(this).css('background-color','white');
    	})
    </script>
</body>
</html>