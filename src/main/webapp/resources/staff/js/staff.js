function toast(icon, title) {
	const Toast = Swal.mixin({
		toast: true,
		position: 'top',
		showConfirmButton: false,
		width: '400px',
		timer: 3000
	});
	Toast.fire({
		icon: icon,
		title: title
	});
}

function errorToast(req) {
	toast("error", "오류가 발생했습니다.\nerror code : " + req);
}

String.prototype.replaceAt = function(index, replacement) {
    if (index >= this.length) {
        return this.valueOf();
    }
 
    return this.substring(0, index) + replacement + this.substring(index + 1);
}

function emptyCheck() {
	let ok = true;
	$('.chk').each(function() {
		if ($.trim($(this).val()) == '') {
			let title = $(this).attr('placeholder') ? $(this).attr('placeholder') : $(this).attr('title');
			toast('error', title + '을(를) 입력하세요.');
			$(this).val('');
			$(this).focus();
			ok = false;
			return ok;
		}
	});
	return ok;
}

function confirm(icon, title, text, callback) {
	Swal.fire({
      title: title,
      text: text,
      icon: icon,
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '확인',
      cancelButtonText: '취소',
      reverseButtons: true, // 버튼 순서 거꾸로
    }).then(callback);
}

function setCookie(name, value, exp) {
	var date = new Date();
	date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
}

function getCookie(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value ? value[2] : null;
};

function deleteCookie(name) {
	var date = new Date();
	document.cookie = name + "= " + "; expires=" + date.toUTCString() + "; path=/"
}

function getAge(social_id) {
	let year = Number(social_id.substring(0, 2));
	if (year < 22) year += 2000;
	else year += 1900;
	let month = Number(social_id.substring(2, 4));
	let day = Number(social_id.substring(4));

	let today = new Date();
	let age = today.getFullYear() - year;
	let m = today.getMonth() + 1 - month;
	if (m < 0 || (m == 0 && today.getDate() < day)) age--;
	return age;
}

function getBirthDate(social_id) {
	let year = Number(social_id.substring(0, 2));
	if (year < 22) year += 2000;
	else year += 1900;
	let month = Number(social_id.substring(2, 4));
	let day = Number(social_id.substring(4));
	return year + "년 " + month + "월 " + day + "일";
}

function getPatient(patient_id) {
	$.ajax({
		url: 'patientInfoAjax.st',
		data: {
			id: patient_id
		},
		dataType: 'json',
		success: function(res) {
			$("#patient_name").val(res.name);
			$("#age").val(getAge(res.social_id));
			$("#gender").val(res.gender == 'M' ? '남' : '여');
			$("#birthdate").val(getBirthDate(res.social_id));
			$("#blood_type").val(res.blood_type);
			$("#height").val(res.height);
			$("#weight").val(res.weight);
			$("#underlying_disease").val(res.underlying_disease == '' ? res.underlying_disease : '없음');
			$("#allergy").val(res.allergy == '' ? res.allergy : '없음');
		},
		error: function(req, text) {
			errorToast(req.status);
		}
	});
}

function getWard(id) {
	let ward_number = parseInt((id - 1) / 20) * 100 + 500 + parseInt(((id - 1) % 20) / 4) + 1;
	let bed = id % 4 == 0 ? 4 : id % 4;
	return ward_number + "호 " + bed + "번";
}

function clearPatient() {
	$("#patient_name").val('');
	$("#age").val('');
	$("#gender").val('');
	$("#birthdate").val('');
	$("#blood_type").val('');
	$("#height").val('');
	$("#weight").val('');
	$("#underlying_disease").val('');
	$("#allergy").val('');
}

function timeStampOperator(date, operator, num) {
	if (operator == 'month') {
		var today = new Date(date);
		today.setMonth(today.getMonth() + num);
    	return today.toISOString().replace('T', ' ').substring(0, 19);
	}
}

// 2022-01-01 00:00:00
function getTimeStamp(date) {
	var today = new Date(date);
	today.setHours(today.getHours() + 9);
    return today.toISOString().replace('T', ' ').substring(0, 19);
}

function getCurrentTimeStamp() {
    var today = new Date();
    today.setHours(today.getHours() + 9);
    return today.toISOString().replace('T', ' ').substring(0, 19);
}

function getTime(timestamp) {
	return timestamp.substring(11, 16);
}

function getDate(timestamp) {
	return timestamp.substring(0, 10);
}

function getMonthDay(timestamp) {
	return timestamp.substring(5, 10);
}

function getDateFormat(timestamp) {
	return timestamp.substring(0, 4) + '년 ' + timestamp.substring(5, 7) + '월 ' + timestamp.substring(8, 10) + '일';
}

function getSchedule(date, event) {
	$("#spinner-mini").css('display', 'inline');
	$.ajax({
		url: 'getSchedule.st',
		data: {
			date: getDate(getTimeStamp(date))
		},
		dataType: 'json',
		success: function(res) {
			$('#schedule *').remove();
			let str = "";
			if (Object.keys(res).length == 0) {
				str += "<tr><td></td><td>일정이 없습니다.</td></tr>"
				$('#schedule').append(str);
			}
			else {
				$.each(res, function(i) {
					str += "<tr>"
					str += "<td style='display:none;'>" + res[i].schedule_id + "</td>";
					str += "<td>" + res[i].time + "</td>";
					str += "<td>" + res[i].content + "</td>"
					str += "</tr>"
				});
				$('#schedule').append(str);
				if (event) {
					$('#schedule tr').hover(function() {
						$(this).css('background-color', '#D0E2F4');
						$(this).css('cursor', 'pointer');
					}, function() {
						$(this).css('background-color', 'white');
					})
					$('#schedule tr').click(function() {
						$('#schedule_id').val($(this).children('td:eq(0)').text());
						let time = $(this).children('td:eq(1)').text();
						let hour = parseInt(time.substring(0, 2));
						let meridiem = hour > 12 ? 'PM' : 'AM';
						if (hour > 12) hour -= 12;
						let minute = time.substring(3, 5);
						$('#timepicker1').val(hour + ":" + minute + " " + meridiem);						
						$('#schedule_content').val($(this).children('td:eq(2)').text());
					});
				}		
			}
			$("#spinner-mini").css('display', 'none');
		},
		error: function(req, text) {
			errorToast(req.status);
			$("#spinner-mini").css('display', 'none');
		}
	})
}