
$('.insert-star').on('propertychange change keyup paste input', function (e) {
	if($(e.target).val() == 1) {
		$(e.target).parent().children('i').eq(0).removeClass('class');
		$(e.target).parent().children('i').eq(0).attr('class', 'fa-regular fa-star-half-stroke');
		starRegular(e);
	} else if($(e.target).val() == 2) {
		$(e.target).parent().children('i').eq(0).removeClass('class');
		$(e.target).parent().children('i').eq(0).attr('class', 'fa-solid fa-star');
		starRegular(e);
	} else if($(e.target).val() == 3) {
		$(e.target).parent().children('i').eq(1).removeClass('class');
		$(e.target).parent().children('i').eq(1).attr('class', 'fa-regular fa-star-half-stroke');
		starRegular(e);
	} else if($(e.target).val() == 4) {
		$(e.target).parent().children('i').eq(1).removeClass('class');
		$(e.target).parent().children('i').eq(1).attr('class', 'fa-solid fa-star');
		starRegular(e);
	} else if($(e.target).val() == 5) {
		$(e.target).parent().children('i').eq(2).removeClass('class');
		$(e.target).parent().children('i').eq(2).attr('class', 'fa-regular fa-star-half-stroke');
		starRegular(e);
	} else if($(e.target).val() == 6) {
		$(e.target).parent().children('i').eq(2).removeClass('class');
		$(e.target).parent().children('i').eq(2).attr('class', 'fa-solid fa-star');
		starRegular(e);
	} else if($(e.target).val() == 7) {
		$(e.target).parent().children('i').eq(3).removeClass('class');
		$(e.target).parent().children('i').eq(3).attr('class', 'fa-regular fa-star-half-stroke');
		starRegular(e);
	} else if($(e.target).val() == 8) {
		$(e.target).parent().children('i').eq(3).removeClass('class');
		$(e.target).parent().children('i').eq(3).attr('class', 'fa-solid fa-star');
		starRegular(e);
	} else if($(e.target).val() == 9) {
		$(e.target).parent().children('i').eq(4).removeClass('class');
		$(e.target).parent().children('i').eq(4).attr('class', 'fa-regular fa-star-half-stroke');
		starRegular(e);
	} else if($(e.target).val() == 10) {
		$(e.target).parent().children('i').eq(4).removeClass('class');
		$(e.target).parent().children('i').eq(4).attr('class', 'fa-solid fa-star');
		starRegular(e);
	}
});

function starRegular(e) {
	var val = Math.round($(e.target).val() / 2) - 1;
	console.log(val);
	for(var i = val - 1; i >= 0; i--) {
		$(e.target).parent().children('i').eq(i).removeClass('class');
		$(e.target).parent().children('i').eq(i).attr('class', 'fa-solid fa-star');
	}
	for(var i = val + 1; i < 5; i++) {
		$(e.target).parent().children('i').eq(i).removeClass('class');
		$(e.target).parent().children('i').eq(i).attr('class', 'fa-regular fa-star');
	}
}

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
	$('.written-review-list .starInput').attr('type', 'hidden');
	
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