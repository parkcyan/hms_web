/**
 * 
 */
 
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