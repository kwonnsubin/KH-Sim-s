$(document).ready(function() {
	
});

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}
var contextPath = getContextPath();

$(".myinfo-div").on("click", function() {
	location.href= contextPath + "/mypage/myinfo/" + $('h4').text().substr('0' , $('h4').text().length - 7);
});

$(".faqDiv").on("click", function() {
	location.href= contextPath + "/faq/"
});