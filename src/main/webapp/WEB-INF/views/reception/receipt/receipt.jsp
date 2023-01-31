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

.form-control {
	height: calc(1.0em + 0.5rem + 2px);
	padding: 3px;
	display: inline;
	font-size: 15px;
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
		<form action="receipt.re" method="get">	
		<input type="hidden" name="patient_id" value="patient_id">		
		<input type="hidden" name="name" value="${name}">		
		<input type="hidden" name="id" value="${id}">		
			<div class="row">
						
			<div class="col-lg-3 mb-4">
				<div class="card shadow mb-4 py-1 border-left-info h600">
					<div class="card-body">
					
						<table id="medical_record_table">
						
							<tr>
								<div class="py-3">
								<h6 class="m-0 font-weight-bold text-primary">접수</h6>
								</div>								
							<tr style="height: 40px;">
								<td style="width: 25%">이름</td>
								<td style="width: 75%"><input class="form-control w-50 form-control" type="text" value='${name}' disabled/></td>
							</tr>
							<tr>
								</td> 
							</tr>
							<tr style="height: 40px;">
								<td>담당의</td>
								<td><div >						  									
						  			<select class="form-control" id='doctor'>
								    <option value="0">담당의</option>
								     <c:forEach items="${staff_list}" var="vo">
								     	<c:if test="${doctor_id eq vo.staff_id }">
								     		<option selected="selected" value="${vo.staff_id}">${vo.name} (${vo.department_name})</option> 
								     	</c:if>
						  			  	<c:if test="${doctor_id ne vo.staff_id }">
						  			  		<option value="${vo.staff_id}">${vo.name} (${vo.department_name})</option> 
						  			  	</c:if>
								     </c:forEach>
								  </select>
								</div></td>
							</tr>						
							<tr style="height: 120px;">
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
						<h6 class="mb-3 font-weight-bold text-primary">대기현황</h6> 
						
							<div>
							<div  class="doctor">			
							
									  									
						  			<select name="doctor_id"  class="form-control" id='doctor' onchange="$('form').submit();">
								    <option value="0">담당의</option>
								     <c:forEach items="${staff_list}" var="vo">
								     <c:if test="${doctor_id eq vo.staff_id }">
								     		<option selected="selected" value="${vo.staff_id}">${vo.name} (${vo.department_name})</option> 
								     	</c:if>
						  			  	<c:if test="${doctor_id ne vo.staff_id }">
						  			  		<option value="${vo.staff_id}">${vo.name} (${vo.department_name})</option> 
						  			  	</c:if> 
								     </c:forEach>
								  </select>
								</div>
											  									
						<%--   <select id='selected'  class="form-control  w=50" >
						    <option value="0">담당의</option>
						  <c:forEach items="${staff_list}" var="vo">
								     <option value="${vo.staff_id}" onclick="get_doctor_receipt()"> ${vo.name} (${vo.department_name})</option> 
								     </c:forEach>
						  </select> --%>
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
									<th scope="col">대기현황</th>						
								</tr>
							</thead>
							<c:forEach items="${list}" var="vo">
							<tr>
									<th scope="col">${vo.reserve_time}</th>
									<th scope="col">${vo.patient_name}</th>	
									<th scope="col">${vo.doctor_name}</th>
									<th scope="col">${vo.department_name}</th>	
								<th scope="col">${vo.status}</th>	
								
									
																				
								</tr>
							</c:forEach>
							<tbody id="receipt">
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
			
		</div>
		</form>
	</div>
	
	<script src="staff/js/calendar-picker/popper.min.js"></script>
	<script src="staff/js/calendar-picker/picker.js"></script>
	<script src="staff/js/calendar-picker/picker.date.js"></script>
	
	<script>
	
	/* function selected(obj){
		var selectVal = $(obj).val();
		var patient_id =$('#patient_id').val();
		var name=$('#name').val();
		console.log(selectVal);
		$.ajax({
			  data : {
				  doctor_id :selectVal,
				  patient_id : patient_id,
				  name : name
		
				},
		    url:'receipt.re',
		    type:"POST",
		  
		    success: function(result) {
		        if (result) {
		         alert("완료")
		        } else {
		        	
		        }
		    }
		});
		
		
	}
	 */
	
	function send_receiptinfo(){
		var patient_id =$('#patient_id').val();
		var staff_id =$('#doctor option:selected').val();
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