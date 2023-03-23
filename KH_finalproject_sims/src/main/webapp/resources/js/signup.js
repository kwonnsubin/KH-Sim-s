$(document).ready(function() {
    $("input[name='role']").click(function() {
        if($("input[name='role']:checked").val() === 'ROLE_USER') {
        	$(".biz").css("display","none");
        	$(".user").css("display","block");
        } else {
        	$(".biz").css("display","block");
        	$(".user").css("display","none");
        }
    })
    
    // 유저 비밀번호 체크
    $('.user input[name=pwCheck]').change(function(){
		if($('.user input[name=pw]').val() === $('.user input[name=pwCheck]').val()) {
			$(".user .pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".user .pwCheckDiv").css("display", "block");
			$(".btn").removeAttr("disabled");
		} else {
			$(".user .pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".user .pwCheckDiv").css("display", "block");
			$(".btn").attr("disabled", "disabled");
		}
	});
	
	$('.user input[name=pw]').change(function(){
		if($('.user input[name=pw]').val() === $('.user input[name=pwCheck]').val()) {
			$(".user .pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".user .pwCheckDiv").css("display", "block");
			$(".btn").removeAttr("disabled");
		} else {
			$(".user .pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".user .pwCheckDiv").css("display", "block");
			$(".btn").attr("disabled", "disabled");
		}
	});
	
	// 통신사 비밀번호 체크
	$('.biz input[name=pwCheck]').change(function(){
		if($('.biz input[name=pw]').val() === $('.biz input[name=pwCheck]').val()) {
			$(".biz .pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".biz .pwCheckDiv").css("display", "block");
			$(".btn").removeAttr("disabled");
		} else {
			$(".biz .pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".biz .pwCheckDiv").css("display", "block");
			$(".btn").attr("disabled", "disabled");
		}
	});
	
	$('.biz input[name=pw]').change(function(){
		if($('.biz input[name=pw]').val() === $('.biz input[name=pwCheck]').val()) {
			$(".biz .pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".biz .pwCheckDiv").css("display", "block");
			$(".btn").removeAttr("disabled");
		} else {
			$(".user .pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".biz .pwCheckDiv").css("display", "block");
			$(".btn").attr("disabled", "disabled");
		}
	});
	
	$('.user input[name=id]').change(function(){
		if($('.user input[name=id]').val() != null) {
			$(".user button[name=idBtn]").removeAttr("disabled");
		} else {
			$(".user button[name=idBtn]").attr("disabled", "disabled");
		}
	});
	
	$('.user input[name=userEmail]').change(function(){
		if($('.user input[name=userEmail]').val() != null) {
			$("button[name=emailBtn]").removeAttr("disabled");
		} else {
			$("button[name=emailBtn]").attr("disabled", "disabled");
		}
	});
	
	$('.biz input[name=id]').change(function(){
		if($('.biz input[name=id]').val() != null) {
			$(".biz button[name=idBtn]").removeAttr("disabled");
		} else {
			$(".biz button[name=idBtn]").attr("disabled", "disabled");
		}
	});
});

function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}

var contextPath = getContextPath();
  
window.addEventListener('load', () => {
  const forms = document.getElementsByClassName('validation-form');

  Array.prototype.filter.call(forms, (form) => {
    form.addEventListener('submit', function (event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }

      form.classList.add('was-validated');
    }, false);
  });
}, false);
    
$("button[name=idBtn]").on("click", idCheck);

function idCheck() {
	$.ajax({
		url : contextPath + "/signup/idcheck",
		type : "post",
		async : false,
		data : {
			id : $("input[name=id]").val()
		},
		dataType : "json",
		success : function(data){
			if(data.idCheck == 1) {
				$(".idCheckDiv").html("<p style='color: red;'>사용 불가능한 아이디입니다.</p>");
				$(".idCheckDiv").css("display", "block");
			} else {
				$(".idCheckDiv").html("<p style='color: green;'>사용 가능한 아이디입니다.</p>");
				$(".idCheckDiv").css("display", "block");
			}
		}
	 });
}

$('button[name=emailBtn]').on("click", function() {
	const email = $('input[name=userEmail').val() // 이메일 주소값 얻어오기
	const checkInput = $('input[name=emailCheck]') // 인증번호 입력하는곳 
	
	$.ajax({
		type : "get"
		, url : "${pageContext.request.contextPath}/emailCheck?email=" + email
		, success : function (data) {
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	});
});

// 인증번호 비교
$('input[name=emailCheck]').on("blur", function () {
	const inputCode = $(this).val();
	const $resultMsg = $('.emailCheckDiv');
	
	if(inputCode === code){
		$resultMsg.html("<p style='color: green;'>인증번호가 일치합니다.</p>");
		$resultMsg.css("display", "block");
		$('button[name=emailBtn]').attr('disabled',true);
		$('input[name=userEmail').attr('readonly',true);
		$('input[name=emailCheck]').attr('readonly',true);
	}else{
		$resultMsg.html("<p style='color: green;'>인증번호가 불일치합니다. 다시 확인해주세요</p>");
		$resultMsg.css("display", "block");
	}
});