$(document).ready(function() {
	$('.modal').on('shown.bs.modal', function () {
		$("body").css("overflow", "hidden");
	});
	$('.modal').on('hidden.bs.modal', function () {
		$("body").css("overflow", "");
	})
	
	// planData Div 컨트롤
	$("#planData fieldset label").on("click", function(e) {
		// 버튼 클릭시 슬라이더 변경
		dataRdoValCheck(e);
		// 슬라이더 변경 시 텍스트 변경
		dataRangeText();
		// 버튼 클릭 시 색 변경
		dataInputChecked();
		
		var dataText = $("#planData fieldset label input:checked").val();
		$(".filter-area p").eq(1).text(dataText);
	});
	
	$("#planData input[type=range]").on("change", function() {
		var ran1 = $("#planData input[type=range]").eq(0).val();
		var ran2 = $("#planData input[type=range]").eq(1).val();
		
		if(ran1 >= 0 && ran2 <= 5) {
			$("#planData fieldset label").eq(5).children('input').prop("checked", true);
		} else if(ran1 >= 5 && ran2 <= 10) {
			$("#planData fieldset label").eq(4).children('input').prop("checked", true);
		} else if(ran1 >= 10 && ran2 <= 50) {
			$("#planData fieldset label").eq(3).children('input').prop("checked", true);
		} else if(ran1 >= 50 && ran2 <= 100) {
			$("#planData fieldset label").eq(2).children('input').prop("checked", true);
		} else if(ran1 === 100 && ran2 === 100) {
			$("#planData fieldset label").eq(1).children('input').prop("checked", true);
		} else if(ran1 === 0 && ran2 === 100) {
			$("#planData fieldset label").eq(0).children('input').prop("checked", true);
		}
		
		dataRangeText();
		dataInputChecked();
		
		var dataText = $("#planData fieldset label input:checked").val();
		$(".filter-area p").eq(1).text(dataText);
	});
	
	// planVoice Div 컨트롤
	$("#planVoice fieldset label").on("click", function(e) {
		// 버튼 클릭시 슬라이더 변경
		voiceRdoValCheck(e);
		// 슬라이더 변경 시 텍스트 변경
		voiceRangeText();
		// 버튼 클릭 시 색 변경
		voiceInputChecked();
		
		var voiceText = $("#planVoice fieldset label input:checked").val();
		$(".filter-area p").eq(3).text(voiceText);
	});
	
	$("#planVoice input[type=range]").on("change", function() {
		var ran1 = $("#planVoice input[type=range]").eq(0).val();
		var ran2 = $("#planVoice input[type=range]").eq(1).val();
		
		if(ran1 >= 0 && ran2 <= 60) {
			$("#planVoice fieldset label").eq(5).children('input').prop("checked", true);
		} else if(ran1 >= 60 && ran2 <= 180) {
			$("#planVoice fieldset label").eq(4).children('input').prop("checked", true);
		} else if(ran1 >= 180 && ran2 <= 300) {
			$("#planVoice fieldset label").eq(3).children('input').prop("checked", true);
		} else if(ran1 == 300 && ran2 == 300) {
			$("#planVoice fieldset label").eq(2).children('input').prop("checked", true);
		} else if(ran1 == 0 && ran2 == 0) {
			$("#planVoice fieldset label").eq(1).children('input').prop("checked", true);
		} else if(ran1 == 0 && ran2 == 300) {
			$("#planVoice fieldset label").eq(0).children('input').prop("checked", true);
		}
		
		voiceRangeText();
		voiceInputChecked();
		
		var voiceText = $("#planData fieldset label input:checked").val();
		$(".filter-area p").eq(3).text(voiceText);
	});
	
	// planMessage Div 컨트롤
	$("#planMessage fieldset label").on("click", function(e) {
		// 버튼 클릭시 슬라이더 변경
		messageRdoValCheck(e);
		// 슬라이더 변경 시 텍스트 변경
		messageRangeText();
		// 버튼 클릭 시 색 변경
		messageInputChecked();
	});
	
	$("#planMessage input[type=range]").on("change", function() {
		var ran1 = $("#planMessage input[type=range]").eq(0).val();
		var ran2 = $("#planMessage input[type=range]").eq(1).val();
		
		if(ran1 >= 0 && ran2 <= 50) {
			$("#planMessage fieldset label").eq(5).children('input').prop("checked", true);
		} else if(ran1 >= 50 && ran2 <= 100) {
			$("#planMessage fieldset label").eq(4).children('input').prop("checked", true);
		} else if(ran1 >= 100 && ran2 <= 300) {
			$("#planMessage fieldset label").eq(3).children('input').prop("checked", true);
		} else if(ran1 == 300 && ran2 == 300) {
			$("#planMessage fieldset label").eq(2).children('input').prop("checked", true);
		} else if(ran1 == 0 && ran2 == 0) {
			$("#planMessage fieldset label").eq(1).children('input').prop("checked", true);
		} else if(ran1 == 0 && ran2 == 300) {
			$("#planMessage fieldset label").eq(0).children('input').prop("checked", true);
		}
		
		messageRangeText();
		messageInputChecked();
	});
	
	// planPrice Div 컨트롤
	$("#planPrice fieldset label").on("click", function(e) {
		// 버튼 클릭 시 색 변경
		priceInputChecked();
		
		var priceText = $("#planPrice fieldset label input:checked").val();
		$(".filter-area p").eq(5).text(priceText);
	});
	
	// netNo Div 컨트롤
	$("#netNo fieldset label").on("click", function(e) {
		// 버튼 클릭 시 색 변경
		netInputChecked();
	});
	
	// genNo Div 컨트롤
	$("#genNo fieldset label").on("click", function(e) {
		// 버튼 클릭 시 색 변경
		genInputChecked();
	});
	
	// bizName Div 컨트롤
	$("#bizName fieldset label").on("click", function(e) {
		// 버튼 클릭 시 색 변경
		bizNameInputChecked();
	});
});

function goToScroll(name) {
//	var target = $("#" + name).offset().top;
//	$(".modal-body").animate({scrollTop: target}, 500);
//	location.href = "#" + name;
	
	if(name === "planData") {
		$(".modal-body").animate({scrollTop: 10}, 500);
	}
}

// planData 컨트롤
function dataInputChecked() {
	var len = $("#planData fieldset label");
	
	for(var i = 0; i < len.length; i++) {
		var inp = len.eq(i).children('input');
		if(inp.is(':checked')){
			len.eq(i).css("border-color", '#425AD5');
			len.eq(i).children('span').css("color", '#425AD5');
		} else {
			len.eq(i).css("border-color", '#d7d7d7');
			len.eq(i).children('span').css("color", '#333');
		}
	}
}

function dataRangeText() {
	var ran1 = $("#planData input[type=range]").eq(0).val();
	var ran2 = $("#planData input[type=range]").eq(1).val();
	
	if(ran1 == 0 && ran2 == 100) {
		$(".range1-label").text("전체");
	} else if(ran1 == 100 && ran2 == 100) {
		$(".range1-label").text("100GB 이상");
	} else if(ran1 >= 0 && ran2 <= 5) {
		$(".range1-label").text("5GB 이하");
	} else {
		$(".range1-label").text(ran1 + "~" + ran2 + "GB");
	}
}

function dataRdoValCheck(e) {
	if($(e.target).val() === "전체") {
		$("#planData input[type=range]").eq(0).val("0");
		$("#planData input[type=range]").eq(1).val("100");
		$("#planData div[range]").css("left", "0%");
		$("#planData div[range]").css("right", "0%");
		$("#planData span[thumb]").eq(0).css("left", "0%");
		$("#planData span[thumb]").eq(1).css("left", "100%");
		$("#planData div[sign]").eq(0).css("left", "0%");
		$("#planData div[sign]").eq(1).css("left", "100%");
		$("#planData div[sign]").eq(0).children("span").text("0");
		$("#planData div[sign]").eq(1).children("span").text("100");
	} else if($(e.target).val() === "100GB 이상") {
		$("#planData input[type=range]").eq(0).val("100");
		$("#planData input[type=range]").eq(1).val("100");
		$("#planData div[range]").css("left", "100%");
		$("#planData div[range]").css("right", "0%");
		$("#planData span[thumb]").eq(0).css("left", "100%");
		$("#planData span[thumb]").eq(1).css("left", "100%");
		$("#planData div[sign]").eq(0).css("left", "100%");
		$("#planData div[sign]").eq(1).css("left", "100%");
		$("#planData div[sign]").eq(0).children("span").text("100");
		$("#planData div[sign]").eq(1).children("span").text("100");
	} else if($(e.target).val() === "50~100GB") {
		$("#planData input[type=range]").eq(0).val("50");
		$("#planData input[type=range]").eq(1).val("100");
		$("#planData div[range]").css("left", "50%");
		$("#planData div[range]").css("right", "0%");
		$("#planData span[thumb]").eq(0).css("left", "50%");
		$("#planData span[thumb]").eq(1).css("left", "100%");
		$("#planData div[sign]").eq(0).css("left", "50%");
		$("#planData div[sign]").eq(1).css("left", "100%");
		$("#planData div[sign]").eq(0).children("span").text("50");
		$("#planData div[sign]").eq(1).children("span").text("100");
	} else if($(e.target).val() === "10~50GB") {
		$("#planData input[type=range]").eq(0).val("10");
		$("#planData input[type=range]").eq(1).val("50");
		$("#planData div[range]").css("left", "10%");
		$("#planData div[range]").css("right", "50%");
		$("#planData span[thumb]").eq(0).css("left", "10%");
		$("#planData span[thumb]").eq(1).css("left", "50%");
		$("#planData div[sign]").eq(0).css("left", "10%");
		$("#planData div[sign]").eq(1).css("left", "50%");
		$("#planData div[sign]").eq(0).children("span").text("10");
		$("#planData div[sign]").eq(1).children("span").text("50");
	} else if($(e.target).val() === "5~10GB") {
		$("#planData input[type=range]").eq(0).val("5");
		$("#planData input[type=range]").eq(1).val("10");
		$("#planData div[range]").css("left", "5%");
		$("#planData div[range]").css("right", "90%");
		$("#planData span[thumb]").eq(0).css("left", "5%");
		$("#planData span[thumb]").eq(1).css("left", "10%");
		$("#planData div[sign]").eq(0).css("left", "5%");
		$("#planData div[sign]").eq(1).css("left", "10%");
		$("#planData div[sign]").eq(0).children("span").text("5");
		$("#planData div[sign]").eq(1).children("span").text("10");
	} else if($(e.target).val() === "5GB 이하") {
		$("#planData input[type=range]").eq(0).val("0");
		$("#planData input[type=range]").eq(1).val("5");
		$("#planData div[range]").css("left", "0%");
		$("#planData div[range]").css("right", "95%");
		$("#planData span[thumb]").eq(0).css("left", "0%");
		$("#planData span[thumb]").eq(1).css("left", "5%");
		$("#planData div[sign]").eq(0).css("left", "0%");
		$("#planData div[sign]").eq(1).css("left", "5%");
		$("#planData div[sign]").eq(0).children("span").text("0");
		$("#planData div[sign]").eq(1).children("span").text("5");
	}
}

// planVoice 컨트롤
function voiceInputChecked() {
	var len = $("#planVoice fieldset label");
	
	for(var i = 0; i < len.length; i++) {
		var inp = len.eq(i).children('input');
		if(inp.is(':checked')){
			len.eq(i).css("border-color", '#425AD5');
			len.eq(i).children('span').css("color", '#425AD5');
		} else {
			len.eq(i).css("border-color", '#d7d7d7');
			len.eq(i).children('span').css("color", '#333');
		}
	}
}

function voiceRangeText() {
	var ran1 = $("#planVoice input[type=range]").eq(0).val();
	var ran2 = $("#planVoice input[type=range]").eq(1).val();
	
	if(ran1 == 0 && ran2 == 300) {
		$(".range2-label").text("전체");
	} else if(ran1 == 0 && ran2 == 0) {
		$(".range2-label").text("기본제공");
	} else if(ran1 == 300 && ran2 == 300) {
		$(".range2-label").text("300분 이상");
	} else if(ran1 >= 0 && ran2 <= 60) {
		$(".range2-label").text("60분 이하");
	} else {
		$(".range2-label").text(ran1 + "~" + ran2 + "분");
	}
}

function voiceRdoValCheck(e) {
	if($(e.target).val() === "전체") {
		$("#planVoice input[type=range]").eq(0).val("0");
		$("#planVoice input[type=range]").eq(1).val("300");
		$("#planVoice div[range]").css("left", "0%");
		$("#planVoice div[range]").css("right", "0%");
		$("#planVoice span[thumb]").eq(0).css("left", "0%");
		$("#planVoice span[thumb]").eq(1).css("left", "100%");
		$("#planVoice div[sign]").eq(0).css("left", "0%");
		$("#planVoice div[sign]").eq(1).css("left", "100%");
		$("#planVoice div[sign]").eq(0).children("span").text("0");
		$("#planVoice div[sign]").eq(1).children("span").text("100");
	} else if($(e.target).val() === "기본제공") {
		$("#planVoice input[type=range]").eq(0).val("0");
		$("#planVoice input[type=range]").eq(1).val("0");
		$("#planVoice div[range]").css("left", "0%");
		$("#planVoice div[range]").css("right", "100%");
		$("#planVoice span[thumb]").eq(0).css("left", "0%");
		$("#planVoice span[thumb]").eq(1).css("left", "0%");
		$("#planVoice div[sign]").eq(0).css("left", "0%");
		$("#planVoice div[sign]").eq(1).css("left", "0%");
		$("#planVoice div[sign]").eq(0).children("span").text("0");
		$("#planVoice div[sign]").eq(1).children("span").text("0");
	} else if($(e.target).val() === "300분 이상") {
		$("#planVoice input[type=range]").eq(0).val("300");
		$("#planVoice input[type=range]").eq(1).val("300");
		$("#planVoice div[range]").css("left", "100%");
		$("#planVoice div[range]").css("right", "0%");
		$("#planVoice span[thumb]").eq(0).css("left", "100%");
		$("#planVoice span[thumb]").eq(1).css("left", "100%");
		$("#planVoice div[sign]").eq(0).css("left", "100%");
		$("#planVoice div[sign]").eq(1).css("left", "100%");
		$("#planVoice div[sign]").eq(0).children("span").text("300");
		$("#planVoice div[sign]").eq(1).children("span").text("300");
	} else if($(e.target).val() === "180~300분") {
		$("#planVoice input[type=range]").eq(0).val("180");
		$("#planVoice input[type=range]").eq(1).val("300");
		$("#planVoice div[range]").css("left", "60%");
		$("#planVoice div[range]").css("right", "0%");
		$("#planVoice span[thumb]").eq(0).css("left", "60%");
		$("#planVoice span[thumb]").eq(1).css("left", "100%");
		$("#planVoice div[sign]").eq(0).css("left", "60%");
		$("#planVoice div[sign]").eq(1).css("left", "100%");
		$("#planVoice div[sign]").eq(0).children("span").text("180");
		$("#planVoice div[sign]").eq(1).children("span").text("300");
	} else if($(e.target).val() === "60~180분") {
		$("#planVoice input[type=range]").eq(0).val("60");
		$("#planVoice input[type=range]").eq(1).val("180");
		$("#planVoice div[range]").css("left", "20%");
		$("#planVoice div[range]").css("right", "40%");
		$("#planVoice span[thumb]").eq(0).css("left", "20%");
		$("#planVoice span[thumb]").eq(1).css("left", "60%");
		$("#planVoice div[sign]").eq(0).css("left", "20%");
		$("#planVoice div[sign]").eq(1).css("left", "60%");
		$("#planVoice div[sign]").eq(0).children("span").text("60");
		$("#planVoice div[sign]").eq(1).children("span").text("180");
	} else if($(e.target).val() === "60분 이하") {
		$("#planVoice input[type=range]").eq(0).val("0");
		$("#planVoice input[type=range]").eq(1).val("60");
		$("#planVoice div[range]").css("left", "0%");
		$("#planVoice div[range]").css("right", "80%");
		$("#planVoice span[thumb]").eq(0).css("left", "0%");
		$("#planVoice span[thumb]").eq(1).css("left", "20%");
		$("#planVoice div[sign]").eq(0).css("left", "0%");
		$("#planVoice div[sign]").eq(1).css("left", "20%");
		$("#planVoice div[sign]").eq(0).children("span").text("0");
		$("#planVoice div[sign]").eq(1).children("span").text("60");
	}
}

// planMessage 컨트롤
function messageInputChecked() {
	var len = $("#planMessage fieldset label");
	
	for(var i = 0; i < len.length; i++) {
		var inp = len.eq(i).children('input');
		if(inp.is(':checked')){
			len.eq(i).css("border-color", '#425AD5');
			len.eq(i).children('span').css("color", '#425AD5');
		} else {
			len.eq(i).css("border-color", '#d7d7d7');
			len.eq(i).children('span').css("color", '#333');
		}
	}
}

function messageRangeText() {
	var ran1 = $("#planMessage input[type=range]").eq(0).val();
	var ran2 = $("#planMessage input[type=range]").eq(1).val();
	
	if(ran1 == 0 && ran2 == 300) {
		$(".range3-label").text("전체");
	} else if(ran1 == 0 && ran2 == 0) {
		$(".range3-label").text("기본제공");
	} else if(ran1 == 300 && ran2 == 300) {
		$(".range3-label").text("300건 이상");
	} else if(ran1 >= 0 && ran2 <= 50) {
		$(".range3-label").text("50건 이하");
	} else {
		$(".range3-label").text(ran1 + "~" + ran2 + "건");
	}
}

function messageRdoValCheck(e) {
	if($(e.target).val() === "전체") {
		$("#planMessage input[type=range]").eq(0).val("0");
		$("#planMessage input[type=range]").eq(1).val("300");
		$("#planMessage div[range]").css("left", "0%");
		$("#planMessage div[range]").css("right", "0%");
		$("#planMessage span[thumb]").eq(0).css("left", "0%");
		$("#planMessage span[thumb]").eq(1).css("left", "100%");
		$("#planMessage div[sign]").eq(0).css("left", "0%");
		$("#planMessage div[sign]").eq(1).css("left", "100%");
		$("#planMessage div[sign]").eq(0).children("span").text("0");
		$("#planMessage div[sign]").eq(1).children("span").text("300");
	} else if($(e.target).val() === "기본제공") {
		$("#planMessage input[type=range]").eq(0).val("0");
		$("#planMessage input[type=range]").eq(1).val("0");
		$("#planMessage div[range]").css("left", "0%");
		$("#planMessage div[range]").css("right", "100%");
		$("#planMessage span[thumb]").eq(0).css("left", "0%");
		$("#planMessage span[thumb]").eq(1).css("left", "0%");
		$("#planMessage div[sign]").eq(0).css("left", "0%");
		$("#planMessage div[sign]").eq(1).css("left", "0%");
		$("#planMessage div[sign]").eq(0).children("span").text("0");
		$("#planMessage div[sign]").eq(1).children("span").text("0");
	} else if($(e.target).val() === "300건 이상") {
		$("#planMessage input[type=range]").eq(0).val("300");
		$("#planMessage input[type=range]").eq(1).val("300");
		$("#planMessage div[range]").css("left", "100%");
		$("#planMessage div[range]").css("right", "0%");
		$("#planMessage span[thumb]").eq(0).css("left", "100%");
		$("#planMessage span[thumb]").eq(1).css("left", "100%");
		$("#planMessage div[sign]").eq(0).css("left", "100%");
		$("#planMessage div[sign]").eq(1).css("left", "100%");
		$("#planMessage div[sign]").eq(0).children("span").text("300");
		$("#planMessage div[sign]").eq(1).children("span").text("300");
	} else if($(e.target).val() === "100~300건") {
		$("#planMessage input[type=range]").eq(0).val("100");
		$("#planMessage input[type=range]").eq(1).val("300");
		$("#planMessage div[range]").css("left", "33%");
		$("#planMessage div[range]").css("right", "0%");
		$("#planMessage span[thumb]").eq(0).css("left", "33%");
		$("#planMessage span[thumb]").eq(1).css("left", "100%");
		$("#planMessage div[sign]").eq(0).css("left", "33%");
		$("#planMessage div[sign]").eq(1).css("left", "100%");
		$("#planMessage div[sign]").eq(0).children("span").text("100");
		$("#planMessage div[sign]").eq(1).children("span").text("300");
	} else if($(e.target).val() === "50~100건") {
		$("#planMessage input[type=range]").eq(0).val("50");
		$("#planMessage input[type=range]").eq(1).val("100");
		$("#planMessage div[range]").css("left", "16%");
		$("#planMessage div[range]").css("right", "66%");
		$("#planMessage span[thumb]").eq(0).css("left", "16%");
		$("#planMessage span[thumb]").eq(1).css("left", "33%");
		$("#planMessage div[sign]").eq(0).css("left", "16%");
		$("#planMessage div[sign]").eq(1).css("left", "33%");
		$("#planMessage div[sign]").eq(0).children("span").text("50");
		$("#planMessage div[sign]").eq(1).children("span").text("100");
	} else if($(e.target).val() === "50건 이하") {
		$("#planMessage input[type=range]").eq(0).val("0");
		$("#planMessage input[type=range]").eq(1).val("50");
		$("#planMessage div[range]").css("left", "0%");
		$("#planMessage div[range]").css("right", "84%");
		$("#planMessage span[thumb]").eq(0).css("left", "0%");
		$("#planMessage span[thumb]").eq(1).css("left", "16%");
		$("#planMessage div[sign]").eq(0).css("left", "0%");
		$("#planMessage div[sign]").eq(1).css("left", "16%");
		$("#planMessage div[sign]").eq(0).children("span").text("0");
		$("#planMessage div[sign]").eq(1).children("span").text("50");
	}
}

//planPrice 컨트롤
function priceInputChecked() {
	var len = $("#planPrice fieldset label");
	
	for(var i = 0; i < len.length; i++) {
		var inp = len.eq(i).children('input');
		if(inp.is(':checked')){
			len.eq(i).css("border-color", '#425AD5');
			len.eq(i).children('span').css("color", '#425AD5');
		} else {
			len.eq(i).css("border-color", '#d7d7d7');
			len.eq(i).children('span').css("color", '#333');
		}
	}
}

//netNo 컨트롤
function netInputChecked() {
	var len = $("#netNo fieldset label");
	
	for(var i = 0; i < len.length; i++) {
		var inp = len.eq(i).children('input');
		if(inp.is(':checked')){
			len.eq(i).css("border-color", '#425AD5');
			len.eq(i).children('span').css("color", '#425AD5');
		} else {
			len.eq(i).css("border-color", '#d7d7d7');
			len.eq(i).children('span').css("color", '#333');
		}
	}
}

//genNo 컨트롤
function genInputChecked() {
	var len = $("#genNo fieldset label");
	
	for(var i = 0; i < len.length; i++) {
		var inp = len.eq(i).children('input');
		if(inp.is(':checked')){
			len.eq(i).css("border-color", '#425AD5');
			len.eq(i).children('span').css("color", '#425AD5');
		} else {
			len.eq(i).css("border-color", '#d7d7d7');
			len.eq(i).children('span').css("color", '#333');
		}
	}
}

//bizName 컨트롤
function bizNameInputChecked() {
	var len = $("#bizName fieldset label");
	
	for(var i = 0; i < len.length; i++) {
		var inp = len.eq(i).children('input');
		if(inp.is(':checked')){
			len.eq(i).css("border-color", '#425AD5');
			len.eq(i).children('span').css("color", '#425AD5');
		} else {
			len.eq(i).css("border-color", '#d7d7d7');
			len.eq(i).children('span').css("color", '#333');
		}
	}
}