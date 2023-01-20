<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="container-fluid">
		<div class="flexb">
			<h1 class="h3 mb-2 text-gray-800">병동</h1>
			<ul class="nav nav-pills mb-2">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#ward5">5병동</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#ward6">6병동</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#ward7">7병동</a></li>
			</ul>
		</div>
		<div class="row mb-2">
			<div class="col-lg-12">
				<div class="card shadow py-1">
					<div class="card-body">
						<div class="tab-content">
							<div class="tab-pane fade show active" id="ward5">
								<p>test5</p>
							</div>
							<div class="tab-pane fade" id="ward6">
								<p>test5</p>
							</div>
							<div class="tab-pane fade" id="ward7">
								<p>test5</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3">
				<div class="card shadow mb-4 py-1 border-left-primary">
					<div class="card-body patient-mini-table">
						<table id="patient-mini-table">
							<tr>
								<td>이름</td>
								<td><input class="form-control" type="text" id="patient_name" disabled /></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input class="form-control input-mini" id="age"
									type="text" disabled /> 세</td>
								<td>성별</td>
								<td><input class="form-control input-mini" id="gender"
									type="text" disabled /></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input class="form-control" id="birthdate" type="text" disabled /></td>
							</tr>
							<tr>
								<td>혈액형</td>
								<td><input class="form-control input-mini" id="blood_type" type="text" disabled /></td>
							</tr>
							<tr>
								<td>신장</td>
								<td><input class="form-control input-mini" id="height" type="number" disabled /> cm</td>
								<td>체중</td>
								<td><input class="form-control input-mini" id="weight" type="number" disabled /> kg</td>
							</tr>
							<tr>
								<td>기저질환</td>
								<td colspan="3"><input class="form-control" id="underlying_disease" type="text" disabled /></td>
							</tr>
							<tr>
								<td>알레르기</td>
								<td colspan="3"><input class="form-control" id="allergy" type="text"disabled /></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">과거 진료기록</h6>
					</div>
					<div class="card-body">
						
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-4">
				<div class="card shadow mb-4 py-1 border-left-info h600">
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
			<div class="col-lg-3 mb-4">
				<div class="card shadow mb-4 h600">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">진료 예약/대기 목록</h6>
					</div>
					<div class="card-body">
						<table id="receipt_table" class="table">
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>