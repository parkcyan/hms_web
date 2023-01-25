<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
		<h1 class="h3 mb-4 text-gray-800">직원 관리</h1>
		<div class="row">
			<div class="col-lg-12">
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">직원 목록</h6>
						</div>
					</div>					
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
									<tr class="text-center">
										<th>직원ID</th>
										<th>이름</th>
										<th>직무</th>
										<th>부서</th>
										<th>생년월일</th>
										<th>성별</th>
										<th>전화번호</th>
										<th>Email</th>
										<th>입사일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="list">
										<tr>
											<td>${list.staff_id}</td>
											<td>${list.name}</td>
											<c:if test="${name eq '홍길동'}">
											    <c:out value="${str}" />
											</c:if>
											
											<td>
												<c:if test="${list.staff_level eq '1'}"> <c:out value="의사"></c:out></c:if>
												<c:if test="${list.staff_level eq '2'}"> <c:out value="간호사"></c:out></c:if>
												<c:if test="${list.staff_level eq '3'}"> <c:out value="원무과"></c:out></c:if>
											</td>
											<td>${list.department_name}</td>
											<td>${list.social_id}</td>
											<td>
												<c:if test="${list.gender eq 'M'}"> <c:out value="남자"></c:out></c:if>
												<c:if test="${list.gender eq 'F'}"> <c:out value="여자"></c:out></c:if>
											</td>
											<td>${list.phone_number}</td>
											<td>${list.email}</td>
											<td>${list.hire_date}</td>
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
</body>
</html>