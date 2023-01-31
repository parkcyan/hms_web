<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="text-gray-800 ml-3">사원정보</h3>
		<div class="row">
			<div class="col-lg-6 mb-4 ml-3">
				<div class="card shadow py-1 border-left-info h600">
					<div class="card-body">
						<table id="medical_record_table">
							<tr>
								<td>이름</td>
								<td><input class="form-control w-25" id="patient_name_mr" type="text" placeholder="${vo.name}" disabled /></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control w-25" id="patient_name_mr" type="text" placeholder="${vo.social_id}" disabled /></td>
							</tr>
							<tr>
								<td>직무</td>
								<td><input class="form-control w-25" id="patient_name_mr" type="text" placeholder='${vo.staff_level eq 1 ? '의사' : '간호사'}' disabled /></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input class="form-control w-50" id="patient_name_mr" type="text" placeholder="${vo.email}"/></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input class="form-control w-50" id="patient_name_mr" type="text" placeholder="${vo.phone_number}"/></td>
							</tr>
							<tr class="tr-mr">
								<td>진료분야</td>
								<td><textarea class="form-control textarea-mr" placeholder="${vo.introduction}"></textarea></td>
							</tr>
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
							<a onclick="list" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>






