<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="staff/css/calendarstyle.css" rel="stylesheet">
<link href="staff/css/bootstrap-timepicker.css" rel="stylesheet">
<style>
.input-group-addon {
    width: 38px;
    color: white;
    background: lightblue;
    border-bottom: 1px solid #d1d3e2;
    border-top: 1px solid #d1d3e2;
    border-right: 1px solid #d1d3e2;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">일정</h1>
		<p class="mb-4">일정을 등록, 추가, 삭제, 알림설정 하실 수 있습니다.</p>
		<div class="row">
			<div class="col-lg-5">
				<div class="elegant-calencar d-md-flex mb-4">
					<div class="wrap-header d-flex align-items-center">
						<p id="reset">reset</p>
						<div id="header" class="p-0">
							<div
								class="pre-button d-flex align-items-center justify-content-center">
								<i class="fa fa-chevron-left"></i>
							</div>
							<div class="head-info">
								<div class="head-day"></div>
								<div class="head-month"></div>
							</div>
							<div
								class="next-button d-flex align-items-center justify-content-center">
								<i class="fa fa-chevron-right"></i>
							</div>
						</div>
					</div>
					<div class="calendar-wrap">
						<table id="calendar">
							<thead>
								<tr>
									<th style="color: red;">일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th style="color: blue;">토</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="color: red;"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="color: blue;">></td>
								</tr>
								<tr>
									<td style="color: red;"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="color: blue;">></td>
								</tr>
								<tr>
									<td style="color: red;"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="color: blue;">></td>
								</tr>
								<tr>
									<td style="color: red;"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="color: blue;">></td>
								</tr>
								<tr>
									<td style="color: red;"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="color: blue;">></td>
								</tr>
								<tr>
									<td style="color: red;"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td style="color: blue;">></td>
								</tr>	
							</tbody>
						</table>
					</div>
				</div>
				<div class="card shadow py-1 border-left-info mb-4">
					<div class="card-body">
						<form>
							<div class="form-group">
								<label>시간</label> 
								<div class="input-group bootstrap-timepicker timepicker w-50">
						            <input id="timepicker1" type="text" class="form-control input-small">
						            <span class="input-group-addon flexc flexa" style="width: 38px;"><i class="far fa-clock"></i></span>
						        </div>
							</div>
							<label for="groupChatRoomTitle">내용</label> 
							<textarea class="form-control mb-3" style="height: 60px;"></textarea>
							
							<button type="submit" class="btn btn-primary">저장</button>
						</form>
					</div>
				</div>
				
			</div>
			<div class="col-lg-5 mb-4">
				<div class="card shadow h-100">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">일정 목록</h6>
							<div id="spinner-mini" class="spinner-border text-primary" role="status"> </div>
						</div>
					</div>
					<div class="card-body">
						<table id="schedule_table" class="table">
							<thead>
								<tr>
									<th scope="col">시간</th>
									<th scope="col" style="width: 70%">내용</th>
								</tr>
							</thead>
							<tbody id="schedule">

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
	<script src="staff/js/calendar/popper.js"></script>
	<!-- 날짜 클릭시 뷰 동작은 calendar/main.js에서 정의함 -->
	<script src="staff/js/calendar/main.js"></script>
	<script src="staff/vendor/bootstrap/js/bootstrap-timepicker.js"></script>
	<script>
	  	$('#timepicker1').timepicker();
	  	
	  	// 오늘 스케줄 조회
	  	getSchedule(new Date());
	</script>
</body>
</html>