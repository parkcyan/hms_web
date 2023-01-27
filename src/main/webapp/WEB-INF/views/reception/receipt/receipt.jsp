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
.calendar{margin-left: 100px;}

.fa-calendar-alt{
box-sizing: border-box;}
.dropdown{
 margin-top: 20px;
}
</style>
</head>
<body>
	<input type="hidden" id="patient_id"/>
	<input type="hidden" id="time"/>
	<div class="container-fluid">
		<h1 class="h3 mb-4 text-gray-800">접수</h1>
				<div class="row">
			<div class="col-lg-3">
		
		</div>
		</div>
		<div class="card shadow mb-4 py-1 col-lg-3">			
		<form action="receipt.re" method="post"
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-3 small"
							placeholder="환자명을 입력하세요" aria-label="Search"  name="name" 
							aria-describedby="basic-addon2" value="${name}">
						<div class="input-group-append">
							<a class="btn btn-primary" onclick="get_patientInfo()" >
								<i class="fas fa-search fa-sm"></i>
							</a>
						</div>
					</div>		
				</form>	
			</div>
			<div class="row">
						<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">수납 이력</h6>
					</div>
					<div class="card-body">
						<table id="old_medical_record" class="table">
							<thead>
								<tr>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>			
							
			<div class="col-lg-3 mb-4">
				<div class="card shadow mb-4 py-1 border-left-info h600">
					<div class="card-body">
						<table id="medical_record_table">
							<tr>
								<div class="py-3">
								<h6 class="m-0 font-weight-bold text-primary">접수</h6>
								</div>								
							<tr>
								<td>이름</td>
								<td><input class="form-control w-50" type="text" value='${name}'/></td>
							</tr>
							<tr>
								<td>진료과</td>
								<td>
								<form action="receipt.re" method="post">
								<div >						  									
						  			<select class="form-control" id='department_id' onchange="$('form').submit();">
								    <option value="0">진료과목</option>
								    <c:forEach items="${dept_list}" var="de">
								     <option value="${de.department_id }">${de.department_name}</option> 
								     </c:forEach>
								  </select>
								</div></form>
								</td> 
							</tr>
							<tr>
								<td>담당의</td>
								<td><div >						  									
						  			<select class="form-control" id='doctor'>
								    <option value="0">담당의</option>
								    <option value="1">Action</option>
								    <option value="2">Another action</option>
								    <option value="3">Something else here</option>
								  </select>
								</div></td>
							</tr>
						
							<tr>
								<td>접수시간</td>
								<td><input class="form-control" id="memo_mr" type="text"  /></td>
							</tr>
							
							<tr>
								<td>메모</td>
								<td><textarea class="form-control textarea-mr"></textarea></td>
							</tr>
					
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
											
							<button type='button' class="btn btn-primary" onclick ="history.go(0)">취소</button>
							<button type="button" class="btn btn-primary ptient-insert" href='patientInfo.re'>접수</button>
				
						</div>			
						
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card shadow mb-4 h600">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">대기현황</h6>
							<div>						  									
						  <select id='selected'  class="form-control  w=50" >
						    <option value="0">진료과목</option>
						    <option value="1">doctor</option>
						    <option value="2">Another action</option>
						    <option value="3">Something else here</option>
						  </select>
						</div>												
					</div>									
					<div class="card-body">
						<table id="receipt_table" class="table">
							<thead>
								<tr>
									<th scope="col">시간</th>
									<th scope="col">환자명</th>	
									<th scope="col">의사명</th>
									<th scope="col">진료과</th>						
								</tr>
							</thead>
							<c:forEach items="${list}" var="vo">
							<tr>
									<th scope="col">${vo.reserve_time}</th>
									<th scope="col">${vo.patient_name}</th>	
									<th scope="col">${vo.doctor_name}</th>
									<th scope="col">${vo.department_name}</th>						
								</tr>
							</c:forEach>
							<tbody id="receipt">

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
	
	function get_patientInfo(){
		alert("데이터 요청");
		
		  $.ajax({
	            url: "ajax/db.jsp",	// 데이터를 가져올 경로 설정
	            dataType: 'json',
	            type: "post",// 데이터를 가져오는 방식
	            
	            success: function(data){	// 데이터를 가져왔을때 동작. 매개변수로 data 입력
	                alert("연결성공");
	}
	/* 
	    $selected = $("#selected");
		$selected.on("change", function(e){
			let choice = e.target.value; // string type		
			console.log($(choice);
		});
		
		 */
		 

	
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