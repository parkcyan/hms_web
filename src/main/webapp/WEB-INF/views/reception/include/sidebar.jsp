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
		<a class="nav-link" href="index.re">
			<span>원무과</span>
		</a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->


	<!-- Nav Item - Pages Collapse Menu -->
	 
	<li class="nav-item">
		<a class="nav-link" href="re_patient_list.re"> 
		 <span>접수</span>
		</a>
	</li> 
	<li class="nav-item">
		<a class="nav-link" href="registration.re"> 
		 <span>신규등록</span>
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="patient_list.re"> 
		 <span>환자정보</span>
		</a>
	</li>
	
	
	<li class="nav-item">
		<a class="nav-link" href="accep_patient_list.re"> 
		<span>수납</span>
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