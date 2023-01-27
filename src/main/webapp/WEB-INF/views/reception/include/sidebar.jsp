<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	#logo {
		width: 30px;
	}
</style>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="/"/>">
		<div class="sidebar-brand-icon">
			<img id="logo" src="staff/img/logo.png"/>
		</div>
		<div class="sidebar-brand-text mx-3"> YM-HOSPITAL
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active">
		<a class="nav-link" href="index.st">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">메뉴</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link" href="registration.re"> 
		<i class="fas fa-fw fa-bed"></i> <span>신규등록</span>
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" 
		aria-expanded="true" aria-controls="collapsePages">
			<i class="far fa-fw fa-clipboard"></i>
			<span>환자정보</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="patient_list.re">기본정보</a>
				<a class="collapse-item" href="medical_record.re">진료기록 조회</a>
			</div>
		</div>
    </li>
	<li class="nav-item">
		<a class="nav-link" href="receipt.re"> 
		<i class="far fa-fw fa-user"></i> <span>접수</span>
		</a>
	</li>
	
	<li class="nav-item">
		<a class="nav-link" href="acceptance.re"> 
		<i class="fas fa-fw fa-bed"></i> <span>수납</span>
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->