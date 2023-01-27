<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.a-center {text-align: center;}
.qr-text {
	text-align: center;
	font-size: 24px;
	color: #000000;
}
.sub-text {
	font-size: 16px;
	color: gray;
	margin-left: 5px;
}
</style>

</head>
<body>
<body>


	<div class="container-fluid">				
			<p class="qr-text">${department_name} ${name}<span class="sub-text">교수</span></p>		
		<div class="row qr-card justify-content-center">
			<img src='data:image/png;base64, ${img}' />
		</div>
		<div class="a-center mb-5">
			<a href="selectqr.ad?department_id=0" class="btn btn-primary a-center">뒤로가기</a>
		</div>
	</div>
		
</body>
</html>