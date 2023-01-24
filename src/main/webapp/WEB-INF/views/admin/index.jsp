<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="./jsQR.js"></script>

	<style type="text/css">
		main {
			width:100%;
			height:100%;
			text-align:center;
		}
		div#frame {
			border:2px solid #005666;
			background-color:#FFFFFF;
			margin-left:10px;
			margin-right:10px;
			padding-left:8px;
			padding-right:8px;
			padding-top:8px;
			padding-bottom:8px;	
		}
		div#outputLayer {
			text-align:left;
		}
		canvas {
			width:100%;
		}
	</style>
	
	

<title></title>
</head>
<body>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">예약 알림</h1>
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
							
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card shadow mb-4 py-1 border-left-info h600">
					<div class="card-body">
					
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