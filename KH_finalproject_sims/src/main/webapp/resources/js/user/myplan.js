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

$('.order-text').on('click', function(e) {
	$('.order-text p').css('font-weight', 'bold');
	$('.accept-text p').css('font-weight', '');
	$('.hold-text p').css('font-weight', '');
	
	$('.myplan-list-order').css('display', '');
	$('.myplan-list-accept').css('display', 'none');
	$('.myplan-list-hold').css('display', 'none');
});

$('.accept-text').on('click', function(e) {
	$('.order-text p').css('font-weight', '');
	$('.accept-text p').css('font-weight', 'bold');
	$('.hold-text p').css('font-weight', '');
	
	$('.myplan-list-order').css('display', 'none');
	$('.myplan-list-accept').css('display', '');
	$('.myplan-list-hold').css('display', 'none');
});

$('.hold-text').on('click', function(e) {
	$('.order-text p').css('font-weight', '');
	$('.accept-text p').css('font-weight', '');
	$('.hold-text p').css('font-weight', 'bold');
	
	$('.myplan-list-order').css('display', 'none');
	$('.myplan-list-accept').css('display', 'none');
	$('.myplan-list-hold').css('display', '');
});