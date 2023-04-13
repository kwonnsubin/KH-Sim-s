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

	<title>요금제</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/notice.css"/>

</head>
<body>

	<jsp:include page="../../header.jsp"/>
	
	<section>
		<div class="container-fluid d-flex justify-content-center mt-5 notice-div">
	       	<div class="row notice-row">
	       		<div class="col-12">
	       			<div class="mb-3">
	       				<h4>공지사항</h4>
	       			</div>
	       			<div>
	       				<c:forEach items="${ntcList}" var="ntc">
		       				<div class="row notice-list">
		       					<div class="col-2 text-center align-self-center">
			       					<span class="material-symbols-outlined pt-2">campaign</span>
		       					</div>

		       					<div class="col-8 align-self-center pt-2">
			       					<p class="ntc-title">${ntc.ntcTitle}</p>
			       					<c:if test="${empty ntc.ntcRedate}">
			       						<p class="ntc-date"><fmt:formatDate value="${ntc.ntcDate}" pattern="yyyy.MM.dd hh:mm:ss"/></p>
			       					</c:if>
			       					<c:if test="${not empty ntc.ntcRedate}">
			       						<p class="ntc-date"><fmt:formatDate value="${ntc.ntcDate}" pattern="yyyy.MM.dd hh:mm:ss"/></p>
			       					</c:if>
		       					</div>
		       					<div class="col-2 text-center align-self-center">
			       					<span class="material-symbols-outlined pt-2">chevron_right</span>
		       					</div>
		       				</div>
	       				</c:forEach>
	       			</div>
	       		</div>
	       	</div>
	    </div>
	</section>

	<jsp:include page="../../footer.jsp"/>
	
	<!-- Scripts -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/user/notice.js"></script>
  
</body>
</html>