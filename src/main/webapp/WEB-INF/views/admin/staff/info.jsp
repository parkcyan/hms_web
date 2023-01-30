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
<h3>사원정보</h3>
			<div class="col-lg-6 mb-4">
				<div class="card shadow py-1 border-left-info h600">
					<div class="card-body">
						<table id="medical_record_table">
							<tr>
								<td>이름</td>
								<td><input class="form-control w-25" id="patient_name_mr" type="text" disabled /></td>
							</tr>
							<tr>
								<td>환자 증상</td>
								<td><input class="form-control" id="memo_mr" type="text" disabled /></td>
							</tr>
							<tr class="tr-mr">
								<td>진료</td>
								<td><textarea class="form-control textarea-mr"></textarea></td>
							</tr>
							<tr class="tr-mr">
								<td>처방</td>
								<td><textarea class="form-control textarea-mr"></textarea></td>
							</tr>
							<tr class="tr-mr">
								<td>의사소견</td>
								<td><textarea class="form-control textarea-mr"></textarea></td>
							</tr>
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
							<a onclick="insertMedicalRecord()" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>

</body>
</html>






