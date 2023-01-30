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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="staff/vendor/jquery/jquery.js"></script>
<script src="staff/vendor/jquery-easing/jquery.easing.js"></script>
<!-- custom -->
<link href="staff/css/staff.css" rel="stylesheet">
<link href="staff/css/chatroom.css" rel="stylesheet">
<script src="staff/js/staff.js"></script>
<title>YM-HOSPITAL ${title}</title>
</head>
<body id="page-top">
	<div id="wrapper">
		<tiles:insertAttribute name="sidebar" />
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<tiles:insertAttribute name="topbar" />
				<tiles:insertAttribute name="container" />
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
				</div>
				<div class="modal-body">정말 로그아웃하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
					<a class="btn btn-primary" href="logoutStaff.st">로그아웃</a>
				</div>
			</div>
		</div>
	</div>
	<script src="staff/js/sb-admin-2.js"></script>
	<script src="staff/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<!--
	<script src="staff/vendor/chart.js/Chart.js"></script>
	<script src="staff/js/demo/chart-area-demo.js"></script>
	<script src="staff/js/demo/chart-pie-demo.js"></script>
	-->
</body>
</html>







