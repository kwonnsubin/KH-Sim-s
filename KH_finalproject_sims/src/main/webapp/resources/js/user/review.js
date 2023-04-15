const drawStar = (target) => {
	$(target).prev().css({ width: `${target.value * 10}%` });
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
	$('.written-content textarea').css('cursor', 'default');
	
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
	textarea.css('cursor', 'text');
	
	$(e.target).parent().css('display', 'none');
	$(e.target).parent().next().css('display', '');
	
	$(e.target).parent().parent().prev().find('.starInput').attr('type', 'range');
});

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

var cPath = getContextPath();

// 리뷰 작성
$('.insert-btn').on('click', function(e) {
	if($('.insert-textarea').val() != '') {
		$.ajax({
			url : cPath + "/mypage/review/write",
			type : "post",
			async : false,
			data : {
				reviewContent : $(e.target).parents('.insert-div').find(".insert-textarea").val(),
				reviewStar : $(e.target).parents('.insert-div').find(".insert-star").val(),
				bizId : $(e.target).parents('.insert-div').find(".bizId").val()
			},
			dataType : "json",
			success : function(data){
				if(data.num != 1) {
					alert("리뷰가 작성되지 않았습니다.");
				}
				location.reload();
			}
		 });
	}
});

// 리뷰 수정
$('.update-btn').on('click', function(e) {
	$.ajax({
		url : cPath + "/mypage/review/update",
		type : "post",
		async : false,
		data : {
			reviewNo : $(e.target).parent().parent().prev().find('.reviewNo').val(),
			reviewStar : $(e.target).parent().parent().prev().find('.starInput').val(),
			reviewContent : $(e.target).parent().parent().prev().find('.updateTextarea').val()
		},
		dataType : "json",
		success : function(data){
			if(data.num != 1) {
				alert("리뷰가 수정되지 않았습니다.");
			}
			location.reload();
		}
	 });
});

// 리뷰 삭제
$('.del-btn').on('click', function(e) {
	$.ajax({
		url : cPath + "/mypage/review/delete",
		type : "post",
		async : false,
		data : {
			reviewNo : $(e.target).parent().parent().prev().find('.reviewNo').val()
		},
		dataType : "json",
		success : function(data){
			if(data.num != 1) {
				alert("리뷰가 삭제되지 않았습니다.");
			}
			location.reload();
		}
	 });
});