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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myplandetail.css"/>

</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
    
    <section>
		<div class="container-fluid d-flex justify-content-center mt-5 plan-detail-div">
	       	<div class="row plan-detail-row">
	       		<div class="col">
       				<div class="mb-3">
	       				<p class="plan-detail-p" style="font-weight: bold;">신청한 요금제</p>
	       				<div class="text-end" style="width:90%">
		       				<button type="button" onclick="location.href='<%=request.getContextPath()%>/mypage/myplan'">신청 목록</button>
	       				</div>
       				</div>
       				<div class="row plan-detail">
       					<div class="col-6 plan-info">
       						<p class="mb-3 plan-info-text">요금제 정보</p>
       						
       						<div class="mb-3">
       							<c:if test="${poVo.bizId eq 'idowell'}">
	       							<img src="<%=request.getContextPath()%>/resources/img/${poVo.bizId}.jpg" style="max-width: 100px; height: 40px;">
	       						</c:if>
	       						<c:if test="${poVo.bizId ne 'idowell'}">
	       							<img src="<%=request.getContextPath()%>/resources/img/${poVo.bizId}.png" style="max-width: 100px; height: 40px;">
	       						</c:if>
       						</div>
       						
       						<p class="mb-2">요금제명	|	${poVo.planName}</p>
       						
       						<c:if test="${poVo.netNo eq 1}">
	       						<p class="mb-2">통신사		|	KT 망</p>
       						</c:if>
       						<c:if test="${poVo.netNo eq 2}">
	       						<p class="mb-2">통신사		|	SKT 망</p>
       						</c:if>
       						<c:if test="${poVo.netNo eq 3}">
	       						<p class="mb-2">통신사		|	LGU+ 망</p>
       						</c:if>
       						
       						<c:if test="${poVo.genNo eq 1}">
	       						<p class="mb-2">통신망		|	5G</p>
       						</c:if>
       						<c:if test="${poVo.genNo eq 2}">
	       						<p class="mb-2">통신망		|	LTE</p>
       						</c:if>
       						<c:if test="${poVo.genNo eq 4}">
	       						<p class="mb-2">통신망		|	3G</p>
       						</c:if>
       						
							<c:if test="${poVo.planData lt 1000}">
	    						<c:set var="data" value="${poVo.planData}"/> 
	       						<p class="mb-2">데이터량	|	${data} MB</p>
	    					</c:if>
	    					<c:if test="${poVo.planData gt 1000}">
	    						<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${poVo.planData / 1000}" />
	    						<p class="mb-2">데이터량	|	${data} GB</p>
	    					</c:if>
	    					
	    					<c:if test="${poVo.planVoice eq 0}">
	       						<p class="mb-2">음성량		|	기본제공</p>
	    					</c:if>
	    					<c:if test="${poVo.planVoice ne 0}">
	       						<p class="mb-2">음성량		|	${poVo.planVoice} 분</p>
	    					</c:if>
	    					
	    					<c:if test="${poVo.planMessage eq 0}">
	       						<p class="mb-2">문자량		|	기본제공</p>
	    					</c:if>
	    					<c:if test="${poVo.planMessage ne 0}">
	       						<p class="mb-2">문자량		|	${poVo.planMessage} 건</p>
	    					</c:if>
       						
							<c:if test="${poVo.joinCategory eq 1}">
	       						<p class="mb-2">가입유형	|	번호이동</p>
       						</c:if>
       						<c:if test="${poVo.joinCategory eq 2}">
	       						<p class="mb-2">가입유형	|	신규가입</p>
       						</c:if>

							<c:if test="${poVo.simYn eq 1}">
	       						<p class="mb-2">유심신청	|	Y</p>
       						</c:if>
       						<c:if test="${poVo.simYn eq 2}">
	       						<p class="mb-2">유심신청	|	N</p>
       						</c:if>
       						
       						<c:if test="${poVo.simType eq 1}">
	       						<p class="mb-2">유심유형	|	일반유심</p>
       						</c:if>
       						<c:if test="${poVo.simType eq 2}">
	       						<p class="mb-2">유심유형	|	NFC유심</p>
       						</c:if>
       					</div>
       					<div class="col-5">
       						<div class="plan-info mb-3">
       							<p class="mb-2">신청일자	|	${poVo.orderDate}</p>
       							
       							<c:if test="${poVo.orderStatus eq 1}">
	       							<p class="mb-2">진행상태	|	신청 완료</p>
       							</c:if>
       							<c:if test="${poVo.orderStatus eq 2}">
	       							<p class="mb-2">진행상태	|	승인 완료</p>
       							</c:if>
       							<c:if test="${poVo.orderStatus eq 3}">
	       							<p class="mb-2">진행상태	|	승인 보류</p>
       							</c:if>
       						</div>
       						<div class="plan-info">
       							<p class="mb-3 plan-info-text">납부 정보</p>
       							
       							<p class="mb-2">월 납부 금액		|	${poVo.planPrice} 원</p>
       							<p class="mb-2">초과데이터단가	|	MB당 ${poVo.planDataOver} 원</p>
       							<p class="mb-2">초과음성단가	|	초당 ${poVo.planVoiceOver} 원</p>
       							<p class="mb-2">초과문자단가	|	건당 ${poVo.planMessageOver} 원</p>
       							
       							<c:if test="${poVo.planPay eq 1}">
	       							<p class="mb-2">납부방법		|	카드</p>
       							</c:if>
       							<c:if test="${poVo.planPay eq 2}">
	       							<p class="mb-2">납부방법		|	계좌이체</p>
       							</c:if>
       							
       							<c:if test="${poVo.planPay eq 1}">
	       							<p class="mb-2">카드번호		|	${poVo.cardNumber}</p>
       							</c:if>
       							<c:if test="${poVo.planPay eq 2}">
	       							<p class="mb-2">계좌번호		|	${poVo.bankNumber}</p>
       							</c:if>
       							
       							<c:if test="${poVo.planBill eq 1}">
	       							<p class="mb-2">청구서			|	문자</p>
       							</c:if>
       							<c:if test="${poVo.planBill eq 2}">
	       							<p class="mb-2">청구서			|	이메일</p>
       							</c:if>
       						</div>
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
  
</body>
</html>