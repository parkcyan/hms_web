<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<style>
.dropdown-header i { font-size: 16px; }
#chatRoomNotice_div {
	display: flex;
	align-items: center;
}
</style>
<input type="hidden" id="id" value="${loginInfo.staff_id}"/>
<input type="hidden" id="name" value="${loginInfo.name}"/>
<input type="hidden" id="department_id" value="${loginInfo.department_id}"/>
<input type="hidden" id="department_name" value="${loginInfo.department_name}"/>
<input type="hidden" id="staff_level" value="${loginInfo.staff_level}"/>
<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

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
							placeholder="환자명을 입력하세요" aria-label="Search"
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
		</a> <!-- Dropdown - Alerts -->
			<div
				class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="alertsDropdown">
				<h6 class="dropdown-header">Alerts Center</h6>
				<!-- 
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
					All Alerts</a> -->
			</div></li>

		<!-- Nav Item - Messages -->
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <!-- Counter - Messages -->
				<span id="notCheckedCount" class="badge badge-danger badge-counter"></span>
			</a> <!-- Dropdown - Messages -->
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
				<div class="dropdown-header flexb flexc">
					<h6 class="mb-0">Messenger</h6>
					<i class="fas fa-plus"></i>
				</div>			
				<div id="chatRoomList">
				</div>
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
				<a class="dropdown-item" href="mypage.st"> 
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
			<h1 id="chatroom_title"></h1>
		</div>
		<div>
			<button data-widget="remove" id="removeClass"
				class="chat-header-button pull-right" type="button">
				<i class="fas fa-times"></i>
			</button>
		</div>
	</div>
	<div id="chatRoomNotice_div" class="popup-head card-header" style="display: none;"> 
		<i class="fas fa-exclamation-circle"></i>
		<p id="chatRoomNotice" class="mb-0 ml-2" style="font-size: 0.7rem;"></p>
	</div>

	<div id="chat" class="chat_box_wrapper chat_box_small chat_box_active"
		style="opacity: 1; display: block; transform: translateX(0px);">
		<div id="chat_box" class="chat_box touchscroll chat_box_colors_a">
		</div>
	</div>
	<div class="chat_submit_box flexb">
		<div class="gurdeep-chat-box">
			<input placeholder="메시지를 입력해 주세요." id="submit_message"
				name="submit_message" onkeyup="enterKey()" class="md-input form-control w-100 h-100"></input>
		</div>
		<a class="chat-send" href="#"><i class="fas fa-paper-plane"></i></a>
	</div>
</aside>
<!-- End of chatroom -->
<!-- staffList -->
<aside id="staffListChat" class="card tabbed_sidebar ng-scope chat_sidebar">
	<div class="popup-head card-header flexb flexc mb-2">
		<div class="popup-head-left pull-left">
			<h1>대화 상대 추가</h1>
		</div>
		<div>
			<button data-widget="remove" id="createGroupChatRoomDialog"
				class="chat-header-button pull-right" type="button">
				<i class="fas fa-fw fa-users"></i>
			</button>
			<button data-widget="remove" id="removeStaffList"
				class="chat-header-button pull-right" type="button">
				<i class="fas fa-times"></i>
			</button>
		</div>
	</div>
	<div id="staffList">
		<div id="staff_box">
			<c:forEach items="${staffMap}" var="vo" varStatus="status">
				<a class="dropdown-item flexc align-items-center" href="#">
					<input type="hidden" value="${vo.value.staff_id}"/>
					<input type="hidden" value="${vo.value.staff_level}"/>
					<input type="hidden" value="${vo.value.department_id}"/>
					<input type="hidden" value="${vo.value.name}"/>
					<input type="hidden" value="${vo.value.department_name}"/>
					<div class="font-weight-bold">
						<div class="text-truncate flexc h25">
							<i class="fas fa-fw fa-user mr-1"></i><p class="mb-0">${vo.value.name}</p>
							<div class="small text-gray-500 ml-1">${vo.value.department_name} ${vo.value.staff_level eq 1 ? ' 의사' : ' 간호사'}</div>
						</div>
					</div>
				</a>
				<hr class="m-0"/>
			</c:forEach>
		</div>
	</div>
</aside>
<!-- End of staffList -->
<!-- createGroupChatRoom -->
<aside id="dialog_createGroupChatRoom" class="card tabbed_sidebar ng-scope chat_sidebar">
	<div class="popup-head card-header flexb flexc mb-2">
		<div class="popup-head-left pull-left">
			<h1>그룹 채팅방 생성</h1>
		</div>
		<div>
			<button data-widget="remove" id="remove_dialog_createGroupChatRoom"
				class="chat-header-button pull-right" type="button">
				<i class="fas fa-times"></i>
			</button>
		</div>
	</div>
	<div id="staffList">
		<form class="mr-3 ml-3">
			<div class="form-group">
				<label for="groupChatRoomTitle">채팅방 제목</label> 
				<input type="text" class="form-control" id="groupChatRoomTitle" placeholder="제목">
				<small id="emailHelp" class="form-text text-muted">'#'은 입력할 수 없습니다.</small>
			</div>
			<label>채팅방 참가자</label> 
			<div id="groupChatRoomMember" class="form-control mb-3" style="height: 60px;">
				<p></p>
			</div>
			<div class="form-control p-0" style="height: 180px;">
				<div id="staff_box_group" class="h-100" style="overflow-y: scroll;">
					<c:forEach items="${staffMap}" var="vo" varStatus="status">
					<a class="dropdown-item flexc align-items-center" href="#">
						<input type="hidden" value="${vo.value.staff_id}"/>
						<input type="hidden" value="${vo.value.staff_level}"/>
						<input type="hidden" value="${vo.value.department_id}"/>
						<input type="hidden" value="${vo.value.name}"/>
						<input type="hidden" value="${vo.value.department_name}"/>
						<div class="font-weight-bold">
							<div class="text-truncate flexc h25">
								<i class="fas fa-fw fa-user mr-1"></i><p class="mb-0">${vo.value.name}</p>
								<div class="small text-gray-500 ml-1">${vo.value.department_name} ${vo.value.staff_level eq 1 ? ' 의사' : ' 간호사'}</div>
							</div>
						</div>
					</a>
					<hr class="m-0"/>
					</c:forEach>
				</div>
			</div>
		</form>
		<div class="d-sm-flex flex-row-reverse mb-3 mr-3 mt-3">
				<button id="makeGroupChatRoom_button" class="btn btn-primary">생성</button>
		</div>
	</div>
</aside>
<!-- End of createGroupChatRoom-->
<!-- End of Topbar -->
<script src="https://www.gstatic.com/firebasejs/8.7.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.7.1/firebase-database.js"></script>
<script src="staff/js/hmsfirebase.js"></script>
<script>
	$(document).keydown(function(event) {
		// esc 입력 이벤트 
	    if ( event.keyCode == 27 || event.which == 27 ) {
	    	$('#chatroom').removeClass('popup-box-on');
			$('#staffListChat').removeClass('popup-box-on');
			removeGetChat();
	    }
	});
	// 미확인 채팅 수, 채팅방, 채팅 알림 수신
	getNotCheckedChatCount();
	getChatRoom();
	getNotification();
	
	let groupMember = {
			[id] : {
				'staff_id' : parseInt(id),
				'staff_level' : parseInt($("#staff_level").val()),
				'department_id' : parseInt($("#department_id").val()),
				'name' : name,
				'department_name' : $("#department_name").val(),
				'onChat' : false
			}
	}
	
	function groupInit() {
		groupMember = {
				[id] : {
					'staff_id' : parseInt(id),
					'staff_level' : parseInt($("#staff_level").val()),
					'department_id' : parseInt($("#department_id").val()),
					'name' : name,
					'department_name' : $("#department_name").val(),
					'onChat' : false
				}
		};
	}

	// 메시지 창 열시 다른 창 종료
	$('#messagesDropdown').click(function() {
		$('#chatroom').removeClass('popup-box-on');
		$('#staffListChat').removeClass('popup-box-on');
		removeGetChat();
	});
	
	// 메시지 창 + 포인터 변경
	$('.dropdown-header i').hover(function() {
		$(this).css('cursor','pointer');
	})
	
	// 대화 상대 추가창 
	$('.dropdown-header i').click(function() {
		$('#staffListChat').addClass('popup-box-on');
	});
	
	// 대화 상대 추가
	$('#staff_box a').click(function(e) {
		e.preventDefault();
		let staff_id = $(this).children('input:eq(0)').val();
		let staff_level = $(this).children('input:eq(1)').val();
		let department_id = $(this).children('input:eq(2)').val();
		let name = $(this).children('input:eq(3)').val();
		let department_name = $(this).children('input:eq(4)').val();
		makeChatRoom(staff_id, staff_level, department_id, name, department_name);
	});
	
	// 대화 상대 추가창 종료
	$('#removeStaffList').click(function() {
		$('#staffListChat').removeClass('popup-box-on');
	});
	
	// 그룹 채팅방 개설창 
	$('#createGroupChatRoomDialog').click(function() {
		groupInit();
		$('#groupChatRoomMember p').text(name);
		$('#dialog_createGroupChatRoom').addClass('popup-box-on');
		$('#staffListChat').removeClass('popup-box-on');
	});
	
	// 그룹 채팅방 참가자 추가 
	$('#staff_box_group a').click(function(e) {
		e.preventDefault();
		let staff_id_member = $(this).children('input:eq(0)').val();
		let staff_level_member = $(this).children('input:eq(1)').val();
		let department_id_member = $(this).children('input:eq(2)').val();
		let name_member = $(this).children('input:eq(3)').val();
		let department_name_member = $(this).children('input:eq(4)').val();
		if (groupMember[staff_id_member] == null) {
			groupMember[staff_id_member] = {
					'staff_id' : parseInt(staff_id_member),
					'staff_level' : parseInt(staff_level_member),
					'department_id' : parseInt(department_id_member),
					'name' : name_member,
					'department_name' : department_name_member,
					'onChat' : false
			};
			$('#groupChatRoomMember p').text($('#groupChatRoomMember p').text() + ' / ' + name_member);
		}	
	});
	
	// 그룹 채팅방 참가자 개설
	$('#makeGroupChatRoom_button').click(function(){
		let title = $('#groupChatRoomTitle').val();
		if (title.trim() == '') {
			toast('error', '제목을 입력해 주세요.');
		} else if (title.indexOf('#') != -1) {
			toast('error', '"#"는 입력할 수 없습니다.');
		} else if (Object.keys(groupMember).length == 1) {
			toast('error', '참가자를 추가해 주세요.');
		} else {
			$('#dialog_createGroupChatRoom').removeClass('popup-box-on');
			makeGroupChatRoom($('#groupChatRoomTitle').val(), groupMember);
		}
	});
	
	// 그룹 채팅방 개설창 종료
	$('#remove_dialog_createGroupChatRoom').click(function() {
		$('#dialog_createGroupChatRoom').removeClass('popup-box-on');
	});
	
	// 채팅 전송
	$('.chat-send').click(function() {
		let content = $('#submit_message').val();
		if (content.trim() == "") toast('error', '채팅을 입력해 주세요.');
		else if (content.indexOf("##") != -1) toast('error', '"##"는 입력할 수 없습니다.');
		else {
			if ($('#chat_box').children('div').length == 0 
					|| getDate($('#chat_box').children('div:last-child').children('input').val()) != getDate(getCurrentTimeStamp())) {
				sendDateBeforeChat($('#submit_message').val());
			} else sendChat($('#submit_message').val());
			$('#submit_message').val('');
		}
	});

	// enter키 입력 이벤트
	function enterKey() {
		if (window.event.keyCode == 13) {
			 $(".chat-send").trigger("click");
		}
	}
</script>