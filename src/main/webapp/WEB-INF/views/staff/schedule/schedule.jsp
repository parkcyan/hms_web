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
#schedule_clear:hover { cursor: pointer; }
</style>
</head>
<body>
	<input type="hidden" id="schedule_id"/>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">일정</h1>
		<p class="mb-4">일정을 등록, 추가, 삭제, 알림설정 하실 수 있습니다.</p>
		<div class="row">
			<div class="col-lg-5">
				<div class="elegant-calencar d-md-flex mb-4">
					<div class="wrap-header d-flex align-items-center">
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
						<div class="d-sm-flex flex-row-reverse" style="font-size: 1.5rem">
							<i id="schedule_clear" class="fas fa-fw fa-times"></i>
						</div>
						<form>
							<div class="form-group">
								<label>시간</label> 
								<div class="input-group bootstrap-timepicker timepicker w-50">
						            <input id="timepicker1" type="text" class="form-control input-small">
						            <span class="input-group-addon flexc flexa" style="width: 38px;"><i class="far fa-clock"></i></span>
						        </div>
							</div>
							<label for="schedule_content">내용</label> 
							<textarea id="schedule_content" class="form-control mb-3" style="height: 60px;"></textarea>
						</form>
						<div class="d-sm-flex flex-row-reverse mb-3 mt-3">
								<button onclick="updateSchedule()" class="btn btn-primary ml-2">저장</button>
								<button onclick="deleteSchedule()" class="btn btn-primary">삭제</button>
						</div>
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
	<script src="staff/js/calendar/main.js"></script>
	<script src="staff/vendor/bootstrap/js/bootstrap-timepicker.js"></script>
	<script>
	  	$('#timepicker1').timepicker();
	  	
	  	function getCurrentTimePicker() {
	  		let ts = getTimeStamp(new Date(2022, 01, 01, new Date().getHours(), new Date().getMinutes())).split(' ');
	  		let time = ts[1].split(':');
	  		let meridiem = '';
	  		if (parseInt(time[0]) > 12) {
	  			meridiem = 'PM';
	  			time[0] = parseInt(time[0]) - 12;
	  		} else meridiem = 'AM';
	  		return time[0] + ':' + time[1] + ' ' + meridiem;
	  		
	  	}
	  	
	  	$('#timepicker1').val(getCurrentTimePicker());
	  	
	  	// 오늘 스케줄 조회
	  	getSchedule(new Date(), true);
	  	
	  	$('#schedule_clear').click(function(){
	  		$('#schedule_id').val('');
	  		$('#timepicker1').val('');
	  		$('#schedule_content').val('');
	  	});
	  	
	  	$('#calendar tbody tr td').click(function(){
	  		$('#schedule_clear').trigger('click');
	  	});
	  	
	  	// 선택한 날짜 
	  	function getCalendarYear() {
	  		let head_month = $('.head-month').text().split('월');
	  		return head_month[1].replace(' - ', '');
	  	}
	  	
	  	function getCalendarMonth() {
	  		let head_month = $('.head-month').text().split('월');
	  		return head_month[0];
	  	}
	  	
	  	function getCalendarDay() {
	  		return $('.head-day').text();
	  	}
	  	
	  	function getScheduleTime() {
	  		let time = $('#timepicker1').val().split(':');
	  		let hour = parseInt(time[0]);
			if (time[1].indexOf('PM') != -1) hour += 12;
			let minute = parseInt(time[1].substring(0, 2));
	  		return getTimeStamp(new Date(getCalendarYear(), parseInt(getCalendarMonth()) - 1, getCalendarDay(), hour, minute)).substring(0, 16); 
	  	}
	  	
	  	function deleteSchedule() {
	  		if ($('#schedule_id').val() == '') {
	  			toast('error', '선택된 일정이 없습니다.');
	  		} else {
	  			confirm('warning', '일정 삭제', '정말로 ' + getCalendarYear() + '년 ' + getCalendarMonth() + '월 '
	  					+ getCalendarDay() + '일 ' + $('#timepicker1').val() + '에 기록된 일정을 삭제하시겠습니까?', function(res) {
	  				if (res.isConfirmed) {
	  					$.ajax({
		  					url: 'deleteSchedule.st',
		  					data: {
		  						id: $('#schedule_id').val()
		  					},
			  				success: function(res) {
								if (res) {
									toast('success', '일정이 삭제되었습니다.');
									getSchedule(new Date(getCalendarYear() + '-' + getCalendarMonth() + '-' + getCalendarDay()), true);
									$('#schedule_clear').trigger('click');
								} else {
									toast('error', '일정을 삭제하는데 실패했습니다.');
								}
							},
							error: function(req, text) {
								errorToast(req.status);
							}
			  			});
	  				}
				})
	  		}
	  	}
	  	
		function updateSchedule() {
			if ($('#timepicker1').val() == '' || $('#schedule_content').val() == '') {
				toast('error', '시간 또는 내용이 입력되지 않았습니다.');
			} else if (new Date(getScheduleTime()).getTime() < new Date(getCurrentTimeStamp()).getTime()) {
				toast('error', '과거의 일정을 입력, 수정할 수 없습니다.');
			} else {
				$("#spinner-mini").css('display', 'inline');
				let action = $('#schedule_id').val() == '' ? 'insert' : 'update';
				$.ajax({
					url : 'updateSchedule.st',
					data : {
						id : $('#schedule_id').val(),
						date : getScheduleTime(),
						content: $('#schedule_content').val(),
						action : action
					},
					success : function(res) {
						if (res) {
							toast('success', '일정이 저장되었습니다.');
							getSchedule(new Date(getCalendarYear() + '-' + getCalendarMonth() + '-' + getCalendarDay()), true);
							$('#schedule_clear').trigger('click');
						} else {
							toast('error', '일정을 저장하는데 실패했습니다.');
						}
					},
					error : function(req, text) {
						errorToast(req.status);
					}
				});
			}	
		}
	</script>
</body>
</html>