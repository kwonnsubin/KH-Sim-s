$(document).ready(function() {
	
});

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}
var contextPath = getContextPath();

$(".myinfo-div").on("click", function() {
	location.href= contextPath + "/mypage/myinfo/";
});

$(".faqDiv").on("click", function() {
	location.href= contextPath + "/faq/";
});

$(".notice-div").on("click", function() {
	location.href= contextPath + "/noticelist";
});

$(".reviewDiv").on("click", function() {
	location.href= contextPath + "/mypage/review";
});

$(".myPlanDiv").on("click", function() {
	location.href= contextPath + "/mypage/myplan";
});

$(".recentDiv").on("click", function() {
	location.href= contextPath + "/mypage/recent";
});

$(".likeDiv").on("click", function() {
	location.href= contextPath + "/mypage/like";
});