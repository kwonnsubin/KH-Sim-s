<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
	       		<div class="col col-height">
	       			<div>
	       				<div class="my-3">
  							<img src="<%=request.getContextPath()%>/resources/img/${bizInfo.bizId}.png" style="max-width: 100px; height: 40px;">
	       				</div>
	       				<div class="row row-cols-auto">
	       					<div class="col align-self-center">
		       					<h4 style="font-weight: bold;">${bizInfo.bizName}</h4>
	       					</div>
	       					<div class="col align-self-center">
	       						<i class="fa-solid fa-star me-2" style="color: #ffdd00;"></i>
	       						<span class="me-2" style="font-weight: bold;">${bizInfo.bizReviewStar}</span>
	       						<span class="review-cnt" style="font-weight: bold; color: #aaaaaa; cursor:pointer">${bizInfo.bizReviewCnt}개 <i class="fa-solid fa-chevron-right" style="color: #aaaaaa;"></i></span>
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
	       			
	       			<div class="mt-3 pt-3 menu-div">
	       				<div class="row row-cols-auto justify-content-md-center">
	       					<div class="col mx-5 menu-text">기본정보</div>
	       					<div class="col mx-5 menu-text">요금제</div>
	       					<div class="col mx-5 menu-text">리뷰 <span style="font-weight: bold; color: #aaaaaa">${bizInfo.bizReviewCnt}</span></div>
	       				</div>
	       			</div>
	       			
	       			<div class="mt-5" id="basic-info">
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
	       			
	       			<div class="mt-5" id="biz-plans">
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
				    						
				       							<img src="<%=request.getContextPath()%>/resources/img/${list.bizId}.png" style="max-width: 100px; height: 40px;">
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
			       							<c:if test="${list.planData eq 0}">
			       								<p>없음</p>
			       							</c:if>
			       							<c:if test="${list.planData ne 0}">
				       							<p>월&nbsp;<p>
						    					<p>
						    					<c:if test="${list.planData lt 1000}">
						    					${list.planData} MB 
						    					</c:if>
						    					<c:if test="${list.planData gt 1000}">
						    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${list.planData / 1000}" />
						    					${data} GB
						    					</c:if>
						    					</p>
					    					</c:if>
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
       				<div class="row mt-3 plan-plus">
   						<div class="col align-self-center text-center">
   							요금제 더보기
	    				</div>
	    			</div>
	       			
	       			<div class="mt-5" id="biz-review">
	       				<div class="ms-3 mb-3">
	       					<p style="font-size: 20px; font-weight: bold;">리뷰</p>
	       				</div>
	       				<div class="ms-3">
	       					<div class="mb-5">
	       						<span class="me-2" style="font-weight: bold; font-size: 26px;">${bizInfo.bizReviewStar}</span>
	       						<c:if test="${bizInfo.bizReviewStar gt 0 and bizInfo.bizReviewStar le 0.5}">
									<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       							</c:if>
       							<c:if test="${bizInfo.bizReviewStar gt 0.5 and bizInfo.bizReviewStar lt 1}">
									<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       							</c:if>
       							<c:if test="${bizInfo.bizReviewStar gt 1 and bizInfo.bizReviewStar lt 1.5}">
									<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       							</c:if>
       							<c:if test="${bizInfo.bizReviewStar gt 1.5 and bizInfo.bizReviewStar lt 2}">
									<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       							</c:if>
       							<c:if test="${bizInfo.bizReviewStar gt 2 and bizInfo.bizReviewStar lt 2.5}">
									<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       							</c:if>
       							<c:if test="${bizInfo.bizReviewStar gt 2.5 and bizInfo.bizReviewStar lt 3}">
									<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       							</c:if>
       							<c:if test="${bizInfo.bizReviewStar gt 3 and bizInfo.bizReviewStar lt 3.5}">
									<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       							</c:if>
       							<c:if test="${bizInfo.bizReviewStar gt 3.5 and bizInfo.bizReviewStar lt 4}">
									<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
       							</c:if>
       							<c:if test="${bizInfo.bizReviewStar gt 4 and bizInfo.bizReviewStar lt 4.5}">
									<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
       							</c:if>
       							<c:if test="${bizInfo.bizReviewStar gt 4.5 and bizInfo.bizReviewStar lt 5}">
									<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
       							</c:if>
	       						<span style="font-weight: bold; color: #aaaaaa">${bizInfo.bizReviewCnt}개</span>
	       					</div>
	       					<c:if test="${not empty bizReviewList}">
		       				<c:forEach items="${bizReviewList}" var="review">
		       					<div class="row mt-3 list-row">
			       					<div class="col-8">
			       						<span class="star" style="top: -6px;">
			       							<c:if test="${review.reviewStar eq 1}">
												<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       							</c:if>
			       							<c:if test="${review.reviewStar eq 2}">
												<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       							</c:if>
			       							<c:if test="${review.reviewStar eq 3}">
												<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       							</c:if>
			       							<c:if test="${review.reviewStar eq 4}">
												<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       							</c:if>
			       							<c:if test="${review.reviewStar eq 5}">
												<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       							</c:if>
			       							<c:if test="${review.reviewStar eq 6}">
												<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       							</c:if>
			       							<c:if test="${review.reviewStar eq 7}">
												<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       							</c:if>
			       							<c:if test="${review.reviewStar eq 8}">
												<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star" style="color: #ffdd00;"></i>
			       							</c:if>
			       							<c:if test="${review.reviewStar eq 9}">
												<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-regular fa-star-half-stroke" style="color: #ffdd00;"></i>
			       							</c:if>
			       							<c:if test="${review.reviewStar eq 10}">
												<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       								<i class="fa-solid fa-star" style="color: #ffdd00;"></i>
			       							</c:if>
										</span>
			       					</div>
			       					<div class="col-4 text-end">
			       						<c:if test="${empty review.reviewRedate}">
			       							<p class="review-date"><fmt:formatDate value="${review.reviewDate}" pattern="yyyy.MM.dd"/></p>
				       					</c:if>
				       					<c:if test="${not empty review.reviewRedate}">
				       						<p class="review-date"><fmt:formatDate value="${review.reviewReDate}" pattern="yyyy.MM.dd"/></p>
				       					</c:if>
			       					</div>
		       						<div class="written-content">
				  						<textarea class="updateTextarea" readonly>${review.reviewContent}</textarea>
				  					</div>
		       					</div>
		       				</c:forEach>
		       				</c:if>
		       				<c:if test="${fn:length(bizReviewList) le 5}">
		       				<div class="row mt-3 f-review-plus" style="display: none">
		       				</c:if>
		       				<c:if test="${fn:length(bizReviewList) gt 5}">
		       				<div class="row mt-3 f-review-plus">
		       				</c:if>
		   						<div class="col align-self-center text-center">
		   							리뷰 더보기
			    				</div>
			    			</div>
			    			<div class="row mt-3 s-review-plus" style="display: none">
		   						<div class="col align-self-center text-center">
		   							리뷰 더보기
			    				</div>
			    			</div>
	       				</div>
	       			</div>
	       			<div class="mt-5 info-text" style="margin-bottom: 300px;">
	       				<div class="row row-cols-auto my-1">
	       					<div class="col-3">
	       						<p>사업자</p>
	       					</div>
	       					<div class="col-9">
			       				<p>${bizInfo.bizName}</p>
	       					</div>
	       				</div>
	       				<div class="row row-cols-auto my-1">
	       					<div class="col-3">
	       						<p>사업자 번호</p>
	       					</div>
	       					<div class="col-9">
			       				<p>${bizInfo.bizCrn}</p>
	       					</div>
	       				</div>
	       				<div class="row row-cols-auto my-1">
	       					<div class="col-3">
	       						<p>메일 주소</p>
	       					</div>
	       					<div class="col-9">
			       				<p>${bizInfo.bizEmail}</p>
	       					</div>
	       				</div>
	       				<div class="row row-cols-auto my-1">
	       					<div class="col-3">
	       						<p>홈페이지 주소</p>
	       					</div>
	       					<div class="col-9">
			       				<p>${bizInfo.bizHp }</p>
	       					</div>
	       				</div>
	       			</div>
	       		</div>
       		</div>
   		</div>
	</section>
	<spring:eval expression="@apikey['apikey.channelIO']" var="channelIO"/>
	
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
  	
  	// 채널톡
  	(function() {
		var w = window;
		if (w.ChannelIO) {
			return w.console.error("ChannelIO script included twice.")
		}
		var ch = function() {
			ch.c(arguments)
		};
		ch.q = [];
		ch.c = function(args) {
			ch.q.push(args)
		};
		w.ChannelIO = ch;
		function l() {
			if (w.ChannelIOInitialized) {
				return
			}
			w.ChannelIOInitialized = true;
			var s = document.createElement("script");
			s.type = "text/javascript";
			s.async = true;
			s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
			var x = document.getElementsByTagName("script")[0];
			if (x.parentNode) {
				x.parentNode.insertBefore(s, x)
			}
		}
		if (document.readyState === "complete") {
			l()
		} else {
			w.addEventListener("DOMContentLoaded", l);
			w.addEventListener("load", l)
		}
		})();

		ChannelIO('boot', {
			"pluginKey" : "<c:out value='${channelIO}' />"
		});
  </script>
  
  
</body>
</html>