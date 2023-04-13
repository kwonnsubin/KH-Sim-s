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
	
	<title>[${plan.bizName}] ${plan.planName} | ${plan.planPrice}원 | 심즈</title>

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
		
		
			<!-- 통신사 로고, 요금제명, 찜, 공유 -->
			<div class="row">
				<div class="col-sm-2 float-sm-none mt-5">
					<a href="#" class="logo"> <!-- 통신사 페이지 만들어서 연결 -->
						<img src="${cpath}/resources/img/${biz.logoRenameFilename}" alt="${plan.bizName }">
					</a>
				</div>
				<div class="col-sm-6 float-sm-none mt-5">
					<h3>${plan.planName}</h3>
				</div>
				<div class="col-sm-2 float-sm-none mt-5">
					<a class="like" href="#"> <!-- 찜 기능 구현 -->
						<img alt="like" src="" class="w-100">
					</a>
				</div>
				<div class="col-sm-2 float-sm-none mt-5">
					<a class="share" href="#"> <!-- 공유 기능 구현 -->
						<img alt="share" src="" class="w-100" >
					</a>
				</div>
			</div>
			<hr>
			
			<!-- 통화량, 문자량, 통신망, 통신기술 -->
			<div class="m-4 py-3 text-sm-center">
				<div class="row">
					<p class="col-3">통화</p>
					<p class="col-3">문자</p>
					<p class="col-3">통신망</p>
					<p class="col-3">통신기술</p>
				</div>
				<div class="row pt-2">
					<h4 class="col-3 fw-semibold">
						<c:if test="${plan.planVoice eq 0}">무제한</c:if>
						<c:if test="${plan.planVoice ne 0}">${plan.planVoice}분</c:if>
					</h4>
					<h4 class="col-3 fw-semibold">
						<c:if test="${plan.planMessage eq 0}">무제한</c:if>
						<c:if test="${plan.planMessage ne 0}">${plan.planMessage}건</c:if>
					</h4>
					<h4 class="col-3 fw-semibold">${plan.netName}망</h4>
					<h4 class="col-3 fw-semibold">${plan.genName}</h4>
				</div>
			</div>
			<hr>
			
			<!-- 데이터량, 가격 -->
			<div class="m-4 py-3 row">
				<div class="col-8">
					<div class="row">
						<p class="text-sm-center">데이터</p>
					</div>
					<div class="row">
						<h3 class="fw-bolder text-sm-center">
							<c:if test="${plan.planData eq 0}">무제한</c:if>
							<c:if test="${plan.planData ne 0}">${plan.planData}MB</c:if>
						</h3>
					</div>
				</div>
				<div class="col-4 text-end">
					<h4>월 ${plan.planPrice}원</h4>
				</div>
			</div>
			
			<!-- 통신사 문의, 간편 신청 -->
			<div class="card-group">
				<div class="card text-center">
					<div class="card-body">
						<h5><a href="#">통신사 문의</a></h5>
					</div>
				</div>
				<div class="card text-center">
					<div class="card-body">
						<h5><a href="#">간편 신청</a></h5>
					</div>
				</div>
			</div>
			
			<!-- 통신사 간략 -->
			<div class="mt-5 card">
				<div class="row card-body">
					<div class="col-1">
						<a href="#" class="logo"> <!-- 통신사 페이지 만들어서 연결 -->
							<img src="${cpath}/resources/img/${biz.logoRenameFilename}" alt="${plan.bizName}" style="max-width: 70px;">
						</a>
					</div>
					<div class="col-6">
						<a href="#" class="logo"> <!-- 통신사 페이지 만들어서 연결 -->
							${plan.bizName}>
						</a>
					</div>
				</div>
				<div class="card-body">
					<table>
						<tr>
							<td width="250px">개통 소요 시간</td>
							<td>평균 ${biz.phoneOpTime}일</td>
						</tr>
						<tr>
							<td>개통 소요 시간(유심 보유 시)</td>
							<td>평균 ${biz.phoneOpTimeUsim}일</td>
						</tr>
						<tr>
							<td>지원 통신망</td>
							<td>
								<c:if test="${not empty bizNets}">
									<c:forEach items="${bizNets}" var="biznet">
										<button>${biznet}망</button>
									</c:forEach>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			
			<!-- 통신사 리뷰 -->
			<div class="">
				<h5>통신사 리뷰</h5>
				
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
	
</body>
</html>