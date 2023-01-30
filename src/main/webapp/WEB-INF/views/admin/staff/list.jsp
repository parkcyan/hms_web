<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="staff/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">직원 목록 조회</h1>
		<p class="mb-4">
			항목을 클릭하시면 직원의 자세한 정보를 볼 수 있습니다.			
		</p>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">직원 목록</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>번호</th>
								<th>이름</th>
								<th>직무</th>
								<th>부서</th>
								<th>생년월일</th>
								<th>성별</th>
								<th>Email</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td>${list.staff_id}</td>
									<td>${list.name}</td>
									<td>${list.staff_level eq 1 ? '의사' : '간호사'}</td>
									<td>${list.department_name}</td>
									<td>${list.social_id}</td>
									<td>${list.gender eq 'M' ? '남' : '여'}</td>
									<td>${list.email}</td>
									<td>${list.phone_number}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Page level plugins -->
    <script src="staff/vendor/datatables/jquery.dataTables.js"></script>
    <script src="staff/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Page level custom scripts -->
    <script src="staff/js/demo/datatables-demo.js"></script>
    <script>
    	// 나이, 생일 format
    	$('#dataTable #age').each(function(){
    		$(this).text(getAge($(this).text()) + "세")
    	})
    	$('#dataTable #birthdate').each(function(){
    		$(this).text(getBirthDate($(this).text()))
    	})
    	
    	// 항목 hover, click 이벤트
    	$('#dataTable tr:not(:first-child)').hover(function(){
    		 $(this).css('background-color','#D0E2F4');
    		 $(this).css('cursor','pointer');
    	}, function(){
    		 $(this).css('background-color','white');
    	})
    	$('#dataTable tr:not(:first-child)').click(function(){
    		location.href = 'staffInfo.ad?staff_id=' + $(this).children('td:first-child').text()
    	})
    </script>
</body>
</html>