const drawStar = (target) => {
	$(`.write-div .star span`).css({ width: `${target.value * 10}%` });
}

$(document).ready(function() {
	// 별 갯수
	for(var i = 0; i < $('.written-row').length; i++) {
		var starCnt = $('.written-row').eq(i).find('.starInput').val() * 10;
		$('.written-row').eq(i).find('.star span').css('width', starCnt + '%');
	}
});

$('.review-btn').on('click', function() {
	if($('.write-div').css('display') == 'none') {
		$('.write-div').css('display', '');
	} else if($('.write-div').css('display') == 'flex') {
		$('.write-div').css('display', 'none');
	}
});

$('.write-review').on('click', function() {
	$('.write-review p').css('font-weight', 'bold');
	$('.written-review p').css('font-weight', '');
	$('.write-review-list').css('display', '');
	$('.written-review-list').css('display', 'none');
	
	$('.written-content textarea').prop('readonly', true);
	$('.written-content textarea').css('border', 'none');
	$('.ad-btn').parent().css('display', '');
	$('.update-btn').parent().css('display', 'none');
});

$('.written-review').on('click', function() {
	$('.write-review p').css('font-weight', '');
	$('.written-review p').css('font-weight', 'bold');
	$('.write-review-list').css('display', 'none');
	$('.written-review-list').css('display', '');
	
	for(var i = 0; i < $('.written-content').length; i++) {
		$('.written-content').eq(i).find('textarea').height(1).height( $('.written-content').eq(i).find('textarea').prop('scrollHeight')+12 );
	}
});

$('textarea').on('keyup keypress', function (e) {
    $(this).css('height', 'auto');
    $(this).height(this.scrollHeight - 5);
});

$('.ad-btn').on('click', function(e) {
	var textarea = $(e.target).parents('.list-row').find('textarea'); 
	textarea.prop('readonly', false);
	textarea.css('border', '2px solid #e3e3e3');
	textarea.css('border-color', '#6f6f6f');
	
	$(e.target).parent().css('display', 'none');
	$(e.target).parent().next().css('display', '');
});