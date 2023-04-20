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
	
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-sm div-m">
			<div class="row">
				<div class="col-sm-4 mt-5">
					<h4 class="m-3 text-center">요금제 정보</h4>
					<table class="table table-bordered">
						<tr>
							<td>요금제명</td> 
							<td>${plan.planName }</td>
						</tr>
						<tr>
							<td>통신사</td>
							<td>${plan.bizName }</td>
						</tr>
						<tr>
							<td>통신망</td>
							<td>${plan.netName }</td>
						</tr>
						<tr>
							<td>데이터</td>
							<td>${plan.planData }</td>
						</tr>
						<tr>
							<td>음성</td>
							<td>${plan.planVoice }</td>
						</tr>
						<tr>
							<td>메시지</td>
							<td>${plan.planMessage }</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-8 mt-5">
					<h4 class="m-3 text-center">가입 조건 선택</h4>
					<form id="option" action="${cpath}/plan/${plan.planNo}/order">
						<div class="card">
							<div class="card-body">
								<table class="w-100">
									<tr>
										<td style="width: 30%">가입유형</td>
										<td>
											<input type="radio" class="btn-check" name="join-category" value="1" id="change-num" autocomplete="off">
											<label class="btn btn-sm btn-outline-secondary" for="change-num">번호이동</label>
											
											<input type="radio" class="btn-check" name="join-category" value="2" id="new-num" autocomplete="off">
											<label class="btn btn-sm btn-outline-secondary" for="new-num">신규가입</label>
										</td>
									</tr>
									<tr>
										<td>유심보유</td>
										<td>
											<input type="radio" class="btn-check" name="sim-yn" value="1" id="no-sim" autocomplete="off">
											<label class="btn btn-sm btn-outline-secondary" for="no-sim">없어요(택배 요청)</label>
											
											<input type="radio" class="btn-check" name="sim-yn" value="2" id="yes-sim" autocomplete="off">
											<label class="btn btn-sm btn-outline-secondary" for="yes-sim">가지고 있어요</label>
										</td>
									</tr>
									<tr>
										<td>유심유형</td>
										<td>
											<input type="radio" class="btn-check" name="sim-type" value="1" id="usim" autocomplete="off">
											<label class="btn btn-sm btn-outline-secondary" for="usim">일반유심</label>
											
											<input type="radio" class="btn-check" name="sim-type" value="2" id="nfc-sim" autocomplete="off">
											<label class="btn btn-sm btn-outline-secondary" for="nfc-sim">NFC유심</label>
										</td>
									</tr>
								</table>
							</div>
						</div>
						
						<div class="card">
							<div class="card-body">
								<table style="width: 100%">
									<tr style="width: 100%">
										<td style="width: 50%">월 납부총액(VAT 포함)</td>
										<td class="text-end" width="150">${plan.planPrice }원</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="text-end">
							<input class="btn btn-primary" type="submit" value="구매신청">
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

	<script>
	const form = document.getElementById("option");

	form.addEventListener("submit", (event) => {
	  event.preventDefault(); // 폼 제출 방지

	  const selectedJoinCategory = document.querySelector('input[name="join-category"]:checked').value;
	  const selectedSimYn = document.querySelector('input[name="sim-yn"]:checked').value;
	  const selectedSimType = document.querySelector('input[name="sim-type"]:checked').value;

	  sessionStorage.setItem('joinCategory', selectedJoinCategory);
	  sessionStorage.setItem('simYn', selectedSimYn);
	  sessionStorage.setItem('simType', selectedSimType);
	  
	  console.log(sessionStorage.getItem('joinCategory'));
	  console.log(sessionStorage.getItem('simYn'));
	  console.log(sessionStorage.getItem('simType'));
	  
	  const planNo = "${plan.planNo}";
	  location.href = '${cpath}/plan/${planNo}/order?joinCategory=${selectedJoinCategory}&simYn=${selectedSimYn}&simType=${selectedSimType}';
	});
	
	</script>
</body>
</html>