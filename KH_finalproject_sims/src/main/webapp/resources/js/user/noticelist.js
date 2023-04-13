function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

var cPath = getContextPath();

$(document).ready(function() {
	$(".notice-list").on("click", function(e) {
		var ntcNum = $(e.target).parents(".notice-list").find("input").val();
		location.href = cPath + "/notice/" + ntcNum;
	});
});