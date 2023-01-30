<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title></title>
<style>
#mypage_table td:first-child {
	background: whitesmoke;
	font-weight: bold;
	width: 25%;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">마이페이지</h1>
		<p class="mb-4">자신의 자기소개를 수정할 수 있습니다.</p>
		<!-- DataTales Example -->
		<div class="row">
			<div class="col-lg-6 mb-4">
				<div class="card shadow mb-4 border-left-primary">
					<div class="card-body">
						<table id="mypage_table" class="table">
							<tr><td>이름</td><td>${loginInfo.name}</td></tr>
							<tr><td>사번</td><td>${loginInfo.staff_id}</td></tr>
							<tr><td>직책</td><td>${loginInfo.department_name} ${loginInfo.staff_level == 1 ? '의사' : '간호사'}</td></tr>
							<tr><td>생년월일</td><td id="birthdate"></td></tr>
							<tr><td>이메일</td><td>${loginInfo.email}</td></tr>
							<tr><td>전화번호</td><td>${loginInfo.phone_number}</td></tr>
							<tr><td>입사일자</td><td>${loginInfo.hire_date}</td></tr>
							<tr>
								<td>자기소개 <i class="fas fa-pen"></i></td>
								<td>
									<textarea id="introduction" class="form-control" spellcheck="false">${loginInfo.introduction}</textarea>
								</td>
							</tr>
						</table>
						<div class="d-sm-flex flex-row-reverse">
							<a onclick="updateIntroduction()" class="btn btn-primary">저장</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#birthdate').text(getBirthDate('${loginInfo.social_id}'));
		function updateIntroduction() {
			$.ajax({
				url: 'updateStaffIntroduction.st',
				data: {
					introduction : $('#introduction').val()
				},
				success: function(res) {
					if (res) toast('success', '자기소개가 수정되었습니다.');
					else toast('error', '자기소개 수정을 실패했습니다.');
				},
				error: function(req, text) {
					errorToast(req.status);
				}
			});
		}
	</script>
</body>
</html>