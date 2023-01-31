<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title></title>
</head>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-4 text-gray-800">예약 알림</h1>
		<div class="row">
			<div class="col-lg-6">
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">오늘 예약 목록</h6>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>환자ID</th>
										<th>이름</th>
										<th>예약시간</th>
										<th>전화번호</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="list">
										<tr>
											<td>${list.patient_id}</td>
											<td>${list.name}</td>
											<td>${list.time}</td>
											<td>${list.phone_number}</td>
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