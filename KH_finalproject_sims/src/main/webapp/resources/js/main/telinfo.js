//url 경로
function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

var cPath = getContextPath();

$('.list-div').on('click', function(e) {
	var planNo = $(e.target).parents('.list-div').find('.planNo').val();
	location.href = cPath + "/plan/" + planNo;
});