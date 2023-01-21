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
<!-- chatroom -->
<aside id="chatroom" class="card tabbed_sidebar ng-scope chat_sidebar">
	<div class="popup-head card-header flexb flexc">
		<div class="popup-head-left pull-left">
			<h1 id="chatroom_title">Gurdeep Osahan</h1>
		</div>
		<div>
			<button data-widget="remove" id="removeClass"
				class="chat-header-button pull-right" type="button">
				<i class="fas fa-times"></i>
			</button>
		</div>
	</div>

	<div id="chat" class="chat_box_wrapper chat_box_small chat_box_active"
		style="opacity: 1; display: block; transform: translateX(0px);">
		<div id="chat_box" class="chat_box touchscroll chat_box_colors_a">
			<div class="chat_message_wrapper">
				<p class="chat-member">남경선</p>
				<ul class="chat_message">
					<li>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Distinctio, eum?</p>
					</li>
					<li>
						<p>
							Lorem ipsum dolor sit amet.<span class="chat_message_time">13:38</span>
						</p>
					</li>
				</ul>
			</div>
			<div class="chat_message_wrapper chat_message_right">
				<ul class="chat_message">
					<li>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem
							delectus distinctio dolor earum est hic id impedit ipsum minima
							mollitia natus nulla perspiciatis quae quasi, quis recusandae,
							saepe, sunt totam. <span class="chat_message_time">13:34</span>
						</p>
					</li>
				</ul>
			</div>
			<div class="chat_message_wrapper">
				<ul class="chat_message">
					<li>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque
							ea mollitia pariatur porro quae sed sequi sint tenetur ut
							veritatis.https://www.facebook.com/iamgurdeeposahan <span
								class="chat_message_time">23 Jun 1:10am</span>
						</p>
					</li>
				</ul>
			</div>
			<div class="chat_message_wrapper chat_message_right">
				<ul class="chat_message">
					<li>
						<p>Lorem ipsum dolor sit amet, consectetur.</p>
					</li>
					<li>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit. <span
								class="chat_message_time">Friday 13:34</span>
						</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="chat_submit_box flexb">
		<div class="gurdeep-chat-box">
			<textarea placeholder="메시지를 입력해 주세요." id="submit_message"
				name="submit_message" class="md-input form-control w-100 h-100"></textarea>
		</div>
		<a class="chat-send" href="#"><i class="fas fa-paper-plane"></i></a>
	</div>
</aside>
<!-- End of chatroom -->
<!-- End of Topbar -->
<script src="https://www.gstatic.com/firebasejs/8.7.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.7.1/firebase-database.js"></script>
<script src="staff/js/hmsfirebase.js"></script>
<script>
	getNotCheckedChatCount();
	getChatRoom();
	$('#messagesDropdown').click(function() {
		$('#chatroom').removeClass('popup-box-on');
	});
	$('.chat-send').click(function () {
		sendChat($('#submit_message').val());
		$('#submit_message').val('');
	});
	/* 
	const getNotCheckedChatCount = new EventSource(
			'/hmsweb/getNotCheckedChatCount.st?id=' + id);
	getNotCheckedChatCount.onmessage = function(event) {
		$('#notCheckedCount').text(event.data);
	};
	const getChatRoom = new EventSource('/hmsweb/getChatRoom.st?id=' + id);
	getChatRoom.onmessage = function(event) {
		let room = JSON.parse(event.data);
		if (event.data == 'null' && chatRoomList != null) {
			$('#chatRoomList a').remove();
			$('#chatRoomList').append(
					'<p class="ml-3 mt-3">참여중인 채팅방이 없습니다.</p>');
		}
		if (JSON.stringify(room) != JSON.stringify(chatRoomListCheck)) {
			$('#chatRoomList a').remove();
			$('#chatRoomList p').remove();
			$.each(room, function(i){	
				let str = '';
				str += '<a class="dropdown-item d-flex align-items-center" href="#">';
				str += '<input type="hidden" value="' + room[i].key + '"/>'
				str += '<div class="font-weight-bold">';
				if (room[i].roomTitle.indexOf('#') != -1) {
					let roomTitle = room[i].roomTitle.replace('#', '');
					roomTitle = roomTitle.replace(name, '');
					str += '<div class="text-truncate flexc h25"><i class="fas fa-fw fa-user mr-1"></i><p class="mb-0">' + roomTitle + '</p>';
				} else str += '<div class="text-truncate flexc h25"><i class="fas fa-fw fa-users mr-1"></i><p class="mb-0">' + room[i].roomTitle + '</p>';
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
			$("#chatRoomList a").click(function (e) {
				e.preventDefault();
				currentRoomTitle = $(this).children('div').children('div:eq(0)').children('p').text();
				$('#chatroom_title').text(currentRoomTitle);
				getChat($(this).children('input').val());
				$('#chatroom').addClass('popup-box-on');
			});
				  
			$("#removeClass").click(function () {
				$('#chatroom').removeClass('popup-box-on');
			});
			
		}
		chatRoomListCheck = room;
	};
	
	function getChat(key) {		
		chatroomKey = key;
		if (typeof getChatSse != "undefined") getChatSse.close();
		getChatSse = new EventSource('/hmsweb/getChat.st?id=' + id + '&key=' + key);
		getChatSse.onmessage = function(event) {
			let chatList = JSON.parse(event.data);
			if (JSON.stringify(chatList) != JSON.stringify(chatListCheck)) {
				$('#chat_box div').remove();
				$.each(chatList, function(i){
					let str = '';
					if (chatList[i].id == id) str += '<div class="chat_message_wrapper chat_message_right">'; 
					else str += '<div class="chat_message_wrapper">';
					if (i != 0 && chatList[i - 1].name != chatList[i].name) str += '<p class="chat-member">' + chatList[i].name + '</p>';
					else if (i == 0) str += '<p class="chat-member">' + chatList[i].name + '</p>';
					str += '<ul class="chat_message"><li><p>' + chatList[i].content;
					if (i != chatList.length - 1 && getTime(chatList[i].time) != getTime(chatList[i + 1].time)) str += '<span class="chat_message_time">' + getTime(chatList[i].time) + '</span>';
					else if (i == chatList.length - 1 ) str += '<span class="chat_message_time">' + getTime(chatList[i].time) + '</span>';
					str += '</p></li></ul></div>';
					$('#chat_box').append(str);
				});
				$("#chat").scrollTop($("#chat_box").height());
				console.log($("#chat_box").height());
			}
			chatListCheck = chatList;
		};
		
	}
	
	$('.chat-send').click(function (){
		$.ajax({
			url : 'sendChat.st',
			data : {
				title : currentRoomTitle,
				key : chatroomKey,
				id : id,
				name : name,
				content : $('#submit_message').val(),
			},
			success : function(response) {
				$('#submit_message').val('');
				getChat(chatroomKey);
			},
			error : function(req, text) {
				errorToast(req.status);
			}
		});
	});
	*/
	
</script>