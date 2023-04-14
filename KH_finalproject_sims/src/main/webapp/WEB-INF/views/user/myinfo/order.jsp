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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/order.css"/>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-fluid d-flex justify-content-center mt-5 review-div">
	       	<div class="row review-row">
	       		<div class="col-12">
	       			<div class="row text-div mb-5">
	       				<div class="col-3 text-center">
		       				<p>리뷰 작성</p>
	       				</div>
	       				<div class="col-1" style="display: flex; justify-content : center;">
		       				<div class="vr" style="background-color:black; height:28px;"></div>
	       				</div>
	       				<div class="col-3 text-center">
	       					<p>작성한 리뷰</p>
	       				</div>
	       			</div>
	       			<div class="review-list">
	       				<c:forEach items="${poList}" var="po">
	       					<div>
			       				<div class="row my-3 list-row">
			       					<div class="col-2 text-center align-self-center">
			       						<img src="<%=request.getContextPath()%>/resources/img/${po.bizId}.png" style="max-width: 60px; height: 26px;">
			       					</div>
			       					<div class="col-7 align-self-center">
			       						<p class="plan-name-text">
			       							${po.planName} + 
			       							<c:if test="${po.planData lt 1000}">
					    					${po.planData}MB 
					    					</c:if>
					    					<c:if test="${po.planData gt 1000}">
					    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${po.planData / 1000}" />
					    					${data}G
					    					</c:if>
			       						</p>
			       						<p>
			       							<c:if test="${po.netNo eq 1}">KT 망</c:if>
			       							<c:if test="${po.netNo eq 2}">SKT 망</c:if>
			       							<c:if test="${po.netNo eq 3}">LGU+ 망</c:if>
			       							 | 
			       							<c:if test="${po.genNo eq 1}">5G</c:if>
			       							<c:if test="${po.genNo eq 2}">LTE</c:if>
			       							<c:if test="${po.genNo eq 4}">3G</c:if>
			       						</p>
			       					</div>
			       					<div class="col-3 text-center align-self-center button-container">
			       						<button class="button">
									        	리뷰 작성
									        <i class="fa fa-check"></i>
									    </button>
			       					</div>
			       				</div>
		       					<div class="row">
		       						<div class="col-10">
				  						<textarea>${ntc.ntcContent}</textarea>
		       						</div>
		       						<div class="col-2">
		       							<span class="star">
											★★★★★
											<span>★★★★★</span>
											<input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
										</span>
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
	<script src="<%= request.getContextPath() %>/resources/js/user/order.js"></script>
  
</body>
</html>