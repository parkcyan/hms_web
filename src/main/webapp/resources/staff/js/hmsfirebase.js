const firebaseConfig = {
	apiKey: "AIzaSyDWJ-WRRDz_-BPov1d_0NuKKUQ2VwfyVsQ",
	authDomain: "hmsmessenger-3a156.firebaseapp.com",
	databaseURL: "https://hmsmessenger-3a156-default-rtdb.asia-southeast1.firebasedatabase.app",
	projectId: "hmsmessenger-3a156",
	storageBucket: "hmsmessenger-3a156.appspot.com",
	messagingSenderId: "992282289710",
	appId: "1:992282289710:web:37de0de924b37bddad61bf",
	measurementId: "G-GC0Q1ZNENQ"
};

firebase.initializeApp(firebaseConfig);
let db = firebase.database();
let id = $('#id').val();
let name = $('#name').val();
let selectedKey = '';
let selectedRoomTitle = '';

/**
	읽지않은 채팅 수 불러오기
 */
function getNotCheckedChatCount() {
	db.ref('member/' + id + '/count').on('value', (snapshot) => {
		let count = 0;
		snapshot.forEach(function(child){
			count += child.val();
		});
		if (count == 0) $('#notCheckedCount').text('');
		else $('#notCheckedCount').text(count);
	});
}

/**
	스태프 선택으로 채팅방 불러오기
 */
function makeChatRoom(staff_id, staff_level, department_id, staff_name, department_name) {
	if (staff_id < id) {
		selectedKey = staff_id + "--" + id;
	} else selectedKey = id + "--" + staff_id;
	db.ref('chatRoom/' + selectedKey).once('value', (snapshot) => {
		if (!snapshot.exists()) {
			selectedRoomTitle = '#' + staff_name + name;
			let json = {
				chatRoomTitle : selectedRoomTitle,
				member : {
					[staff_id] : {
						'staff_id' : parseInt(staff_id),
						'staff_level' : parseInt(staff_level),
						'department_id' : parseInt(department_id),
						'name' : staff_name,
						'department_name' : department_name,
						'onChat' : false
					},
					[id] : {
						'staff_id' : parseInt(id),
						'staff_level' : parseInt($("#staff_level").val()),
						'department_id' : parseInt($("#department_id").val()),
						'name' : name,
						'department_name' : $("#department_name").val(),
						'onChat' : false
					}
				}
			};
			db.ref('chatRoom/' + selectedKey).set(json, (error) => {
				let roomTitle = selectedRoomTitle.replace('#', '');
				roomTitle = roomTitle.replace(name, '');
				$('#chatroom_title').text(roomTitle);
				getChat();
				$('#staffListChat').removeClass('popup-box-on');
			});
		} else {
			selectedRoomTitle = snapshot.child('chatRoomTitle').val();
			let roomTitle = selectedRoomTitle.replace('#', '');
			roomTitle = roomTitle.replace(name, '');
			$('#chatroom_title').text(roomTitle);
			getChat();
			$('#staffListChat').removeClass('popup-box-on');
		}
	});
}

/**
	그룹 채팅방 생성
 */
function makeGroupChatRoom(title, staffList) {
	let key = self.crypto.randomUUID();
	let json = {
		chatRoomTitle: title,
		member: staffList
	}
	db.ref('chatRoom/' + key).set(json, (error) => {
		selectedRoomTitle = title;
		selectedKey = key;
		$('#chatroom_title').text(title);
		getChat();
		$('#staffListChat').removeClass('popup-box-on');
	})
}

/**
	채팅방 목록 불러오기
 */
function getChatRoom() {
	$('#chatRoomList a').remove();
	db.ref('member/' + id + '/lastChat').on('value', (snapshot) => {
		db.ref('member/' + id + '/count').once('value', (countSnapshot) => {	
			if (!countSnapshot.exists()) $('#chatRoomList').append('<p class="ml-3 mt-3">참여중인 채팅방이 없습니다.</p>');
			else {
				let count = 1;
				let chatRoomList = [];
				countSnapshot.forEach(function(child) {	
					db.ref('chatRoom/' + child.key).once('value', (snapshot) => {
						chatRoomList.push({
							key: snapshot.key,
							chatRoomTitle: snapshot.child('chatRoomTitle').val(),
							time: snapshot.child('lastChat/time').val(),
							lastChat: snapshot.child('lastChat/content').val(),
							count: countSnapshot.child(snapshot.key).val()
						});
						if (count++ == countSnapshot.numChildren()) {
							chatRoomList.sort((a, b) => new Date(b.time).getTime() - new Date(a.time).getTime());
							setChatRoomView(chatRoomList);
						}
					});
					
				});
			}
		});
	});
}

function setChatRoomView(chatRoomList) {
	$('#chatRoomList a').remove();
	$('#chatRoomList p').remove();
	chatRoomList.forEach((data) => {
		let str = '';
		str += '<a class="dropdown-item d-flex align-items-center" href="#">';
		str += '<input type="hidden" value="' + data.key + '"/>'
		str += '<input type="hidden" value="' + data.chatRoomTitle + '"/>'
		str += '<div class="font-weight-bold">';
		if (data.chatRoomTitle.indexOf('#') != -1) {
			let roomTitle = data.chatRoomTitle.replace('#', '');
			roomTitle = roomTitle.replace(name, '');
			str += '<div class="text-truncate flexc h25"><i class="fas fa-fw fa-user mr-1"></i><p class="mb-0">' + roomTitle + '</p>';
		} else str += '<div class="text-truncate flexc h25"><i class="fas fa-fw fa-users mr-1"></i><p class="mb-0">' + data.chatRoomTitle + '</p>';
		if (data.count != 0) {
			str += '<span id="notCheckedCount" class="badge badge-danger badge-counter ml-1">' + data.count + '</span></div>';
		} else str += '</div>'
		if (data.lastChat == null) {
			str += '<div class="small text-gray-500">대화가 없습니다.</div>'
		} else if (data.lastChat.indexOf('##') != -1) {
			const lastChatArr = data.lastChat.split("##");
			str += '<div class="small text-gray-500">' + getTime(data.time) + ' | ' + lastChatArr[3] + '님이 링크를 공유했습니다.</div>'
		} else str += '<div class="small text-gray-500">' + getTime(data.time) + ' | ' + data.lastChat + '</div>'
		str += '</div></a>'
		$('#chatRoomList').append(str);
	});
	$("#chatRoomList a").click(function(e) {
		e.preventDefault();
		removeGetChat();
		selectedKey = $(this).children('input:eq(0)').val();
		selectedRoomTitle = $(this).children('input:eq(1)').val();
		let roomTitle = $(this).children('div').children('div:eq(0)').children('p').text();
		$('#chatroom_title').text(roomTitle);
		getChat();
	});
	$("#removeClass").click(function() {
		$('#chatroom').removeClass('popup-box-on');
		removeGetChat();
	});
}

/**
	채팅 목록 불러오기
 */
function getChat() {
	db.ref('chatRoom/' + selectedKey + '/chat').on('value', (snapshot) => {
		chatList = [];
		snapshot.forEach(function(child){
			chatList.push({
				id: child.child('id').val(),
				name: child.child('name').val(),
				content: child.child('content').val(),
				time: child.child('time').val()
			});
		});
		setChatView(chatList);
		setOnChat(true);
		db.ref('member/' + id + '/count/' + selectedKey).set(0, (error) => getChatRoom());
		db.ref('chatRoom/' + selectedKey + '/member/' + id + '/lastChatCheckTime').set(getCurrentTimeStamp());
	});
}

function removeGetChat() {
	setOnChat(false);
	db.ref('chatRoom/' + selectedKey + '/chat').off();
}

function setChatView(chatList) {
	getNoticeChat();
	$('#chat_box div').remove();
	chatList.forEach((data, i) => {
		let str = '';
		let isSystem = data.name.indexOf('SYSTEM') != -1;
		
		if (isSystem) str += '<div class="chat_message_wrapper chat_message_system">';
		else if (data.id == id) str += '<div class="chat_message_wrapper chat_message_right">';
		else str += '<div class="chat_message_wrapper">';
		
		str += '<input type="hidden" value="' + data.time + '"/>'
		
		if (!isSystem && i != 0 && chatList[i - 1].name != data.name) str += '<p class="chat-member">' + data.name + '</p>';
		else if (!isSystem && i == 0) str += '<p class="chat-member">' + data.name + '</p>';
		
		if (chatList[i].content.indexOf('##') != -1) str += '<ul class="chat_message"><li><p>' + setLinkChat(chatList[i].content);	
		else str += '<ul class="chat_message"><li><p>' + chatList[i].content;
		
		if (!isSystem && i != chatList.length - 1 && data.time != chatList[i + 1].time) {
			str += '<span class="chat_message_time">' + getTime(data.time) + '</span>';
		} 	
		else if (!isSystem && i == chatList.length - 1) str += '<span class="chat_message_time">' + getTime(data.time) + '</span>';
		str += '</p></li></ul></div>';
		if (data.name.indexOf('SYSTEM') != -1) getNoticeChat();
		$('#chat_box').append(str);
	});
	$('#chatroom').addClass('popup-box-on');
	$('.chat_message').on('mousedown', function(){
		if ((event.button == 2) || (event.which == 3)) {
			let content = $(this).children('li').children('p').text().replace($(this).children('li').children('p').children('span').text(), '');
			confirm('info', '공지사항 설정', '정말 "' + content + '"를 채팅방의 공지사항으로 등록하시겠습니까?', function(result) {
				if (result.isConfirmed) {
					setNoticeChat(content);
				}
			});
		}
	});
	$("#chat").scrollTop($("#chat_box").height());
}

function setLinkChat(content) {
	let arr = content.split("##");
	if (arr[1] == 'patient') {
		return '<a href="' + 'http://' + window.location.host + '/hmsw/patientInfo.st?id=' + arr[2] + '">'
		+ '→ 환자정보(' + arr[3] + ')</a>'; 
	}
}

/**
	채팅 전송
 */
function sendChat(content) {
	let chat = {
		id: id,
		name: name,
		content: content,
		time: getCurrentTimeStamp()
	};
	db.ref('chatRoom/' + selectedKey + '/chat').push().set(chat);
	db.ref('chatRoom/' + selectedKey + '/lastChat').set(chat);
	db.ref('chatRoom/' + selectedKey + '/member').once('value', (snapshot) => {
		snapshot.forEach(function(child){
			if (child.key != id && child.child('onChat').val() == false) {
				db.ref('member/' + child.key).once('value', (snapshot) => {
					if (snapshot.child('count/' + selectedKey).exists()) {
						db.ref('member/' + child.key + '/count/' + selectedKey).set(snapshot.child('count/' + selectedKey).val() + 1);
					} else {
						db.ref('member/' + child.key + '/count/' + selectedKey).set(1);
					}
					if (snapshot.child('token').exists() && snapshot.child('token').val() != 'null') {
						$.ajax({
							url: 'sendPush.st',
							data: {
								token: snapshot.child('token').val(),
								content: content,
								name: name,
								key: selectedKey,
								title: selectedRoomTitle
							},
							error : function(req, text) {
								errorToast(req.status);
							}
						});
					}
				});
				db.ref('member/' + child.key + '/lastChatRoom').set(selectedKey + '##' + selectedRoomTitle, (error) => {
					db.ref('member/' + child.key + '/lastChat').set(chat);
				});
				
			}
		})
	});
}

/**
	하루가 지나갈 경우 시스템 메시지에 날짜 출력
 */
function sendDateBeforeChat(content) {
	let chat = {
		id: '0',
		name: 'SYSTEM',
		content: getDateFormat(getCurrentTimeStamp()),
		time: getCurrentTimeStamp()
	};
	db.ref('chatRoom/' + selectedKey + '/chat').push().set(chat, (error) => {
		sendChat(content);
	})
}

/**
	채팅 알림
 */
function getNotification() {
	db.ref('member/' + id + '/lastChat').on('value', (lastChat) => {
		db.ref('member/' + id + '/lastChatRoom').once('value', (snapshot) => {
			if (new Date().getTime() - new Date(lastChat.child('time').val()).getTime() < 20000
				&& snapshot.val().indexOf(selectedKey) != -1 && sessionStorage.getItem("lastChat") != lastChat.child('content').val()) {
				sessionStorage.setItem("lastChat", lastChat.child('content').val())
				chatToast(snapshot.val(), lastChat.child('content').val(), lastChat.child('name').val());
			}
		});
	});
}

function chatToast(lastChatRoom, content, writerName) {
	let title = '';
	let arr = lastChatRoom.split("##");
	if (arr[1].indexOf("#") != -1) title = writerName;
	else title = arr[1] + ' (' + writerName + ')'; 
	
	gfn_toast({ "title": title, "contents": content, "lastChatRoom": lastChatRoom });

	function gfn_toast(option) {
		if (!!$("#g_toast_container")) {
			$("#g_toast_container").remove();
		}
		var optionDefault = { "title": title, "contents": content }
		option = $.extend(optionDefault, option);

		var toastDiv = '';
		toastDiv += '<div id="g_toast_container" style="min-height: 250px;position:absolute;top:60px;">';
		toastDiv += '<div id="g_toast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">';
		toastDiv += '  <div class="toast-header bg-info text-white">';
		toastDiv += '    <i class="fas fa-envelope fa-fw"></i>';
		toastDiv += '    <strong class="mr-auto ml-3">' + option.title + '</strong>';
		toastDiv += '    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">';
		toastDiv += '      <span aria-hidden="true">&times;</span>';
		toastDiv += '    </button>';
		toastDiv += '  </div>';
		toastDiv += '  <div class="toast-body">' + option.contents + '</div>';
		toastDiv += '</div>';
		toastDiv += '</div>';

		$("body").append(toastDiv);

		$("#g_toast_container").css("right", 24);
		$("#g_toast_container").css("top", 70);
		$("#g_toast_container").hover(function() {
			$(this).css('cursor', 'pointer');
		})
		$("#g_toast_container").click(function(){
			$("#g_toast").toast('hide');
			removeGetChat();
			let optionArr = option.lastChatRoom.split("##");
			let roomTitle = '';
			if (optionArr[1].indexOf("#") != -1) {
				selectedRoomTitle = optionArr[1];
				roomTitle = selectedRoomTitle.replace('#', '');
				roomTitle = roomTitle.replace(name, '');		
			} 
			selectedKey = optionArr[0];
			$('#chatroom_title').text(roomTitle);
			getChat();
		});

		$("#g_toast").toast({ "animation": true, "autohide": true, "delay": 3000 });
		$("#g_toast").toast('show');
	}
}

/**
   채팅방 입장/퇴장시 접속 상태를 변경
 */
function setOnChat(onChat) {
	if (selectedKey != '') {
		db.ref('chatRoom/' + selectedKey + '/member/' + id + '/onChat').set(onChat);
		if (!onChat) selectedKey == '';
	}
}

/**
   채팅방 공지사항 불러오기
 */
 function getNoticeChat() {
	db.ref('chatRoom/' + selectedKey + '/noticeChat').on('value', (snapshot) => {
		if (snapshot.exists()) {
			$('#chatRoomNotice_div').css('display', 'flex')
			$('#chatRoomNotice').text(snapshot.child('content').val());
		} else {
			$('#chatRoomNotice_div').css('display', 'none');
			$('#chatRoomNotice').text('');
		}
	});
}

/**
   채팅방 공지사항 설정하기
 */
function setNoticeChat(content) {
	let chat = {
		id: '00',
		name: 'notice',
		content: content,
		time: getCurrentTimeStamp()
	};
	let systemChat = {
		id: '0',
		name: 'SYSTEM_NOTICE',
		content: '채팅방의 공지사항이 설정되었습니다.',
		time: getCurrentTimeStamp()
	};
	db.ref('chatRoom/' + selectedKey + '/noticeChat').set(chat, (error) => {
		db.ref('chatRoom/' + selectedKey + '/chat').push(systemChat);
	});
}

$(window).on("beforeunload", function() {
	removeGetChat();
});