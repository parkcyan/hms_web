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
							<form method="post" action='insert.ad'>
							<table class='w-px600'>
								<tr><th class='w-px140'>사원명</th>
									<td><input type='text' name='name'>
									</td>
								</tr>
								<tr><th>직무</th>
									<td><input type='text' name='staff_level'></td>
								</tr>
								<tr><th>부서</th>
									<td>

									</td>
								</tr>
								<tr><th>이메일</th>
									<td><input type='text' name='email'></td>
								</tr>
								<tr><th>전화번호</th>
									<td><input type='text' name='phone_number'></td>
								</tr>
								<tr><th>입사일자</th>
									<td><input type='text' name='hire_date' value=''></td>
								</tr>
							</table>
							</form>
							
							<div class='btnSet'>
							<a class='btn-fill' href='javascript:$("form").submit()'>저장</a>
							<a class='btn-empty' href='staffList.ad'>취소</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>