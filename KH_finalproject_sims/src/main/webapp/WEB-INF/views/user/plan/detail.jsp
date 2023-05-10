<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> <!-- 채널톡사용 -->
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
	<script src="https://kit.fontawesome.com/faa91ebb6a.js" crossorigin="anonymous"></script>
	
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-sm div-sm">
		
			<!-- 통신사 로고, 요금제명, 찜, 공유 -->
			<div class="row m-3 py-4">
				<div class="col-sm-2 float-sm-none my-auto">
					<a href="${cpath}/bizinfo/${biz.bizId}">
						<img class="logo-m" src="${cpath}/resources/img/${biz.logoRenameFilename}" onerror="this.src='${cpath}/resources/img/${biz.originalFilename}'">
						
					</a>
				</div>
				<div class="col-sm-7 float-sm-none my-auto px-4">
					<h3>${plan.planName}</h3>
				</div>
				<div class="col-sm-3 row">
					<div class="col-6 float-sm-none my-auto">
						<c:choose>
							<c:when test="${like}">
								<a class="like" onclick="toggleLike(${plan.planNo})"> 
									<i class="logo-s-cursor fa-solid fa-heart fa-xl" style="color: #f72b2b;"></i>
								</a>
							</c:when>
							<c:otherwise>
								<a class="like" onclick="toggleLike(${plan.planNo})"> 
									<i class="logo-s-cursor fa-regular fa-heart fa-xl" style="color: #f72b2b;"></i>
								</a>
							</c:otherwise>
						</c:choose>
					</div>
	
					<div class="col-6 float-sm-none my-auto">
						<a class="share" onclick="shareMessage()">
							<i class="logo-s-cursor fa-regular fa-share-from-square fa-xl" style="color: #4b8ef1;"></i>
						</a>
					</div>
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
						<c:if test="${plan.planVoice eq 0}">기본제공</c:if>
						<c:if test="${plan.planVoice ne 0}">${plan.planVoice}분</c:if>
					</h4>
					<h4 class="col-3 fw-semibold">
						<c:if test="${plan.planMessage eq 0}">기본제공</c:if>
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
							<c:if test="${plan.planData eq 0}">없음</c:if>
							<c:if test="${plan.planData ne 0 && plan.planData < 1000}">${plan.planData}MB</c:if>
							<c:if test="${plan.planData >= 1000}">
								<c:set var="dataInGB" value="${plan.planData/1024.0}" />
								<c:set var="dataInGB2" value="${plan.planData/1000.0}" />
								<c:choose>
									<c:when test="${dataInGB % 1 < 0.1}">
							            ${String.format("%.0f", dataInGB)}GB
							        </c:when>
									<c:when test="${dataInGB % 1 == 0.5}">
							            ${String.format("%.1f", dataInGB)}GB
							        </c:when>
							        <c:when test="${dataInGB2 % 1 < 0.1}">
							        	${String.format("%.0f", dataInGB2)}GB
							        </c:when>
							        <c:when test="${dataInGB2 % 1 == 0.5}">
							        	${String.format("%.1f", dataInGB2)}GB
							        </c:when>
									<c:otherwise>
							            ${String.format("%.1f", dataInGB)}GB
							        </c:otherwise>
								</c:choose>
							</c:if>
						</h3>
					</div>
				</div>
				<div class="col-6 text-end mt-auto">
					<span class="fs-4">월 </span>
					<span class="fw-bold fs-3"><fmt:formatNumber value="${plan.planPrice}" pattern="###,###"/></span>
					<span class="fs-4">원</span>
				</div>
			</div>
			
			<!-- 간편 신청 -->
			<button class="btn btn-lg my-4 p-3 w-100" type="button" onclick="location.href='${cpath}/plan/${plan.planNo}/order/terms'" class="btn btn-xl p-3">신청하기</button>
			
			
			<!-- 통신사 간략 -->
			<div class="my-5 card biz-card">
				<div class="card-body">
					<div class="row">
						<div class="col-2">
							<a href="${cpath}/bizinfo/${biz.bizId}">
								<img class="logo-s-cursor" src="${cpath}/resources/img/${biz.logoRenameFilename}" onerror="this.src='${cpath}/resources/img/${biz.originalFilename}'">
							</a>
						</div>
						<div class="col-6 my-auto">
							<a href="${cpath}/bizinfo/${biz.bizId}">
								<span class="fw-bold">
									${plan.bizName}
								</span>
								<span>
									<i class="fa-solid fa-chevron-right"></i>
								</span>
							</a>
						</div>
					</div>
					<table class="mt-3 table-h-30">
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
										<button class="btn-net" disabled="disabled">${biznet}망</button>
									</c:forEach>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
			<!-- 통신사 리뷰 -->
			<div class="my-5 row">
				<h5 class="fw-bold">통신사 리뷰</h5>
				
				<div class="row my-3">
					<div class="col-1">
						<img class="logo-s" src="${cpath}/resources/img/star.png" alt="stars">
					</div>
					<div class="col-1 my-auto">
						<h4 class="fw-bold">${biz.bizReviewStar}</h4>
					</div>
					<div class="col-10 my-auto">
						<a onclick="window.open('${cpath}/bizinfo/${biz.bizId}#biz-review');" style="cursor: pointer">${cntReview}개></a> 
					</div>
				</div>
				<div class="row my-3">
					<c:forEach items="${reviewList}" var="review" begin="0" end="2">
						<div class="col-sm-4">
							<div onclick="window.open('${cpath}/bizinfo/${biz.bizId}#biz-review');" class="card card-review"> 
								<div class="card-body">
									<div class="row mb-3">
										<div class="col-md-5 pe-0" style="padding-right:0;">
											${fn:substring(review.userId,0,3)}
											<c:forEach begin="4" end="7">
											*
											</c:forEach>
										</div>
										<div class="col-md-7 ps-0 text-end">
											<c:forEach var="i" begin="1" end="5">
												<c:choose>
													<c:when test="${review.reviewStar >= (i - 0.5) && review.reviewStar < i}">
														<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
													</c:when>
													<c:when test="${review.reviewStar >= i}">
														<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
													</c:when>
													<c:otherwise>
														<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>
									</div>
									<h6 class="card-text lh-base">
										${review.reviewContent}
									</h6>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- 기본 제공 초과시 -->
			<div class="my-5">
				<h6 class="fw-bold">기본 제공 초과 시</h6>
				<table class="table-h-30 w-100 my-3 table table-borderless text-center table-rd-light">
					<tr class="table-active-bl">
						<td>음성</td>
						<td>문자</td>
						<td>데이터</td>
					</tr>
					<tr>
						<td>${plan.planVoiceOver}원/초</td>
						<td>${plan.planMessageOver}원/건</td>
						<td>${plan.planDataOver}원/MB</td>
					</tr>
				</table>
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
	</script>
	
	<!-- 찜하기 -->
	<script>
	    function toggleLike(planNo) {
	    	<c:if test="${pageContext.request.userPrincipal == null}">
            alert('로그인 후 이용할 수 있습니다.');
            location.href="${cpath}/login";
            return;
        	</c:if>
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
	                    $('.like i').removeClass('fa-regular').addClass('fa-solid');
	                } else if(result == 0){
	                    alert("찜목록에서 제거되었습니다.");
	                    $('.like i').removeClass('fa-solid').addClass('fa-regular');
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
	
	<spring:eval expression="@apikey['apikey.channelIO']" var="channelIO"/><!-- 채널톡 사용 -->
	<script> //채널톡
	  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();
	
	  ChannelIO('boot', {
	    "pluginKey": "<c:out value='${channelIO}' />" //properties 파일에 키
	  });
	</script>

</body>
</html>