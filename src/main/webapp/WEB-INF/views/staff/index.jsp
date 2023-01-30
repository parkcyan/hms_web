<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title></title>
<style>
.main-button-card { padding: 10px; }
.main-button-card:hover { cursor: pointer; }
.main-button {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}
.main-button div:first-child {
	color: white;
}
.main-button-img {
	display: flex;
	flex-flow: row-reverse;
	font-size: 2.5rem;
	color: white;
}
.main-bg {
	background: url("staff/img/main_back.jpg");
	background-position: center;
	background-size: cover;
	border-radius: 0.35rem;
}
.card-work {
	display: flex;
    flex-direction: column;
    justify-content: space-evenly;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">메인</h1>
		</div>
		<div class="row">
			<div class="col-lg-3 mb-4">
				<div class="card shadow h400">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">업무</h6>
						</div>
					</div>
					<div class="card-body card-work">
						<div class="row">
							<!-- Earnings (Monthly) Card Example -->
							<div class="col-lg-6 mb-4" onclick="location.href = 'lookup.st';">
								<div class="card shadow h-100 py-2" style="background: var(--primary)">
									<div class="main-button-card card-body">
										<div class="w-100 h-100 main-button">
											<div class="h3 mb-0 font-weight-bold">환자 조회</div>
											<div class="main-button-img">
												<i class="far fa-fw fa-user"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 mb-4" onclick="location.href = 'outpatient.st';">
								<div class="card shadow h-100 py-2" style="background: lightblue">
									<div class="main-button-card card-body">
										<div class="w-100 h-100 main-button">
											<div class="h3 mb-0 font-weight-bold">진료</div>
											<div class="main-button-img">
												<i class="far fa-fw fa-clipboard"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<!-- Earnings (Monthly) Card Example -->
							<div class="col-lg-6 mb-4" onclick="location.href = 'ward.st';">
								<div class="card shadow h-100 py-2" style="background: var(--success)">
									<div class="main-button-card card-body">
										<div class="w-100 h-100 main-button">
											<div class="h3 mb-0 font-weight-bold">병동</div>
											<div class="main-button-img">
												<i class="fas fa-fw fa-bed"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 mb-4" onclick="location.href = 'schedule.st';">
								<div class="card shadow h-100 py-2" style="background: var(--warning)">
									<div class="main-button-card card-body">
										<div class="w-100 h-100 main-button">
											<div class="h3 mb-0 font-weight-bold">일정</div>
											<div class="main-button-img">
												<i class="fas fa-fw fa-calendar"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 mb-4 ">
				<div class="card shadow h400">
					<div class="card-body main-bg">
						<h1 style="color: white;">YM-HOSPITAL</h1>
					</div>
				</div>
			</div>

			<div class="col-lg-3 mb-4 ">
				<div class="card shadow h400">
					<div class="card-header py-3">
						<div class="flex">
							<h6 class="m-0 font-weight-bold text-primary">오늘의 일정</h6>
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
		</div>
	</div>
	<script src="staff/js/calendar/main.js"></script>
	<script>
		getSchedule(new Date(), false);
	</script>
</body>
</html>