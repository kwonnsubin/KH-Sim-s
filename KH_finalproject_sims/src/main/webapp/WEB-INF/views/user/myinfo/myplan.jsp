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
    <meta name="vieworderrt" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myplan.css"/>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-fluid d-flex justify-content-center mt-5 myplan-div">
	       	<div class="row myplan-row">
	       		<div class="col">
       				<div class="mb-3 text-div">
	       				<p style="font-weight: bold; font-size: 20px;">신청한 요금제</p>
       				</div>
       				
       				<div class="row row-cols-auto text-div mb-5">
	       				<div class="col text-center order-text">
		       				<p style="font-weight: bold;">신청 완료</p>
	       				</div>
	       				<div class="col" style="display: flex; justify-content : center;">
		       				<div class="vr" style="background-color:black; height:28px;"></div>
	       				</div>
	       				<div class="col text-center accept-text">
	       					<p>승인 완료</p>
	       				</div>
	       				<div class="col" style="display: flex; justify-content : center;">
		       				<div class="vr" style="background-color:black; height:28px;"></div>
	       				</div>
	       				<div class="col text-center hold-text">
	       					<p>승인 보류</p>
	       				</div>
	       			</div>
	       			
	       			<div class="myplan-list-order">
	       				<c:if test="${not empty orderList}">
	       				<c:forEach items="${orderList}" var="order">
	       					<div class="insert-div">
			       				<div class="row my-3 list-row">
			       					<div class="col-2 text-center align-self-center">
			       						<img src="<%=request.getContextPath()%>/resources/img/${order.bizId}.png" style="max-width: 80px; max-height: 30px;">
			       					</div>
			       					<div class="col-7 align-self-center">
			       						<p class="plan-name-text">
			       							<input class="orderNo" type="hidden" value="${order.orderNo}">
			       							${order.planName} + 
			       							<c:if test="${order.planData eq 0}">
			       								없음
			       							</c:if>
			       							<c:if test="${order.planData ne 0}">
						    					<c:if test="${order.planData lt 1000}">
						    					${order.planData} MB 
						    					</c:if>
						    					<c:if test="${order.planData gt 1000}">
						    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${order.planData / 1000}" />
						    					${data} GB
						    					</c:if>
					    					</c:if>
			       						</p>
			       						<p>
			       							<c:if test="${order.netNo eq 1}">KT 망</c:if>
			       							<c:if test="${order.netNo eq 2}">SKT 망</c:if>
			       							<c:if test="${order.netNo eq 3}">LGU+ 망</c:if>
			       							 | 
			       							<c:if test="${order.genNo eq 1}">5G</c:if>
			       							<c:if test="${order.genNo eq 2}">LTE</c:if>
			       							<c:if test="${order.genNo eq 4}">3G</c:if>
			       						</p>
			       					</div>
			       					<div class="col-3 text-center align-self-center button-container">
			       						<button class="myplan-btn">
									        	상세 조회
									        <i class="fa fa-check"></i>
									    </button>
			       					</div>
			       				</div>
		       				</div>
	       				</c:forEach>
	       				</c:if>
	       				<c:if test="${empty orderList}">
	       					<div class="row none-div">
	       						<div class="text-center align-self-center" style="font-size: 14px; color: black;">
		       						신청한 요금제가 없습니다.
	       						</div>
	       					</div>
	       				</c:if>
	       			</div>
	       			
	       			<div class="myplan-list-accept" style="display: none;">
	       				<c:if test="${not empty acceptList}">
	       				<c:forEach items="${acceptList}" var="accept">
	       					<div class="insert-div">
			       				<div class="row my-3 list-row">
			       					<div class="col-2 text-center align-self-center">
			       						<img src="<%=request.getContextPath()%>/resources/img/${accept.bizId}.png" style="max-width: 80px; max-height: 30px;">
			       					</div>
			       					<div class="col-7 align-self-center">
			       						<p class="plan-name-text">
			       							<input class="orderNo" type="hidden" value="${accept.orderNo}">
			       							${accept.planName} + 
			       							<c:if test="${accept.planData eq 0}">
			       								없음
			       							</c:if>
			       							<c:if test="${accept.planData ne 0}">
						    					<c:if test="${accept.planData lt 1000}">
						    					${accept.planData} MB 
						    					</c:if>
						    					<c:if test="${accept.planData gt 1000}">
						    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${accept.planData / 1000}" />
						    					${data} GB
						    					</c:if>
					    					</c:if>
			       						</p>
			       						<p>
			       							<c:if test="${accept.netNo eq 1}">KT 망</c:if>
			       							<c:if test="${accept.netNo eq 2}">SKT 망</c:if>
			       							<c:if test="${accept.netNo eq 3}">LGU+ 망</c:if>
			       							 | 
			       							<c:if test="${accept.genNo eq 1}">5G</c:if>
			       							<c:if test="${accept.genNo eq 2}">LTE</c:if>
			       							<c:if test="${accept.genNo eq 4}">3G</c:if>
			       						</p>
			       					</div>
			       					<div class="col-3 text-center align-self-center button-container">
			       						<button class="myplan-btn">
									        	상세 조회
									        <i class="fa fa-check"></i>
									    </button>
			       					</div>
			       				</div>
		       				</div>
	       				</c:forEach>
	       				</c:if>
	       				<c:if test="${empty acceptList}">
	       					<div class="row none-div">
	       						<div class="text-center align-self-center" style="font-size: 14px; color: black;">
		       						승인 완료된 요금제가 없습니다.
	       						</div>
	       					</div>
	       				</c:if>
	       			</div>
	       			
	       			<div class="myplan-list-hold" style="display: none;">
	       				<c:if test="${not empty holdList}">
	       				<c:forEach items="${holdList}" var="hold">
	       					<div class="insert-div">
			       				<div class="row my-3 list-row">
			       					<div class="col-2 text-center align-self-center">
			       						<img src="<%=request.getContextPath()%>/resources/img/${hold.bizId}.png" style="max-width: 80px; max-height: 30px;">
			       					</div>
			       					<div class="col-7 align-self-center">
			       						<p class="plan-name-text">
			       							<input class="orderNo" type="hidden" value="${hold.orderNo}">
			       							${hold.planName} + 
			       							<c:if test="${hold.planData eq 0}">
			       								없음
			       							</c:if>
			       							<c:if test="${hold.planData ne 0}">
						    					<c:if test="${hold.planData lt 1000}">
						    					${hold.planData} MB 
						    					</c:if>
						    					<c:if test="${hold.planData gt 1000}">
						    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${hold.planData / 1000}" />
						    					${data} GB
						    					</c:if>
					    					</c:if>
			       						</p>
			       						<p>
			       							<c:if test="${hold.netNo eq 1}">KT 망</c:if>
			       							<c:if test="${hold.netNo eq 2}">SKT 망</c:if>
			       							<c:if test="${hold.netNo eq 3}">LGU+ 망</c:if>
			       							 | 
			       							<c:if test="${hold.genNo eq 1}">5G</c:if>
			       							<c:if test="${hold.genNo eq 2}">LTE</c:if>
			       							<c:if test="${hold.genNo eq 4}">3G</c:if>
			       						</p>
			       					</div>
			       					<div class="col-3 text-center align-self-center button-container">
			       						<button class="myplan-btn">
									        	상세 조회
									        <i class="fa fa-check"></i>
									    </button>
			       					</div>
			       				</div>
		       				</div>
	       				</c:forEach>
	       				</c:if>
	       				<c:if test="${empty holdList}">
	       					<div class="row none-div">
	       						<div class="text-center align-self-center" style="font-size: 14px; color: black;">
		       						승인 보류된 요금제가 없습니다.
	       						</div>
	       					</div>
	       				</c:if>
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
	<script src="<%= request.getContextPath() %>/resources/js/user/myplan.js"></script>
  
</body>
</html>