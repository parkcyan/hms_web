<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규회원등록</title>
<link href="reception/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
</head>
<body>
<div class="card shadow mb-4 py-1 border-left-primary">
<form method ='post' action ='insert.re'>
					<div class="card-body patient-mini-table">
						<table id="patient-mini-table">
							<tr>
								<td>이름</td>
								<td><input class="form-control" type="text" id="patient_name"  /></td>
							</tr>
							<tr>
								<td>성별</td>
								<td><lable><input type ='radio' value ='M' name ='gender' >남</lable>
								<label></label><input type ='radio' value ='W' name ='gender' checked >여</label> </td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control" id="birthdate" type="text" placeholder="yyyymmdd" /></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input class="form-control input-mini" id="phone_number" type="text" 
								placeholder="-없이 입력하세요" maxlength="13" /></td>
							</tr>
							
						</table>
						<div class="d-sm-flex flex-row-reverse mt-3">
							<a onclick="insertMedicalRecord()" class="btn btn-primary" href='registration.re'>취소</a>
							<a onclick="insertMedicalRecord()" class="btn btn-primary">저장</a>
						</div>
						
					</div>
				</div>
</body>
</html>