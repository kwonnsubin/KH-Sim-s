<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/telinfo.css"/>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	<section style="margin-top: 50px;">
		<div class="container-fluid d-flex justify-content-center info-div">
	       	<div class="row align-self-center info-row">
	       		<div class="col">
	       			<div>
	       				<div class="my-3">
	       					<c:if test="${bizInfo.bizId eq 'idowell'}">
       							<img src="<%=request.getContextPath()%>/resources/img/${bizInfo.bizId}.jpg" style="max-width: 100px; height: 40px;">
       						</c:if>
       						<c:if test="${bizInfo.bizId ne 'idowell'}">
       							<img src="<%=request.getContextPath()%>/resources/img/${bizInfo.bizId}.png" style="max-width: 100px; height: 40px;">
       						</c:if>
	       				</div>
	       				<div class="row row-cols-auto">
	       					<div class="col align-self-center">
		       					<h4 style="font-weight: bold;">${bizInfo.bizName}</h4>
	       					</div>
	       					<div class="col align-self-center">
	       						<i class="fa-solid fa-star me-2" style="color: #ffdd00;"></i>
	       						<span class="me-2" style="font-weight: bold;">${bizInfo.bizReviewStar}</span>
	       						<span style="font-weight: bold; color: #aaaaaa">${bizInfo.bizReviewCnt}개 <i class="fa-solid fa-chevron-right" style="color: #aaaaaa;"></i></span>
	       					</div>
	       				</div>
	       			</div>
	       			<div class="my-5">
	       				<div class="row row-cols-auto">
	       					<div class="col align-self-center me-3">
		       					<p style="font-weight: bold; font-size: 14px; color: #afafaf;">지원 통신망</p>
	       					</div>
	       					<div class="col align-self-center mx-2 net-text" style="display:none;">
       							<p>KT망</p>
	       					</div>
	       					<div class="col align-self-center mx-2 net-text" style="display:none;">
       							<p>SKT망</p>
	       					</div>
	       					<div class="col align-self-center mx-2 net-text" style="display:none;">
       							<p>LGU+망</p>
	       					</div>
	       				</div>
	       			</div>
	       			<div>
	       				<div class="row row-cols-auto">
	       					<div class="col mb-3">
		       					<p style="font-weight: bold; font-size: 14px; color: #aaaaaa; padding-right:38px;">개통 소요시간</p>
	       					</div>
	       					<fmt:formatNumber var="time" type="number" maxFractionDigits="0" value="${24 * bizInfo.phoneOpTime}" />
	       					<div class="col">
		       					<p>평균 ${time}시간</p>
	       					</div>
	       				</div>
	       				<div class="row row-cols-auto">
	       					<div class="col">
		       					<p style="font-weight: bold; font-size: 14px; color: #aaaaaa;">개통 소요시간(유심)</p>
	       					</div>
	       					<fmt:formatNumber var="timeUsim" type="number" maxFractionDigits="0" value="${24 * bizInfo.phoneOpTimeUsim}" />
	       					<div class="col">
		       					<p>평균 ${timeUsim}시간</p>
	       					</div>
	       				</div>
	       			</div>
	       			<div class="mt-5">
	       				<div class="row row-cols-auto justify-content-md-center menu-div">
	       					<div class="col mx-5 menu-text">기본정보</div>
	       					<div class="col mx-5 menu-text">요금제</div>
	       					<div class="col mx-5 menu-text">리뷰 <span style="font-weight: bold; color: #aaaaaa">${bizInfo.bizReviewCnt}</span></div>
	       				</div>
	       			</div>
	       			<div class="mt-5">
	       				<div class="ms-3 mb-3">
	       					<p style="font-size: 20px; font-weight: bold;">영업시간</p>
	       				</div>
	       				<div class="row biz-time">
	       					<div class="col align-self-center ms-3">
	       						<p style="font-size: 14px;">영업시간</p>
	       						<p style="font-size: 16px;">평일 ${bizInfo.bizBeginTime} - ${bizInfo.bizEndTime}</p>
	       					</div>
	       					<c:if test="${not empty bizInfo.bizClosedDay}">
	       					<div class="col align-self-center ms-3">
	       						<p style="font-size: 14px; color:red;">휴무일</p>
	       						<p style="font-size: 16px;">${bizInfo.bizClosedDay} 휴무</p>
	       					</div>
	       					</c:if>
	       				</div>
	       			</div>
	       			<div class="mt-5">
	       				<div class="ms-3 mb-3">
	       					<p style="font-size: 20px; font-weight: bold;">고객센터 번호</p>
	       				</div>
	       				<div class="row">
	       					<c:forEach var="serPh" items="${bizService}">
		       					<c:if test="${not empty serPh.bizNetService}">
			       					<div class="col align-self-center ms-3">
			       						<c:if test="${serPh.netNo eq 1}"> <p style="font-size: 14px;">KT망</p> </c:if>
			       						<c:if test="${serPh.netNo eq 2}"> <p style="font-size: 14px;">SKT망</p> </c:if>
			       						<c:if test="${serPh.netNo eq 3}"> <p style="font-size: 14px;">LGU+망</p> </c:if>
			       						<p style="font-size: 16px;">${serPh.bizNetService}</p>
			       					</div>
		       					</c:if>
	       					</c:forEach>
	       				</div>
	       			</div>
	       			<div class="mt-5">
	       				<div class="ms-3 mb-3">
	       					<p style="font-size: 20px; font-weight: bold;">위치</p>
	       				</div>
	       				<div class="ms-3">
	       					<i class="fa-solid fa-location-dot me-2"></i>
	       					<p style="font-size: 16px; display:inline;">${bizInfo.bizLocation}</p>
	       				</div>
	       			</div>
	       			<div class="mt-5">
	       				<div class="ms-3 mb-3">
	       					<p style="font-size: 20px; font-weight: bold;">결제 정보</p>
	       				</div>
	       				<div class="row">
	       					<div class="col align-self-center ms-3">
	       						<p style="font-size: 14px;">카드</p>
	       						<p style="font-size: 16px;">매월 ${bizInfo.bizCardPayDate} 일</p>
	       					</div>
	       					<div class="col align-self-center ms-3">
	       						<p style="font-size: 14px;">계좌 이체</p>
	       						<p style="font-size: 16px;">매월 ${bizInfo.bizAccPayDate} 일</p>
	       					</div>
	       				</div>
	       			</div>
	       			
	       			<div class="mt-5">
	       				<div class="ms-3 mb-3">
	       					<p style="font-size: 20px; font-weight: bold;">${bizInfo.bizName} 요금제</p>
	       				</div>
	       				<div>
	       					<c:forEach var="list" items="${planList}">
				    			<div class="row mt-3 list-div">
				    				<div class="col-8">
				    					<div class="row">
				    						<div class="col-4">
				    							<input class="planNo" type="hidden" value="${list.planNo}">
				    						
						    					<c:if test="${list.bizId eq 'idowell'}">
					       							<img src="<%=request.getContextPath()%>/resources/img/${list.bizId}.jpg" style="max-width: 100px; height: 40px;">
					       						</c:if>
					       						<c:if test="${list.bizId ne 'idowell'}">
					       							<img src="<%=request.getContextPath()%>/resources/img/${list.bizId}.png" style="max-width: 100px; height: 40px;">
					       						</c:if>
				    						</div>
				       						<div class="col-8">
						    					<p class="planName">${list.planName}</p>
						    					<div class="planInfo">
							    					<c:if test="${list.netNo eq 1}"><p>KT | </p></c:if>
							    					<c:if test="${list.netNo eq 2}"><p>SKT | </p></c:if>
							    					<c:if test="${list.netNo eq 3}"><p>LGU+ | </p></c:if>
							    					<c:if test="${list.genNo eq 1}"><p>5G | </p></c:if>
							    					<c:if test="${list.genNo eq 2}"><p>LTE | </p></c:if>
							    					<c:if test="${list.genNo eq 4}"><p>3G | </p></c:if>
							    					<p>${list.bizName}</p>
						    					</div>
				       						</div>
			       						</div>
			       						
			       						<div class="planData ms-2">
			       							<p>월&nbsp;<p>
					    					<p>
					    					<c:if test="${list.planData lt 1000}">
					    					${list.planData} MB 
					    					</c:if>
					    					<c:if test="${list.planData gt 1000}">
					    					<fmt:formatNumber var="viewdata" type="number" maxFractionDigits="1" value="${list.planData / 1000}" />
					    					${viewdata} GB
					    					</c:if>
					    					</p>
			       						</div>
				    					
				    					<div class="ms-2">
					    					<c:if test="${list.planVoice eq 0 and list.planMessage eq 0}">
					       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;기본제공&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;기본제공</p>
					    					</c:if>
					    					<c:if test="${list.planVoice ne 0 or list.planMessage ne 0}">
					       						<p class="voiMes"><i class="fa-solid fa-phone"></i>&nbsp;&nbsp;${list.planVoice}분&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-envelope"></i>&nbsp;&nbsp;${list.planMessage}건</p>
					    					</c:if>
				    					</div>
				    					
				    				</div>
				    				<div class="col-4 row mb-2">
				    					<div class="text-end">
				    						<i class="fa-solid fa-star me-2" style="color: #ffdd00;"></i><span>${list.bizReviewStar}</span>
				    						<p class="viewCount">${list.orderCount}명 선택</p>
				    					</div>
				    					<div class="text-end align-self-end">
					    					<div class="planPrice">
						    					<p>월&nbsp;<p>
						    					<p class="priceText">${list.planPrice}</p>
						    					<p>&nbsp;원</p>
					    					</div>
				    					</div>
				    				</div>
				    			</div>
			    			</c:forEach>
	       				</div>
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
  <script src="<%= request.getContextPath() %>/resources/js/main/telinfo.js"></script>
  
  <script>
  	$(document).ready(function() {
  		var st = "${bizInfo.network}";
		var network = st.split(',');
		for(var i = 0; i < network.length; i++) {
			if(network[i] == 'KT망') {
				$('.net-text').eq(0).css('display', '');
			} else if(network[i] == 'SK망') {
				$('.net-text').eq(1).css('display', '');
			} else if(network[i] == 'LG망') {
				$('.net-text').eq(2).css('display', '');
			}
		}
  	});
  </script>
  
  
</body>
</html>