$(document).ready(function() {
    $("input[name='role']").click(function() {
        if($("input[name='role']:checked").val() === 'ROLE_USER') {
        	$(".bizForm").css("display","none");
        	$(".userForm").css("display","block");
        } else {
        	$(".bizForm").css("display","block");
        	$(".userForm").css("display","none");
        }
    })
    
    // 유저 비밀번호 체크
    $('.user input[name=pwCheck]').change(function(){
		if($('.user input[name=pw]').val() === $('.user input[name=pwCheck]').val()) {
			$(".user .pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".user .pwCheckDiv").css("display", "block");
			if($('input[name=userEmail').attr('readonly') === 'readonly' && 
					$(".user .idCheckDiv").html() === '<p style="color: green;">사용 가능한 아이디입니다.</p>'){
				$(".userForm .btn").removeAttr("disabled");
			}
		} else {
			$(".user .pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".user .pwCheckDiv").css("display", "block");
			$(".userForm .btn").attr("disabled", "disabled");
		}
	});
	
	$('.user input[name=pw]').change(function(){
		if($('.user input[name=pw]').val() === $('.user input[name=pwCheck]').val()) {
			$(".user .pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".user .pwCheckDiv").css("display", "block");
			if($('input[name=userEmail').attr('readonly') === 'readonly' && 
					$(".user .idCheckDiv").html() === '<p style="color: green;">사용 가능한 아이디입니다.</p>'){
				$(".userForm .btn").removeAttr("disabled");
			}
		} else {
			$(".user .pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".user .pwCheckDiv").css("display", "block");
			$(".userForm .btn").attr("disabled", "disabled");
		}
	});
	
	// 통신사 비밀번호 체크
	$('.biz input[name=pwCheck]').change(function(){
		if($('.biz input[name=pw]').val() === $('.biz input[name=pwCheck]').val()) {
			$(".biz .pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".biz .pwCheckDiv").css("display", "block");
			if($(".biz .idCheckDiv").html() === '<p style="color: green;">사용 가능한 아이디입니다.</p>'){
				$(".bizForm .btn").removeAttr("disabled");
			}
		} else {
			$(".biz .pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".biz .pwCheckDiv").css("display", "block");
			$(".bizForm .btn").attr("disabled", "disabled");
		}
	});
	
	$('.biz input[name=pw]').change(function(){
		if($('.biz input[name=pw]').val() === $('.biz input[name=pwCheck]').val()) {
			$(".biz .pwCheckDiv").html("<p style='color: green;'>비밀번호가 같습니다.</p>");
			$(".biz .pwCheckDiv").css("display", "block");
			if($(".biz .idCheckDiv").html() === '<p style="color: green;">사용 가능한 아이디입니다.</p>'){
				$(".bizForm .btn").removeAttr("disabled");
			}
		} else {
			$(".user .pwCheckDiv").html("<p style='color: red;'>비밀번호가 다릅니다.</p>");
			$(".biz .pwCheckDiv").css("display", "block");
			$(".bizForm .btn").attr("disabled", "disabled");
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
    
$(".user button[name=idBtn]").on("click", userIdCheck);

function userIdCheck() {
	$.ajax({
		url : contextPath + "/signup/idcheck",
		type : "post",
		async : false,
		data : {
			id : $(".user input[name=id]").val()
		},
		dataType : "json",
		success : function(data){
			if(data.idCheck == 1) {
				$(".user .idCheckDiv").html("<p style='color: red;'>사용 불가능한 아이디입니다.</p>");
				$(".user .idCheckDiv").css("display", "block");
			} else {
				$(".user .idCheckDiv").html("<p style='color: green;'>사용 가능한 아이디입니다.</p>");
				$(".user .idCheckDiv").css("display", "block");
			}
		}
	 });
}

$(".biz button[name=idBtn]").on("click", bizIdCheck);

function bizIdCheck() {
	$.ajax({
		url : contextPath + "/signup/idcheck",
		type : "post",
		async : false,
		data : {
			id : $(".biz input[name=id]").val()
		},
		dataType : "json",
		success : function(data){
			if(data.idCheck == 1) {
				$(".biz .idCheckDiv").html("<p style='color: red;'>사용 불가능한 아이디입니다.</p>");
				$(".biz .idCheckDiv").css("display", "block");
			} else {
				$(".biz .idCheckDiv").html("<p style='color: green;'>사용 가능한 아이디입니다.</p>");
				$(".biz .idCheckDiv").css("display", "block");
			}
		}
	 });
}

$('button[name=emailBtn]').on("click", function() {
	const email = $('input[name=userEmail').val() // 이메일 주소값 얻어오기
	const checkInput = $('input[name=emailCheck]') // 인증번호 입력하는곳 
	
	$.ajax({
		type : "get"
		, url : contextPath + "/emailCheck?email=" + email
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