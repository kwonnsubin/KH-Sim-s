<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<title>신청페이지 | ${plan.planName} | 심즈</title>
	
	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/plan.css">
	
	<style>

    .input-form {
      max-width: 680px;

      margin-top: 50px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
    
    .btn {
    	width: 200px;
    	border-radius: 30px;
    }
  	</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-sm div-m">

			<div class="row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="pb-2">알뜰폰 신청을 위해<br>약관에 동의해 주세요</h4>
					<form class="userForm validation-form" name="f" novalidate="novalidate">
						<div class="card my-4">
							<div class="card-body">
								<input class="form-check-input all-check" type="checkbox" id="all-check">
								<label class="form-check-label" for="all-check">약관에 모두 동의</label>
							</div>
						</div>

						<h6 class="fw-bolder my-3">심즈 동의 항목</h6>
						<div class="my-3 mx-2">
							<div class="form-check my-2">
								<input class="form-check-input get-personal-check" type="checkbox" value="" id="get-personal-check"> 
								<label class="form-check-label" for="get-personal-check">(필수) 개인정보 수집 및 이용 동의</label>
							</div>
							<div class="form-check my-2">
								<input class="form-check-input give-personal-check" type="checkbox" value="" id="give-personal-check"> 
								<label class="form-check-label" for="give-personal-check">(필수) 개인정보 제3자 제공 동의</label>
							</div>
							<div class="form-check my-2">
								<input class="form-check-input ctl-identi-check" type="checkbox" value="" id="ctl-identi-check"> 
								<label class="form-check-label" for="ctl-identi-check">(필수) 고유식별정보 처리 동의</label>
							</div>
						</div>

						<h6 class="fw-bolder my-3">통신사 동의 항목</h6>
						<div class="my-3 mx-2">
							<div class="form-check my-2">
								<input class="form-check-input biz-mobile-check" type="checkbox" value="" id="biz-mobile-check"> 
								<label class="form-check-label" for="biz-mobile-check">(필수) 모바일 서비스 이용약관</label>
							</div>
							<div class="form-check my-2">
								<input class="form-check-input biz-get-personal-check" type="checkbox" value="" id="biz-get-personal-check"> 
								<label class="form-check-label" for="biz-get-personal-check">(필수) 개인정보 수집 및 이용 동의</label>
							</div>
							<div class="form-check my-2">
								<input class="form-check-input biz-give-personal-check" type="checkbox" value="" id="biz-give-personal-check"> 
								<label class="form-check-label" for="biz-give-personal-check">(필수) 개인정보 제3자 정보제공 동의</label>
							</div>
							<div class="form-check my-2">
								<input class="form-check-input biz-ctl-identi-check" type="checkbox" value="" id="biz-ctl-identi-check"> 
								<label class="form-check-label" for="biz-ctl-identi-check">(필수) 고유식별정보 처리 동의</label>
							</div>
						</div>

						<div class="alert-div mb-3 text-center" style="display: none;"></div>

						<div class="row btn_confirm text-center">
							<div class="col">
								<button class="btn next-btn" type="button">다음</button>
							</div>
						</div>

					</form>
				</div>
			</div>


		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	
	<script type="text/javascript">
	
	function getContextPath() {
    	var hostIndex = location.href.indexOf(location.host) + location.host.length;
    	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
    }

    var contextPath = getContextPath();
	
    $(document).ready(function() {
    	
    	$('.all-check').on('change', function() {
    		if($('.all-check').is(':checked')) {
	    		$('.get-personal-check').prop('checked', true);
	    		$('.give-personal-check').prop('checked', true);
	    		$('.ctl-identi-check').prop('checked', true);
	    		$('.biz-mobile-check').prop('checked', true);
	    		$('.biz-get-personal-check').prop('checked', true);
	    		$('.biz-give-personal-check').prop('checked', true);
	    		$('.biz-ctl-identi-check').prop('checked', true);
    		} else {
	    		$('.get-personal-check').prop('checked', false);
	    		$('.give-personal-check').prop('checked', false);
	    		$('.ctl-identi-check').prop('checked', false);
	    		$('.biz-mobile-check').prop('checked', false);
	    		$('.biz-get-personal-check').prop('checked', false);
	    		$('.biz-give-personal-check').prop('checked', false);
	    		$('.biz-ctl-identi-check').prop('checked', false);
    		}
    	});
    	
    	$('.get-personal-check').on('click', function() {
    		if($('.get-personal-check').is(':checked') == true 
    				&& $('.give-personal-check').is(':checked') == true 
    				&& $('.ctl-identi-check').is(':checked') == true 
    				&& $('.biz-mobile-check').is(':checked') == true 
    				&& $('.biz-get-personal-check').is(':checked') == true 
    				&& $('.biz-give-personal-check').is(':checked') == true 
    				&& $('.biz-ctl-identi-check').is(':checked') == true 
    				) {
    			$('.all-check').prop('checked', true);
    		} else {
	    		$('.all-check').prop('checked', false);
    		}
    	});
    	
    	$('.give-personal-check').on('click', function() {
    		if($('.get-personal-check').is(':checked') == true 
    				&& $('.give-personal-check').is(':checked') == true 
    				&& $('.ctl-identi-check').is(':checked') == true 
    				&& $('.biz-mobile-check').is(':checked') == true 
    				&& $('.biz-get-personal-check').is(':checked') == true 
    				&& $('.biz-give-personal-check').is(':checked') == true 
    				&& $('.biz-ctl-identi-check').is(':checked') == true 
    				) {
    			$('.all-check').prop('checked', true);
    		} else {
	    		$('.all-check').prop('checked', false);
    		}
    	});
    	
    	$('.ctl-identi-check').on('click', function() {
    		if($('.get-personal-check').is(':checked') == true 
    				&& $('.give-personal-check').is(':checked') == true 
    				&& $('.ctl-identi-check').is(':checked') == true 
    				&& $('.biz-mobile-check').is(':checked') == true 
    				&& $('.biz-get-personal-check').is(':checked') == true 
    				&& $('.biz-give-personal-check').is(':checked') == true 
    				&& $('.biz-ctl-identi-check').is(':checked') == true 
    				) {
    			$('.all-check').prop('checked', true);
    		} else {
	    		$('.all-check').prop('checked', false);
    		}
    	});
    	
    	$('.biz-mobile-check').on('click', function() {
    		if($('.get-personal-check').is(':checked') == true 
    				&& $('.give-personal-check').is(':checked') == true 
    				&& $('.ctl-identi-check').is(':checked') == true 
    				&& $('.biz-mobile-check').is(':checked') == true 
    				&& $('.biz-get-personal-check').is(':checked') == true 
    				&& $('.biz-give-personal-check').is(':checked') == true 
    				&& $('.biz-ctl-identi-check').is(':checked') == true 
    				) {
    			$('.all-check').prop('checked', true);
    		} else {
	    		$('.all-check').prop('checked', false);
    		}
    	});
    	
    	$('.biz-get-personal-check').on('click', function() {
    		if($('.get-personal-check').is(':checked') == true 
    				&& $('.give-personal-check').is(':checked') == true 
    				&& $('.ctl-identi-check').is(':checked') == true 
    				&& $('.biz-mobile-check').is(':checked') == true 
    				&& $('.biz-get-personal-check').is(':checked') == true 
    				&& $('.biz-give-personal-check').is(':checked') == true 
    				&& $('.biz-ctl-identi-check').is(':checked') == true 
    				) {
    			$('.all-check').prop('checked', true);
    		} else {
	    		$('.all-check').prop('checked', false);
    		}
    	});
    	
    	$('.biz-give-personal-check').on('click', function() {
    		if($('.get-personal-check').is(':checked') == true 
    				&& $('.give-personal-check').is(':checked') == true 
    				&& $('.ctl-identi-check').is(':checked') == true 
    				&& $('.biz-mobile-check').is(':checked') == true 
    				&& $('.biz-get-personal-check').is(':checked') == true 
    				&& $('.biz-give-personal-check').is(':checked') == true 
    				&& $('.biz-ctl-identi-check').is(':checked') == true 
    				) {
    			$('.all-check').prop('checked', true);
    		} else {
	    		$('.all-check').prop('checked', false);
    		}
    	});
    	
    	$('.biz-ctl-identi-check').on('click', function() {
    		if($('.get-personal-check').is(':checked') == true 
    				&& $('.give-personal-check').is(':checked') == true 
    				&& $('.ctl-identi-check').is(':checked') == true 
    				&& $('.biz-mobile-check').is(':checked') == true 
    				&& $('.biz-get-personal-check').is(':checked') == true 
    				&& $('.biz-give-personal-check').is(':checked') == true 
    				&& $('.biz-ctl-identi-check').is(':checked') == true 
    				) {
    			$('.all-check').prop('checked', true);
    		} else {
	    		$('.all-check').prop('checked', false);
    		}
    	});
    	
    	$('.next-btn').on('click', function() {
    		if($('.all-check').is(':checked') == true) {
    			$(".alert-div").html("");
				$(".alert-div").css("display", "none");
	    		location.href = contextPath + "/plan/${plan.planNo}/order/option";
    		} else {
    			$(".alert-div").html("<p style='color: red;'>회원가입약관의 내용에 동의하셔야 신청하실 수 있습니다.</p>");
				$(".alert-div").css("display", "block");
    		}
    	});
    });
	
	</script>
</body>
</html>