/**
 * 
 */
 
 
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