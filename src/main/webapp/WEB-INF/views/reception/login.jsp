<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title></title>
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">로그인</h1>
									</div>
									<form class="user" method="post">
										<div class="form-group">
											<input type="text" class="form-control form-control-user chk"
												id="staff_id" placeholder="사번" name="id">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user chk"
												id="staff_pw" placeholder="비밀번호" name="pw">
										</div>
										
										<a onclick="login()" class="btn btn-primary btn-user btn-block">로그인</a>
									</form>
									<hr>
                                 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function login() {		
			if (emptyCheck()) {
				if (isNaN($("input[name=id]").val())) {
					toast("error", "사번은 숫자만 입력할 수 있습니다.");
				} else {
					$.ajax({
						url: 'staff_login.re',
						data: { 
					
							id : $("input[name=id]").val(), 
							pw : $("input[name=pw]").val() 
						},
						success: function(response) {
							if (response) {
								location = '<c:url value="/index.re"/>';
							} else {
								toast('error', '사번 또는 비밀번호를 확인해주세요.');
							}
						}, 
						error: function(req,text) {
							errorToast(req.status);
						}
					});
				}
			}
		}
	</script>
</body>
</html>