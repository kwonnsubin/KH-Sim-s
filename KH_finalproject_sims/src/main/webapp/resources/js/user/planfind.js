$(document).ready(function() {
	for(var i = 0; i < $(".col-12 > div").length; i++) {
		var hiddenVal = $("input[type=hidden]").eq(i).val();
		for(var j = 0; j < $(".col-12 > div").eq(i).find("input").length; j++) {
			if($(".col-12 > div").eq(i).find("input").eq(j).val() == hiddenVal) {
				$(".col-12 > div").eq(i).find("input").eq(j).prop("checked", true);
			}
		}
	}
	$("input[type=radio]:checked").parent().css("border-color", "#4B8EF1");
	$("input[type=radio]:checked").parent().css("border-width", "2px");
	
	const urlParams = new URL(location.href).searchParams;
	const queType = urlParams.get('queType');
	
	if(queType == "telecom") {
		$(".telecom").css("display", "");
	} else if(queType == "data") {
		$(".data").css("display", "");
	} else if(queType == "speed") {
		$(".speed").css("display", "");
	} else if(queType == "voice") {
		$(".voice").css("display", "");
	}
	
	$("label input[type=radio]").on("click", function(e){
		$("input[type=radio]").parent().css("border-color", "#cfcfcf");
		$("input[type=radio]").parent().css("border-width", "1px");
		$("input[type=radio]:checked").parent().css("border-color", "#4B8EF1");
		$("input[type=radio]:checked").parent().css("border-width", "2px");
		
		insertQueVal(e);
	});
});

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

var cPath = getContextPath();

function insertQueVal(e) {
	const urlParams = new URL(location.href).searchParams;
	const queType = urlParams.get('queType');
	
	$.ajax({
		url : cPath + "/planfind",
		type : "post",
		async : false,
		data : {
			type : queType,
			value : $(e.target).val()
		},
		dataType : "json",
		success : function(result){
			if(queType == "voice") {
				var tel = result.cqTelecom;
				var data = result.cqData;
				var speed = result.cqSpeed;
				var voice = result.cqVoice;
				
				if(data == 1) data = 100000;
				else if(data == 2) data = 50000;
				else if(data == 3) data = 10000;
				else if(data == 4) data = 5000;
				else if(data == 5) data = 999999;
				
				if(voice == 1) voice = 300;
				else if(voice == 2) voice = 180;
				else if(voice == 3) voice = 60;
				else if(voice == 4) voice = 999999;
				
				if(tel == 4 || tel == 0) {
					location.href = cPath + "/plans?planData=" + data + "&planVoice=" + voice + "&genNo=" + speed;
				} else {
					location.href = cPath + "/plans?planData=" + data + "&planVoice=" + voice + "&netNo=" + tel + "&genNo=" + speed;
				}
			} else {
				var nextUrl = null;
				
				if(queType == "telecom") nextUrl = "data";
				else if(queType == "data") nextUrl = "speed";
				else if(queType == "speed") nextUrl = "voice";
				
				location.href= cPath + "/planfind?queType=" + nextUrl;
			}
		}
	 });
}