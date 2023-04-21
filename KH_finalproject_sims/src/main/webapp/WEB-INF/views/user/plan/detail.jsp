<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div class="row m-3 py-4">
				<div class="col-sm-2 float-sm-none">
					<a href="#"> <!-- 통신사 페이지 만들어서 연결 -->
						<img class="logo-m" src="${cpath}/resources/img/${biz.bizId}.png" alt="${plan.bizName}">
					</a>
				</div>
				<div class="col-sm-7 float-sm-none vertical-center px-4">
					<h3>${plan.planName}</h3>
				</div>
				<div class="col-2 float-sm-none vertical-center">
					<c:set var="cpath" value="${pageContext.request.contextPath }" />
					<a class="like" onclick="toggleLike(${plan.planNo})"> 
						<img class="logo-s float-end" src="${cpath}/resources/img/like.png" alt="like">
					</a>
				</div>

				<div class="col-1 float-sm-none vertical-center">
					<a class="share" onclick="shareMessage()">
						<img src="${cpath}/resources/img/share.png" alt="카카오톡 공유 보내기 버튼" />
					</a>
				</div>
			</div>
			<hr>
			
			<!-- 통화량, 문자량, 통신망, 통신기술 -->
			<div class="m-3 py-4 text-sm-center">
				<div class="row">
					<p class="col-3">통화</p>
					<p class="col-3">문자</p>
					<p class="col-3">통신망</p>
					<p class="col-3">통신기술</p>
				</div>
				<div class="row">
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
			<div class="m-3 row">
				<div class="col-6">
					<p class="text-sm-center">데이터</p>
					<div class="row">
						<h3 class="fw-bolder text-sm-center">
							<c:if test="${plan.planData eq 0}">무제한</c:if>
							<c:if test="${plan.planData ne 0 && plan.planData < 1024}">${plan.planData}MB</c:if>
							<c:if test="${plan.planData >= 1024}">
								<c:set var="dataInGB" value="${plan.planData/1024.0}" />
								<c:choose>
									<c:when test="${dataInGB % 1 == 0}">
							            ${dataInGB}GB
							        </c:when>
									<c:otherwise>
							            ${String.format("%.1f", dataInGB)}GB
							        </c:otherwise>
								</c:choose>
							</c:if>
						</h3>
					</div>
				</div>
				<div class="col-6 text-end vertical-center">
					<span class="fs-4">월</span>
					<span class="fw-bold fs-3">${plan.planPrice}</span>
					<span class="fs-4">원</span>
				</div>
			</div>
			
			<!-- 통신사 문의, 간편 신청 -->
			<div class="card-group my-5">
				<div class="card text-center bg-primary">
					<div class="card-body">
						<h5><a class="text-white" href="#">통신사 문의</a></h5>
					</div>
				</div>
				<div class="card text-center bg-primary">
					<div class="card-body">
						<h5><a class="text-white" href="${cpath}/plan/${plan.planNo}/order/terms">신청하기</a></h5>
					</div>
				</div>
			</div>

			<!-- 통신사 간략 -->
			<div class="my-5 card biz-card">
				<div class="card-body">
					<div class="row">
						<div class="col-2">
							<a href="#"> <!-- 통신사 페이지 만들어서 연결 -->
								<img class="logo-s" src="${cpath}/resources/img/${biz.bizId}.png" alt="${plan.bizName}">
							</a>
						</div>
						<div class="col-6 vertical-center">
							<a href="#"> <!-- 통신사 페이지 만들어서 연결 -->
								${plan.bizName}>
							</a>
						</div>
					</div>
					<table class="mt-2">
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
										<button class="btn-net">${biznet}망</button>
									</c:forEach>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<!-- 통신사 리뷰 -->
			<div class="my-3">
				<div class="row">
					<h5 class="mb-3 fw-bold">통신사 리뷰</h5>
					
					<div class="row my-3">
						<div class="col-1">
							<img class="logo-s" src="${cpath}/resources/img/star.png" alt="stars">
						</div>
						<div class="col-1 vertical-center">
							<h4>${biz.bizReviewStar}</h4>
						</div>
						<div class="col-10 vertical-center">
							<a href="#">${cntReview}개></a> <!-- 통신사 리뷰 모달 띄우기 / 통신사 리뷰 페이지 이동-->
						</div>
					</div>
					<div class="row my-3">
						<c:forEach items="${reviewList}" var="review" begin="0" end="2">
							<div class="col-sm-4">
								<div class="card" style="min-height: 150px;"> <!-- 클릭하면 통신사 리뷰 모달 / 통신사 리뷰 페이지 이동-->
									<div class="card-body">
										<div class="row mb-3">
											<div class="col-sm-7" style="padding-right:0;">
												${fn:substring(review.userId,0,3)}
												<c:forEach begin="4" end="${fn:length(review.userId)}">
												*
												</c:forEach>
												<span class="small"><fmt:formatDate value="${review.reviewDate}" pattern="yy.MM.dd"/></span>
											</div>
											<div class="col-sm-4 text-end px-0">
												${review.reviewStar } <!-- 별점 표현 -->
											</div>
										</div>
										<h6 class="card-text">${review.reviewContent}</h6>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
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

	<!-- 카카오톡 공유하기 -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
		integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
		crossorigin="anonymous"></script>
	<script>
		Kakao.init('61dec1e850d6a4addfc3a6accea9966a'); 

		function shareMessage() {
			var no = '${plan.planNo}';
			var title = '[${plan.bizName}] ${plan.planName} | ${plan.planPrice}원';
			var msg = '통화 ${plan.planVoice}분 | 문자 ${plan.planMessage}건 | 데이터 ${plan.planData}MB';
			Kakao.Share.sendCustom({
				templateId: 92691,
				templateArgs: {
					planno: no,
					plantitle: title,
					planmsg: msg,
				}
			});
		}
		
	    function toggleLike(planNo) {
	        $.ajax({
	            url: '${cpath}/plan/${plan.planNo}/like',
	            type: 'POST',
	            dataType: 'json',
	            data: {
	                planNo: planNo
	            },
	            success: function(result) {
	            	console.log(result);
	                if (result  == 1) {
	                    alert("찜목록에 추가되었습니다.");
	                } else if(result == 0){
	                    alert("찜목록에서 제거되었습니다.");
	                } 
	            },
	            error: function(xhr, status, error) {
	                console.log("xhr.status: " + xhr.status);
	                console.log("xhr.statusText: " + xhr.statusText);
	                console.log("xhr.responseText: " + xhr.responseText);
	                console.log("xhr.readyState: " + xhr.readyState);
	            }
	        });
	    }

	</script>

</body>
</html>