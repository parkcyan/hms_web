<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title></title>
<style type="text/css">
body {
	display: flex;
	height: 100vh;
	align-items: center;
}

.a-name {
	text-decoration: none;
	color: black;
}

.a-intro {
	text-decoration: none;
	color: gray;
	font-size: 16px;
}

.a-none:hover {
	text-decoration: none;
}

.qr-card {
	height: 600px;
}
.qr-card:last-child {
	float: right;
}
.back-secondary {
	background-color: #4FB5E6;
}
.back-secondary:hover {
	background-color: #2F6299;
}
.back-secondary:focus {
	background-color: #2F6299;
}

.department {
	text-align: center;
	font-size: 24px;
	font-weight: 400;
	color: #2F6299;
}


</style>

</head>
<body>
	<div class="container-fluid">
		<div class="row mt-5 justify-content-center">
			<div class="col-lg-5">
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="flex">
							<div class="dropdown mb-3">
								<h1 class="h3 mb-4 text-gray-800 text-center">QR코드 접수</h1>
								<a class="back-secondary ml-5 btn btn-primary dropdown-toggle" href="#"
									role="button" data-toggle="dropdown" aria-expanded="false">
									진료과 선택 </a>
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
								<p class="department mt-4">
									<c:choose>
										<c:when test="${department_id eq 1}">심장내과</c:when>
										<c:when test="${department_id eq 2}">소화기내과</c:when>
										<c:when test="${department_id eq 3}">신장내과</c:when>
										<c:when test="${department_id eq 4}">소아청소년과</c:when>
										<c:when test="${department_id eq 5}">외과</c:when>
										<c:when test="${department_id eq 6}">흉부외과</c:when>
										<c:when test="${department_id eq 7}">정형외과</c:when>
										<c:when test="${department_id eq 8}">신경과</c:when>
										<c:when test="${department_id eq 9}">치과</c:when>
										<c:otherwise>진료과를 선택하세요</c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>
						<div class="card-body qr-card">
							<div class="row">
								<c:forEach items="${list}" var="list" varStatus="st">
									<div class="card mr-5" style="width: 18rem;">
										<a href="qr.ad?staff_id=${list.staff_id}" class="a-none"> 
											<c:choose>
												<c:when test="${st.index eq 0}"><img src="admin/img/profile7.png" class="card-img-top" alt="..."></c:when>
												<c:when test="${st.index eq 1}"><img src="admin/img/profile6.png" class="card-img-top" alt="..."></c:when>
											</c:choose> 
											<div class="card-body">
												<h4 class="a-name card-title text-center text-black">${list.name}</h4>
												<p class="a-intro card-text">${list.introduction}</p>
											</div>
										</a>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


