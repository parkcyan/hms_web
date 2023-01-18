<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="staff/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-4 text-gray-800">환자 진료</h1>
		<div class="row">
			<div class="col-lg-9">
				<div class="card shadow mb-4 py-1 border-left-primary">
					<div class="card-body">
						<table id="info">
							<tr>
								<td>테스트</td>
								<td><input class="form-control" type="text" value="테스트" disabled/></td>
							</tr>
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
							<a onclick="updateInfo()" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3 mb-4">
				<div class="card shadow h-100">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">메모</h6>
					</div>
					<div class="card-body">
						<textarea id="memo" class="form-control"></textarea>
						<div class="d-sm-flex flex-row-reverse mt-2">
							<a onclick="updateMemo()" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			let number = 0;
			(function poll() {
			    $.ajax({
			        url: 'getMedicalReceipt.st',
			        dataType: 'json',
			        success: function(res) {
			            console.log(res);
			        },
			        timeout: 2500,
			        complete: setTimeout(function() { poll(); }, 3000)
			    })
			})();
		});
	</script>
</body>
</html>