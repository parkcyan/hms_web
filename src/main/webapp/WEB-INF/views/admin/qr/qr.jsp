<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<title></title>
<style type="text/css">
.a-center {text-align: center;}
</style>

</head>
<body>
<body>


	<div class="container-fluid">
		<h1 class="h3 mb-4 text-gray-800">QR코드</h1>								
		<div class="card-body a-center">
			<img src='data:image/png;base64, ${img}' />
		</div>
		<div class="a-center mb-5">
			<a href="selectqr.ad?department_id=0" class="btn btn-primary a-center">뒤로가기</a>
		</div>
	</div>
		
</body>
</html>