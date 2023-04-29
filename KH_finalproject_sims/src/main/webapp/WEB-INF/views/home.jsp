<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/img/favi/favicon.ico" type="image/x-icon" sizes="16x16">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

	<title>Sims</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/home.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/header.css"/>
    
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
	
		<!-- 맞춤 요금제 div 시작 -->
		<div class="container-fluid d-flex justify-content-center mt-5 choose-plan">
			<a class="aTag" href="<%=request.getContextPath()%>/planfind?queType=telecom">
	       	<div class="row choose-row">
	       		<div class="col-4 text-center align-self-center">
					<i class="fa-solid fa-magnifying-glass-arrow-right fa-5x"></i>
				</div>
	       		<div class="col-8 align-self-center span-div">
	       			<sec:authorize access="isAuthenticated()">
		       			<span>
		       			${username}님께 적합한<br>
		       			맞춤 요금제를 찾아보세요
		       			</span>
		       		</sec:authorize>
	       			<sec:authorize access="isAnonymous()">
		       			<span>
		       			회원님께 적합한<br>
		       			맞춤 요금제를 찾아보세요
		       			</span>
	       			</sec:authorize>
	       		</div>
	       	</div>
	       	</a>
	    </div>
	    <!-- 맞춤 요금제 div 끝 -->
	    
	    <!-- 랭킹 div 시작 -->
		<div class="container-fluid d-flex justify-content-center mt-5 rank-div">
	       	<div class="row justify-content-md-center" style="width: 100%;">
	       		<div class="col-12 rank-main-text text-center align-self-center mb-3">
	       			<span>오늘의 요금제 랭킹</span>
	       		</div>
	       		<div class="d-flex justify-content-center text-center">
		       		<div class="row row-cols-auto justify-content-md-center" style="width: 50%;">
		       			<div class="col select-text" style="font-weight:bold">조회수</div>
		       			<div class="col select-text">찜</div>
		       			<div class="col select-text">가입자</div>
		       		</div>
	       		</div>
	       		
	       		<!-- 조회수 랭킹 -->
	       		<div class="viewRankDiv">
	       		<c:forEach var="viewList" items="${viewRankList}">
	    			<div class="row mt-3 list-div">
	    				<div class="col-8">
	    					<div class="row">
	    						<div class="col-4">
	    							<input class="planNo" type="hidden" value="${viewList.planNo}">
	    						
	       							<img src="<%=request.getContextPath()%>/resources/img/${viewList.bizId}.png" style="max-width: 100px; max-height: 40px;">
	    						</div>
	       						<div class="col-8">
			    					<p class="planName">${viewList.planName}</p>
			    					<div class="planInfo">
				    					<c:if test="${viewList.netNo eq 1}"><p>KT | </p></c:if>
				    					<c:if test="${viewList.netNo eq 2}"><p>SKT | </p></c:if>
				    					<c:if test="${viewList.netNo eq 3}"><p>LGU+ | </p></c:if>
				    					<c:if test="${viewList.genNo eq 1}"><p>5G | </p></c:if>
				    					<c:if test="${viewList.genNo eq 2}"><p>LTE | </p></c:if>
				    					<c:if test="${viewList.genNo eq 4}"><p>3G | </p></c:if>
				    					<p>${viewList.bizName}</p>
			    					</div>
	       						</div>
       						</div>
       						
       						<div class="planData ms-2">
       							<c:if test="${viewList.planData eq 0}">
       								<p>없음</p>
       							</c:if>
       							<c:if test="${viewList.planData ne 0}">
	       							<p>월&nbsp;<p>
			    					<p>
			    					<c:if test="${viewList.planData lt 1000}">
			    					${viewList.planData} MB 
			    					</c:if>
			    					<c:if test="${viewList.planData gt 1000}">
			    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${viewList.planData / 1000}" />
			    					${data} GB
			    					</c:if>
			    					</p>
		    					</c:if>
       						</div>
	    					
	    					<div class="ms-2">
		    					<c:if test="${viewList.planVoice eq 0 and viewList.planMessage eq 0}">
		       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;기본제공&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;기본제공</p>
		    					</c:if>
		    					<c:if test="${viewList.planVoice ne 0 or viewList.planMessage ne 0}">
		       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;${viewList.planVoice}분&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;${viewList.planMessage}건</p>
		    					</c:if>
	    					</div>
	    					
	    				</div>
	    				<div class="d-flex flex-column col-4 mb-2">
	    					<div class="text-end">
	    						<i class="fa-solid fa-star me-2" style="color: #ffdd00;"></i><span>${viewList.bizReviewStar}</span>
	    						<p class="viewCount">${viewList.viewRank}회 조회</p>
	    					</div>
	    					<div class="mt-auto text-end">
		    					<div class="planPrice">
			    					<p>월&nbsp;<p>
			    					<p class="priceText">${viewList.planPrice}</p>
			    					<p>&nbsp;원</p>
		    					</div>
	    					</div>
	    				</div>
	    			</div>
    			</c:forEach>
    			</div>
    			
    			<!-- 찜 랭킹 -->
    			<div class="likeRankDiv" style="display:none">
	       		<c:forEach var="likeList" items="${likeRankList}">
	    			<div class="row mt-3 list-div">
	    				<div class="col-8">
	    					<div class="row">
	    						<div class="col-4">
	    							<input class="planNo" type="hidden" value="${likeList.planNo}">
	    						
	       							<img src="<%=request.getContextPath()%>/resources/img/${likeList.bizId}.png" style="max-width: 100px; max-height: 40px;">
	    						</div>
	       						<div class="col-8">
			    					<p class="planName">${likeList.planName}</p>
			    					<div class="planInfo">
				    					<c:if test="${likeList.netNo eq 1}"><p>KT | </p></c:if>
				    					<c:if test="${likeList.netNo eq 2}"><p>SKT | </p></c:if>
				    					<c:if test="${likeList.netNo eq 3}"><p>LGU+ | </p></c:if>
				    					<c:if test="${likeList.genNo eq 1}"><p>5G | </p></c:if>
				    					<c:if test="${likeList.genNo eq 2}"><p>LTE | </p></c:if>
				    					<c:if test="${likeList.genNo eq 4}"><p>3G | </p></c:if>
				    					<p>${likeList.bizName}</p>
			    					</div>
	       						</div>
       						</div>
       						
       						<div class="planData ms-2">
       							<c:if test="${likeList.planData eq 0}">
       								<p>없음</p>
       							</c:if>
       							<c:if test="${likeList.planData ne 0}">
	       							<p>월&nbsp;<p>
			    					<p>
			    					<c:if test="${likeList.planData lt 1000}">
			    					${likeList.planData} MB 
			    					</c:if>
			    					<c:if test="${likeList.planData gt 1000}">
			    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${likeList.planData / 1000}" />
			    					${data} GB
			    					</c:if>
			    					</p>
		    					</c:if>
       						</div>
	    					
	    					<div class="ms-2">
		    					<c:if test="${likeList.planVoice eq 0 and likeList.planMessage eq 0}">
		       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;기본제공&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;기본제공</p>
		    					</c:if>
		    					<c:if test="${likeList.planVoice ne 0 or likeList.planMessage ne 0}">
		       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;${likeList.planVoice}분&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;${likeList.planMessage}건</p>
		    					</c:if>
	    					</div>
	    					
	    				</div>
	    				<div class="d-flex flex-column col-4 mb-2">
	    					<div class="text-end">
	    						<i class="fa-solid fa-star me-2" style="color: #ffdd00;"></i><span>${likeList.bizReviewStar}</span>
	    						<p class="viewCount">${likeList.likeRank}명 찜</p>
	    					</div>
	    					<div class="mt-auto text-end">
		    					<div class="planPrice ms-2 mt-3">
			    					<p>월&nbsp;<p>
			    					<p class="priceText">${likeList.planPrice}</p>
			    					<p>&nbsp;원</p>
		    					</div>
	    					</div>
	    				</div>
	    			</div>
    			</c:forEach>
    			</div>
    			
    			<!-- 가입자 수 랭킹 -->
    			<div class="orderRankDiv" style="display:none">
	       		<c:forEach var="orderList" items="${orderRankList}">
	    			<div class="row mt-3 list-div">
	    				<div class="col-8">
	    					<div class="row">
	    						<div class="col-4">
	    							<input class="planNo" type="hidden" value="${orderList.planNo}">
	    						
	       							<img src="<%=request.getContextPath()%>/resources/img/${orderList.bizId}.png" style="max-width: 100px; max-height: 40px;">
	    						</div>
	       						<div class="col-8">
			    					<p class="planName">${orderList.planName}</p>
			    					<div class="planInfo">
				    					<c:if test="${orderList.netNo eq 1}"><p>KT | </p></c:if>
				    					<c:if test="${orderList.netNo eq 2}"><p>SKT | </p></c:if>
				    					<c:if test="${orderList.netNo eq 3}"><p>LGU+ | </p></c:if>
				    					<c:if test="${orderList.genNo eq 1}"><p>5G | </p></c:if>
				    					<c:if test="${orderList.genNo eq 2}"><p>LTE | </p></c:if>
				    					<c:if test="${orderList.genNo eq 4}"><p>3G | </p></c:if>
				    					<p>${orderList.bizName}</p>
			    					</div>
	       						</div>
       						</div>
       						
       						<div class="planData ms-2">
       							<c:if test="${orderList.planData eq 0}">
       								<p>없음</p>
       							</c:if>
       							<c:if test="${orderList.planData ne 0}">
	       							<p>월&nbsp;<p>
			    					<p>
			    					<c:if test="${orderList.planData lt 1000}">
			    					${orderList.planData} MB 
			    					</c:if>
			    					<c:if test="${orderList.planData gt 1000}">
			    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${orderList.planData / 1000}" />
			    					${data} GB
			    					</c:if>
			    					</p>
		    					</c:if>
       						</div>
	    					
	    					<div class="ms-2">
		    					<c:if test="${orderList.planVoice eq 0 and orderList.planMessage eq 0}">
		       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;기본제공&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;기본제공</p>
		    					</c:if>
		    					<c:if test="${orderList.planVoice ne 0 or orderList.planMessage ne 0}">
		       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;${orderList.planVoice}분&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;${orderList.planMessage}건</p>
		    					</c:if>
	    					</div>
	    					
	    				</div>
	    				<div class="d-flex flex-column col-4 mb-2">
	    					<div class="text-end">
	    						<i class="fa-solid fa-star me-2" style="color: #ffdd00;"></i><span>${orderList.bizReviewStar}</span>
	    						<p class="viewCount">${orderList.orderCount}명 선택</p>
	    					</div>
	    					<div class="mt-auto text-end">
		    					<div class="planPrice ms-2 mt-3">
			    					<p>월&nbsp;<p>
			    					<p class="priceText">${orderList.planPrice}</p>
			    					<p>&nbsp;원</p>
		    					</div>
	    					</div>
	    				</div>
	    			</div>
    			</c:forEach>
    			</div>
	       	</div>
	    </div>
	    <!-- 랭킹 div 끝 -->
	    
	    <!-- 통신사 이미지 -->
	    <div class="container-fluid d-flex justify-content-center" style="width: 80%; margin-top: 80px;">
		    <div class="row row-cols-auto" style="width: 60%">
		    	<c:forEach items="${bizList}" var="biz">
			    	<div class="col mt-3 my-3">
			    		<a href="${pageContext.request.contextPath}/bizinfo/${biz.bizId}">
				    		<img src="${pageContext.request.contextPath}/resources/img/${biz.bizId}.png" style="max-width: 100px; max-height: 40px;">
			    		</a>
		    		</div>
		    	</c:forEach>
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
	<script src="<%= request.getContextPath() %>/resources/js/main/home.js"></script>
  
</body>
</html>
