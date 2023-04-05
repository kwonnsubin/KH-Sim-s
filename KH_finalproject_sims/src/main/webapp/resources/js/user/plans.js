$(document).ready(function() {
	var len = $("fieldset label");
	
	$("fieldset label").on("click", function(e) {
		
		// 버튼 클릭시 슬라이더 변경
		rdoValCheck(e);
		
		// 슬라이더 변경 시 텍스트 변경
		rangeText();
		
		// 버튼 클릭 시 색 변경
		inputChecked();
	});
	
	$("input[type=range]").on("change", function() {
		var ran1 = $("input[type=range]").eq(0).val();
		var ran2 = $("input[type=range]").eq(1).val();
		
		if(ran1 >= 0 && ran2 <= 5) {
			$("fieldset label").eq(5).children('input').prop("checked", true);
		} else if(ran1 >= 5 && ran2 <= 10) {
			$("fieldset label").eq(4).children('input').prop("checked", true);
		} else if(ran1 >= 10 && ran2 <= 50) {
			$("fieldset label").eq(3).children('input').prop("checked", true);
		} else if(ran1 >= 50 && ran2 <= 100) {
			$("fieldset label").eq(2).children('input').prop("checked", true);
		} else if(ran1 === 100 && ran2 === 100) {
			$("fieldset label").eq(1).children('input').prop("checked", true);
		} else if(ran1 === 0 && ran2 === 100) {
			$("fieldset label").eq(0).children('input').prop("checked", true);
		}
		
		rangeText();
		inputChecked();
	});
});

function inputChecked() {
	var len = $("fieldset label");
	
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

function rangeText() {
	var ran1 = $("input[type=range]").eq(0).val();
	var ran2 = $("input[type=range]").eq(1).val();
	
	if(ran1 === 0 && ran2 === 100) {
		$(".range1-label").text("전체");
	} else if(ran1 === 100 && ran2 === 100) {
		$(".range1-label").text("100GB 이상");
	} else if(ran1 >= 0 && ran2 <= 5) {
		$(".range1-label").text("5GB 이하");
	} else {
		$(".range1-label").text(ran1 + "~" + ran2 + "GB");
	}
}

function rdoValCheck(e) {
	if($(e.target).val() === "전체") {
		$("input[type=range]").eq(0).val("0");
		$("input[type=range]").eq(1).val("100");
		$("div[range]").css("left", "0%");
		$("div[range]").css("right", "0%");
		$("span[thumb]").eq(0).css("left", "0%");
		$("span[thumb]").eq(1).css("left", "100%");
		$("div[sign]").eq(0).css("left", "0%");
		$("div[sign]").eq(1).css("left", "100%");
		$("div[sign]").eq(0).children("span").text("0");
		$("div[sign]").eq(1).children("span").text("100");
	} else if($(e.target).val() === "100GB 이상") {
		$("input[type=range]").eq(0).val("100");
		$("input[type=range]").eq(1).val("100");
		$("div[range]").css("left", "100%");
		$("div[range]").css("right", "0%");
		$("span[thumb]").eq(0).css("left", "100%");
		$("span[thumb]").eq(1).css("left", "100%");
		$("div[sign]").eq(0).css("left", "100%");
		$("div[sign]").eq(1).css("left", "100%");
		$("div[sign]").eq(0).children("span").text("100");
		$("div[sign]").eq(1).children("span").text("100");
	} else if($(e.target).val() === "50~100GB") {
		$("input[type=range]").eq(0).val("50");
		$("input[type=range]").eq(1).val("100");
		$("div[range]").css("left", "50%");
		$("div[range]").css("right", "0%");
		$("span[thumb]").eq(0).css("left", "50%");
		$("span[thumb]").eq(1).css("left", "100%");
		$("div[sign]").eq(0).css("left", "50%");
		$("div[sign]").eq(1).css("left", "100%");
		$("div[sign]").eq(0).children("span").text("50");
		$("div[sign]").eq(1).children("span").text("100");
	} else if($(e.target).val() === "10~50GB") {
		$("input[type=range]").eq(0).val("10");
		$("input[type=range]").eq(1).val("50");
		$("div[range]").css("left", "10%");
		$("div[range]").css("right", "50%");
		$("span[thumb]").eq(0).css("left", "10%");
		$("span[thumb]").eq(1).css("left", "50%");
		$("div[sign]").eq(0).css("left", "10%");
		$("div[sign]").eq(1).css("left", "50%");
		$("div[sign]").eq(0).children("span").text("10");
		$("div[sign]").eq(1).children("span").text("50");
	} else if($(e.target).val() === "5~10GB") {
		$("input[type=range]").eq(0).val("5");
		$("input[type=range]").eq(1).val("10");
		$("div[range]").css("left", "5%");
		$("div[range]").css("right", "90%");
		$("span[thumb]").eq(0).css("left", "5%");
		$("span[thumb]").eq(1).css("left", "10%");
		$("div[sign]").eq(0).css("left", "5%");
		$("div[sign]").eq(1).css("left", "10%");
		$("div[sign]").eq(0).children("span").text("5");
		$("div[sign]").eq(1).children("span").text("10");
	} else if($(e.target).val() === "5GB 이하") {
		$("input[type=range]").eq(0).val("0");
		$("input[type=range]").eq(1).val("5");
		$("div[range]").css("left", "0%");
		$("div[range]").css("right", "95%");
		$("span[thumb]").eq(0).css("left", "0%");
		$("span[thumb]").eq(1).css("left", "5%");
		$("div[sign]").eq(0).css("left", "0%");
		$("div[sign]").eq(1).css("left", "5%");
		$("div[sign]").eq(0).children("span").text("0");
		$("div[sign]").eq(1).children("span").text("5");
	}
}