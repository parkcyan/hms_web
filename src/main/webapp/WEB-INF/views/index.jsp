<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="staff/vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="staff/css/sb-admin-2.css" rel="stylesheet">
<link href="staff/css/staff.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="staff/vendor/jquery/jquery.js"></script>
<script src="staff/vendor/jquery-easing/jquery.easing.js"></script>
<script src="staff/js/staff.js"></script>
<style>
body {
	background: url("staff/img/main_back.jpg");
	background-position: center;
	background-size: cover;
	padding: 40px;
	color: black;
}
h1, h4 { color: white; }
.index-menu {
	justify-content: center;
	height: 600px;
}
.menu {
	display: flex;
    flex-direction: column;
    justify-content: space-around; 
	text-align: center;
}
.menu i { font-size: 3.5rem; }
.menu p { 
	font-size: 1.2rem;
	font-weight: bold; 
}
.menu:hover { cursor: pointer; }
p { margin: 0 !important; }
</style>
<title>YM-HOSPITAL</title>
</head>
<body id="page-top">
	<h1>YM-HOSPITAL</h1>
	<h4>함께하는 진료, 함께하는 행복</h4>
	<div class="flexc index-menu">
		<div class="card shadow" style="width: 35%;">
			<div class="card-body flexb flexc" style="height: 250px;">
				<div class="card shadow" style="width: 30%; height: 75%;" onclick="javascript:location.href='index.st'">
					<div class="card-body menu">
						<i class="fas fa-user-md"></i>
						<p>의료진</p>
					</div>
				</div>
				<div class="card shadow" style="width: 30%; height: 75%;" onclick="javascript:location.href='login.re'">
					<div class="card-body menu">
						<i class="fas fa-file-medical"></i>
						<p>원무과</p>
					</div>
				</div>
				<div class="card shadow" style="width: 30%; height: 75%;" onclick="javascript:location.href='staffList.ad'">
					<div class="card-body menu">
						<i class="fas fa-cogs"></i>
						<p>관리자</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="staff/js/sb-admin-2.js"></script>
	<script src="staff/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</body>
</html>