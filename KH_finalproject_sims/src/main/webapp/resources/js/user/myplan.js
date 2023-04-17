// url 경로
function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

var cPath = getContextPath();

$(".myplan-btn").on("click", function(e) {
	var orderNo = $(e.target).parent().prev().find('input').val();
	location.href = cPath + "/mypage/myplan/" + orderNo;
});