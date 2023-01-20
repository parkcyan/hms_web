<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- Topbar -->
<input type="hidden" id="id" value="${loginInfo.staff_id}"/>
<input type="hidden" id="name" value="${loginInfo.name}"/>
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">

		<!-- Nav Item - Search Dropdown (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none"><a
			class="nav-link dropdown-toggle" href="#" id="searchDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a> <!-- Dropdown - Messages -->
			<div
				class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>

		<!-- Nav Item - Alerts -->
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
				<span class="badge badge-danger badge-counter">3+</span>
		</a> <!-- Dropdown - Alerts -->
			<div
				class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="alertsDropdown">
				<h6 class="dropdown-header">Alerts Center</h6>
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-primary">
							<i class="fas fa-file-alt text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">December 12, 2019</div>
						<span class="font-weight-bold">A new monthly report is
							ready to download!</span>
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-success">
							<i class="fas fa-donate text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">December 7, 2019</div>
						$290.29 has been deposited into your account!
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-warning">
							<i class="fas fa-exclamation-triangle text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">December 2, 2019</div>
						Spending Alert: We've noticed unusually high spending for your
						account.
					</div>
				</a> <a class="dropdown-item text-center small text-gray-500" href="#">Show
					All Alerts</a>
			</div></li>

		<!-- Nav Item - Messages -->
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <!-- Counter - Messages -->
				<span id="notCheckedCount" class="badge badge-danger badge-counter"></span>
			</a> <!-- Dropdown - Messages -->
			<div id="chatRoomList"
				class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="messagesDropdown">
				<h6 class="dropdown-header">Messenger</h6>
			</div>
		</li>

		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow">
			<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
			<span class="mr-2 d-none d-lg-inline text-gray-600 small">${loginInfo.name}</span> 
			</a> 
			<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#"> 
					<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 마이페이지
				</a> 
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal"> 
					<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					로그아웃
				</a>
			</div></li>

	</ul>
</nav>
<!-- End of Topbar -->
<script>
	let chatRoomList = '';
	let id = $('#id').val();
	let name = $('#name').val();
	const getNotCheckedChatCount = new EventSource('/hmsweb/getNotCheckedChatCount.st?id=' + id);
	getNotCheckedChatCount.onmessage = function(event){
		$('#notCheckedCount').text(event.data);
	};
	const getChatRoom = new EventSource('/hmsweb/getChatRoom.st?id=' + id);
	getChatRoom.onmessage = function(event){
		let room = JSON.parse(event.data);
		if (event.data == 'null' && chatRoomList != null) {
			$('#chatRoomList a').remove();
			$('#chatRoomList').append('<p class="ml-3 mt-3">참여중인 채팅방이 없습니다.</p>');	
		}
		if (JSON.stringify(room) != JSON.stringify(chatRoomList)) {
			$('#chatRoomList a').remove();
			$('#chatRoomList p').remove();
			$.each(room, function(i){	
				let str = "";
				str += '<a class="dropdown-item d-flex align-items-center" href="#">';
				str += '<div class="font-weight-bold">';
				if (room[i].roomTitle.indexOf('#') != -1) {
					let roomTitle = room[i].roomTitle.replace('#', '');
					roomTitle = roomTitle.replace(name, '');
					str += '<div class="text-truncate flexc h25"><i class="fas fa-fw fa-user mr-1"></i>' + roomTitle;
				} else str += '<div class="text-truncate flexc h25"><i class="fas fa-fw fa-users mr-1"></i>' + room[i].roomTitle;
				if (room[i].count != 0) {
					str += '<span id="notCheckedCount" class="badge badge-danger badge-counter ml-1">' + room[i].count + '</span></div>';
				} else str += '</div>'
				if (room[i].lastChat.indexOf('##') != -1) {
					const lastChatArr = room[i].lastChat.split("##");
					str += '<div class="small text-gray-500">' + getTime(room[i].lastChatTime) + ' | ' + lastChatArr[3] + '님이 링크를 공유했습니다.</div>'
				} else str += '<div class="small text-gray-500">' + getTime(room[i].lastChatTime) + ' | ' + room[i].lastChat + '</div>'
				str += '</div></a>'
				$('#chatRoomList').append(str);	
			})
		}
		chatRoomList = room;
	};
</script>