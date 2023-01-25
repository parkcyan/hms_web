<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title></title>
<style type="text/css">
.a-name {text-decoration: none; color: black;}
.a-intro {text-decoration: none; color: gray; font-size: 16px;}
.a-intro:hover {
	text-decoration: none;
}
</style>

</head>
<body>
<body>


	<div class="container-fluid">
		<h1 class="h3 mb-4 text-gray-800">QR코드</h1>
		<div class="row">
			<div class="col-lg-6">
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="flex">
						<div class="dropdown mb-3">
						  <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
						   	진료과 선택
						  </a>
						  <div class="dropdown-menu">
						    <a class="dropdown-item" href="selectqr.ad?department_id=1">심장내과</a>
						    <a class="dropdown-item" href="selectqr.ad?department_id=2">소화기내과</a>
						    <a class="dropdown-item" href="selectqr.ad?department_id=3">신장내과</a>
						    <a class="dropdown-item" href="selectqr.ad?department_id=4">소아청소년과</a>
						    <a class="dropdown-item" href="selectqr.ad?department_id=5">외과</a>
						    <a class="dropdown-item" href="selectqr.ad?department_id=6">흉부외과</a>
						    <a class="dropdown-item" href="selectqr.ad?department_id=7">정형외과</a>
						    <a class="dropdown-item" href="selectqr.ad?department_id=8">신경과</a>
						    <a class="dropdown-item" href="selectqr.ad?department_id=9">치과</a>
						  </div>
						</div>
					</div>
					
					<h4 class="mt-3">심장내과<h4>
					<div class="card-body">

					  
					<div class="row">
					<c:forEach items="${list}" var="list">
						<div class="card mr-5" style="width: 18rem;">
							<a href="qr.ad?staff_id=${list.staff_id}" class="">
								<img src="admin/img/doctor_profile1.jpg" class="card-img-top" alt="...">
								<div class="card-body">
									<h4 class="card-title text-center text-black a-name">${list.name}</h4>
									<p class="card-text a-intro">${list.introduction}</p>
								</div>
							</a>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>