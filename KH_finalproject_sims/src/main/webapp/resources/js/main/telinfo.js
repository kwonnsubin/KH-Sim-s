$(document).ready(function() {
	for(var i = 5; i < $('.list-row').length; i++) {
		$('.list-row').eq(i).css('display', 'none');
	}
	
	for(var i = 0; i < $('.written-content').length; i++) {
		$('.written-content').eq(i).find('textarea').height(1).height( $('.written-content').eq(i).find('textarea').prop('scrollHeight')+12 );
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

$('.f-review-plus').on('click', function() {
	for(var i = 5; i < 10; i++) {
		$('.list-row').eq(i).css('display', '');
		$('.written-content').eq(i).find('textarea').height(1).height( $('.written-content').eq(i).find('textarea').prop('scrollHeight')+12 );
	}
	if($('.list-row').length > 10) {
		$('.s-review-plus').css('display', '');
	}
	$('.f-review-plus').css('display', 'none');
});

$('.s-review-plus').on('click', function() {
	for(var i = 10; i < $('.list-row').length; i++) {
		$('.list-row').eq(i).css('display', '');
		$('.written-content').eq(i).find('textarea').height(1).height( $('.written-content').eq(i).find('textarea').prop('scrollHeight')+12 );
		
	}
	$('.s-review-plus').css('display', 'none');
});

$('.menu-text').on('click', function(e) {
	if($(e.target).text() == '기본정보') {
		var name = 'basic-info';
	} else if($(e.target).text() == '요금제') {
		var name = 'biz-plans';
	} else if($(e.target).text().includes('리뷰')) {
		var name = 'biz-review';
	}
	goToScroll(name);
});

$('.review-cnt').on('click', function() {
	var name = 'biz-review';
	goToScroll(name);
});

function goToScroll(name) {
	var target = $("#" + name).offset().top;
	$(window).scrollTop(target - 180);
}

$(window).scroll(function(){
	var height = $(window).scrollTop();
	if(height >= 377 && height < 1000) {
		$('.menu-text').eq(0).css('border-bottom', '3px solid');
		$('.menu-text').eq(1).css('border-bottom', '');
		$('.menu-text').eq(2).css('border-bottom', '');
	} else if(height >= 1000 && height < 2010) {
		$('.menu-text').eq(1).css('border-bottom', '3px solid');
		$('.menu-text').eq(0).css('border-bottom', '');
		$('.menu-text').eq(2).css('border-bottom', '');
	} else if(height > 2010 && height < 2700) {
		$('.menu-text').eq(2).css('border-bottom', '3px solid');
		$('.menu-text').eq(0).css('border-bottom', '');
		$('.menu-text').eq(1).css('border-bottom', '');
	}
});