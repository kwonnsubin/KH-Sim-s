$(document).ready(function() {
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
		
		if(queType == "telecom") {
			insertQueVal(e);
		} else if(queType == "data") {
			location.href= cPath + "/planfind?queType=speed";
		} else if(queType == "speed") {
			location.href= cPath + "/planfind?queType=voice";
		} else if(queType == "voice") {
			location.href= cPath + "/";
		} 
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
	if(queType == "telecom") {
		var nextUrl = "data";
	} else if(queType == "data") {
		var nextUrl = "speed";
	} else if(queType == "speed") {
		var nextUrl = "voice";
	}
	
	$.ajax({
		url : cPath + "/planfind",
		type : "post",
		async : false,
		data : {
			type : queType,
			value : $(e.target).val()
		},
		dataType : "json",
		success : function(){
			location.href= cPath + "/planfind?queType=" + nexturl;
		}
	 });
}