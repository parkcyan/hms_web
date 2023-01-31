<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
	<input type="hidden" id="patient_id" value="${patient_id}"/>
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
					<div class="card-body patient-mini-table">
						<table id="patient-mini-table">
						<c:if test="${list eq null }">
							<tr>
								<td>이름</td>
								<td><input class="form-control input-mini w-100" value="${vo.patient}"
									type="text" disabled /></td>
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
							</c:if>
							<c:if test="${list ne null }">
							<tr>
								<td>이름</td>
								<td><input class="form-control input-mini" id="gender" style="000000";
									type="text" value="${list[0].patient}" disabled /></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><input class="form-control input-mini" id="gender"
									type="text" disabled value="${list[0].gender eq 'M' ? '남' : '여'}"/></td>
							</tr>
							<td>연락처</td>
								<td><input class="form-control input-mini" id="phone_number"
									type="text" disabled value="${list[0].phone_number}"/></td>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control" id="social_id" type="text" 
								value="${list[0].social_id}"disabled /></td>
							</tr>
							</c:if>							
						
						</table>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">수납 이력</h6>
					</div>
					<div class="card-body">
						<table id="old_medical_record" class="table">
							<thead >
								<tr >
									<th scope="col">진료일자</th>
									<th scope="col">금액</th>
									<th scope="col">상태</th>
								</tr>
							</thead> 
							<c:forEach items="${list}" var="vo">
							<tbody  id="acceptance_record">
							<tr>
								<td>${vo.acceptance_date}</td>
								<c:if test="${vo.pay_amount eq 0 }">
								<td>${vo.pay_amount}</td>
								</c:if>
								<c:if test="${vo.pay_amount ne 0 }">
								<td  id="confirm"><fmt:formatNumber value="${vo.pay_amount}"/></td>
								</c:if>

								<c:if test="${vo.pay_amount eq 0 }">
								<td id="item1">${"미납"}</td>
								</c:if>
								<c:if test="${vo.pay_amount ne 0 }">
								<td id="item2">${"수납완료"}</td>
								</c:if>
								<td style='display:none;'>${vo.doctor}</td>
								<td style='display:none;'><fmt:formatNumber value="${vo.medical_expenses + vo.inspection_fee+vo.admission_fee+vo.operation_fee}"/></td>
								<td style='display:none;'><fmt:formatNumber value="${vo.medical_expenses}"/></td>
								<td style='display:none;'><fmt:formatNumber value="${vo.inspection_fee}"/></td>
								<td style='display:none;'><fmt:formatNumber value="${vo.admission_fee}"/></td>
								<td style='display:none;'><fmt:formatNumber value="${vo.operation_fee}"/></td>
								
							</tr>
							</tbody>							
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
					
				<div class="card shadow mb-4 py-1 ">
					<div class="card-body">
						<table id="medical_record_table">
						<div class="py-3">
						<h6 class="m-0 font-weight-bold text-primary">진료비 상세 내역</h6>
					</div>
						<c:if test="${list eq null }">
						<tr>
								<td>진료일자</td>
								<td><input class="form-control" id="acceptance_date" type="text"
								 style ="border:0px;"     /></td>
								<td>담당의사</td>
								<td><input class="form-control" id="doctor" type="text" style ="border:0px;"  /></td>
							</tr>

							<tr>
							
								<td>총진료비</td>
								<td><input class="form-control" id="" type="text"  style ="border:0px;"/></td>
							</tr>
							<tr>
								<td>진료비</td>
								<td><input class="form-control"id="medical_expenses"  type="text" style ="border:0px;" /></td>
							</tr>
							<tr>
								<td>검사비</td>
								<td><input class="form-control" type="text" disabled    id="inspection_fee"    style ="border:0px;"/></td>
							</tr>
							<tr>
								<td>입원비</td>
								<td><input class="form-control" id="admission_fee"  type="text"  style ="border:0px;" /></td>
							</tr>
							<tr>
								<td>처치 및 수술비</td>
								<td><input class="form-control" id="operation_fee" type="text"  style ="border:0px;" /></td>
							</tr>
											
						</c:if>
							
						<c:if test="${list ne null }">
							<tr>
								<td>진료일자</td>
								<td><input class="form-control" id="acceptance_date" type="text"  
								 style ="border:0px;"   /></td>
								<td>담당의</td>
								<td><input class="form-control" id="doctor" type="text"  style ="border:0px;"  /></td>
							</tr>
							<tr>
								<c:set var='total' />
								<td>총진료비</td>
								<td><input class="form-control" id="total_cost" type="text"
								  style ="border:0px;" /></td>
							</tr>
							<tr>
								<td>진료비</td>
								
								<td><input class="form-control" id="medical_expenses" type="text"  style ="border:0px;" 
							/></td>
							</tr>
							<tr>
								<td>검사비</td>
								<td><input class="form-control" id="inspection_fee" type="text"  style ="border:0px;" ></td>
							</tr>
							<tr>
								<td>입원비</td>
								<td><input class="form-control" id="admission_fee" type="text"  style ="border:0px;"/></td>
							</tr>
							<tr>
								<td>처치 및 수술비</td>
								<td><input class="form-control" type="text"  style ="border:0px;" /></td>
							</tr>
						</c:if>		
						</table>					
					</div>
				</div>
			</div>
			<div class="card shadow mb-4 py-1 border-left-primary" style="height: 16rem;">
					<div class="card-body patient-mini-table">
						<div class="py-3">
						<h6 class="m-0 font-weight-bold text-primary"> 납부 금액 </h6>
					</div>
						<input type="hidden" id="acceptance_record_id" value="${list[0].acceptance_record_id}">
						<table id="patient-mini-table">
			
							<tr>
								<td>받을 금액</td>
								<td><input class="form-control" type="text" id="total_money" disabled name='pay_amount'
								/></td>
							</tr>
							<tr>
								<td>공단부담금</td>
								<td><input class="form-control input-mini" id="corp_money"  style ="border:0px;"
									type="text" /></td>
							</tr>
							<tr>
							<td>환자부담금</td>
								<td><input class="form-control input-mini"  id="patient_money"
									type="text" style ="border:0px;" /></td>
							</tr>
												
						</table>
						<div class="d-sm-flex flex-row-reverse">								
							<a  class="btn btn-primary ptient-insert" value="${pay_amount}" onclick="send_payment();">수납</a>				
						</div>					
					</div>
				</div>
		
		</div>
	</div>
	<script>
	
	$('#acceptance_record tr').hover(function () {
		$(this).css('background-color', '#D0E2F4');
		$(this).css('cursor', 'pointer');
	}, function () {
		$(this).css('background-color', 'white');
	});
	$('#acceptance_record tr').click(function() {
		$('#acceptance_date').val($(this).children('td:eq(0)').text());
		$('#pay_amount').val($(this).children('td:eq(1)').text());
		$('#doctor').val($(this).children('td:eq(3)').text());
		$('#total_cost').val($(this).children('td:eq(4)').text());
		$('#medical_expenses').val($(this).children('td:eq(5)').text());
		$('#inspection_fee').val($(this).children('td:eq(6)').text());
		$('#admission_fee').val($(this).children('td:eq(7)').text());
		$('#operation_fee').val($(this).children('td:eq(8)').text());
		
		var cost = $(this).children('td:eq(4)').text().replace(/,/g, '');		
		if($('#admission_fee').val()== 0){
			$('#total_money').val( numberCurrency(cost*0.5) );
			$('#corp_money').val( numberCurrency(cost*0.5) );
			$('#patient_money').val( numberCurrency(cost*0.5) );
		
		}else {
			$('#total_money').val( numberCurrency(cost*0.2) );
			$('#corp_money').val( numberCurrency(cost*0.8) );
			$('#patient_money').val( numberCurrency(cost*0.2) );
			
						
		}
		
	});
		
		
		
	

	$(function(){
// 		$('#total_cost').val( numberCurrency( $('#total_cost').val() ) );
// 		$('#medical_expenses').val( numberCurrency($(this).children('td:eq(4)').text()) );
// 		$('#inspection_fee').val( numberCurrency( $('#inspection_fee').val() ) );
// 		$('#admission_fee').val( numberCurrency( $('#admission_fee').val() ) );
// 		$('#operation_fee').val( numberCurrency( $('#operation_fee').val() ) );
// 		$('#amount').val( numberCurrency( $('#amount').val() ) );
// 		$('#corp_money').val( numberCurrency( $('#corp_money').val() ) );
// 		$('#patient_money').val( numberCurrency( $('#patient_money').val() ) );

	});
	
	function numberCurrency(num){
		return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	};


// 		});
		//데이터 보내기			
		function send_payment() {
			var money = $('#total_money').val().replace(/,/g, '');
			console.log(money);
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
		
	
	</script>
</body>
</html>