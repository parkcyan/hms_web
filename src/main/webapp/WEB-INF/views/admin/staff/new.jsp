<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btnSet {}
</style>
</head>
<body>
<div class="container-fluid">
		<h1 class="h3 mb-4 text-gray-800">직원 관리</h1>
		<div class="row">
			<div class="col-lg-3">
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">신규사원 등록</h6>
						</div>
					</div>					
					<div class="card-body">
						<div class="table-responsive">
							<form method="post" action='insert.ad'>
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<tr><th class='text-center'>사원명</th>
									<td><input type='text' name='name'>
									</td>
								</tr>
								<tr><th class='text-center'>직무</th>
									<td>
										<select name='staff_level'>
											<option value='-1'>직무선택</option>
											<option value='1' >의사</option>
											<option value='2' >간호사</option>
											<option value='3' >원무과</option>											
										</select>
									</td>
								</tr>
								<tr><th class='text-center'>부서</th>
									<td>
							 			<select name='department_id'>
											<option value='-1'>부서선택</option>
											<option value='1' >심장내과</option>
											<option value='2' >소화기내과</option>
											<option value='3' >신장내과</option>
											<option value='4' >소아청소년과</option>
											<option value='5' >외과</option>
											<option value='6' >흉부외과</option>
											<option value='7' >정형외과</option>
											<option value='8' >신경과</option>
											<option value='9' >치과</option>
										</select>
									</td>
								</tr>
								<tr><th class='text-center'>생년월일</th>
									<td><input type='text' name='social_id'></td>
								</tr>
								<tr><th class='text-center'>성별</th>
									<td>
										<input type="radio" name='gender' value="M" class="mr-1">남자
										<input type="radio" name='gender' value="F" class="ml-4 mr-1">여자								
									</td>
								</tr>
								<tr><th class='text-center'>이메일</th>
									<td><input type='text' name='email'></td>
								</tr>
								<tr><th class='text-center'>전화번호</th>
									<td><input type='text' name='phone_number'></td>
								</tr>
								<tr><th class='text-center'>입사일자</th>
									<td><input type='date' name='hire_date' value=''></td>
								</tr>
							</table>
							</form>
							
							<div class='btnSet text-center'>
							<a class='btn btn-primary mr-4' href='javascript:$("form").submit()'>저장</a>
							<a class='btn btn-secondary' href='staffList.ad'>취소</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>