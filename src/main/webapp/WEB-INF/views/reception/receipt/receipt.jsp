<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.util.Calendar" %>
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

	<input type="hidden" id="patient_id" value="${patient_id}"/>
	<input type="hidden" id="time"/>
	<div class="container-fluid">
		<h1 class="h3 mb-4 text-gray-800">접수</h1>
				<div class="row">
			<div class="col-lg-3">		
		</div>
		</div>			
			<div class="row">				
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
								</td> 
							</tr>
							<tr>
								<td>담당의</td>
								<td><div >						  									
						  			<select class="form-control" id='doctor'>
								    <option value="0">담당의</option>
								     <c:forEach items="${staff_list}" var="vo">
								     <option id="staff_id" value="${vo.staff_id}">${vo.name} (${vo.department_name})</option> 
								     </c:forEach>
								  </select>
								</div></td>
							</tr>						
							<tr>
								<td>메모</td>
								<td><textarea class="form-control textarea-mr" id="memo"></textarea></td>
							</tr>
					
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
											
							<button type='button' class="btn btn-primary" onclick ="history.go(0)">취소</button>
							<button type="button" class="btn btn-primary ptient-insert" 
							onclick="send_receiptinfo()">접수</button>
				
						</div>			
						
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card shadow mb-4 h600">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">대기현황</h6>
							<div>
							<div><th scope="col"> 대기 현황</th>${list.size()}</div>					  									
						  <select id='selected'  class="form-control  w=50" >
						    <option value="0">담당의</option>
						  <c:forEach items="${staff_list}" var="vo">
								     <option id="staff_id" value="${vo.name}" onclick="get_doctor_receipt()"> ${vo.name} (${vo.department_name})</option> 
								     </c:forEach>
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
									<th scope="col">시간계산</th>						
								</tr>
							</thead>
							<c:forEach items="${list}" var="vo">
							<tr>
									<th scope="col">${vo.reserve_time}</th>
									<th scope="col">${vo.patient_name}</th>	
									<th scope="col">${vo.doctor_name}</th>
									<th scope="col">${vo.department_name}</th>	
									<c:if test="${vo.reserve_time_count < vo.now_count}">
									<input type="text" id="time" value="${vo.time}"/>
									</c:if>
																				
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
	function send_receiptinfo(){
		var patient_id =$('#patient_id').val();
		var staff_id =$('#staff_id').val();
		var memo=$('#memo').val();
		console.log(patient_id);
		console.log(staff_id);
		console.log(memo);
		$.ajax({
			  data : {
				  patient_id :patient_id,
				  staff_id :staff_id,
				  memo : memo
				},
		    url:'receipt_insert.re',
		    type:"POST",
		  
		    success: function(result) {
		        if (result) {
		        	alert('접수 완료되었습니다.');
		        	location.reload();
		        } else {
		        	alert('접수 되지 않았습니다');
		        	location.reload();
		        }
		    }
		});
	}
	
	function get_doctor_receipt(){
		
	}
	
	
	
		 
	/* 
	    $selected = $("#selected");
		$selected.on("change", function(e){
			let choice = e.target.value; // string type		
			console.log($(choice);
		});
		
		 */
		 

	</script>
</body>
</html>