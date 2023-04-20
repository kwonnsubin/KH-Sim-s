$('.select-text').on('click', function(e) {
	if( $(e.target).text().includes('조회수') ) {
		$('.viewRankDiv').css('display', '');
		$('.likeRankDiv').css('display', 'none');
		$('.orderRankDiv').css('display', 'none');
		
		$(e.target).css('font-weight', 'bold');
		$(e.target).siblings('div').css('font-weight', '');
	} else if($(e.target).text().includes('찜')) {
		$('.viewRankDiv').css('display', 'none');
		$('.likeRankDiv').css('display', '');
		$('.orderRankDiv').css('display', 'none');
		
		$(e.target).css('font-weight', 'bold');
		$(e.target).siblings('div').css('font-weight', '');
	} else if($(e.target).text().includes('가입자')) {
		$('.viewRankDiv').css('display', 'none');
		$('.likeRankDiv').css('display', 'none');
		$('.orderRankDiv').css('display', '');
		
		$(e.target).css('font-weight', 'bold');
		$(e.target).siblings('div').css('font-weight', '');
	}
});

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