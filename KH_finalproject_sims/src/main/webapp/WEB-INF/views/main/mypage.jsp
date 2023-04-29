<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/mypage.css"/>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container mypage-div">
	    	<div class="row">
	      		<div class="col-md-8 mx-auto">
	      			<div class="mb-5">
	        			<h4>${username}님 안녕하세요</h4>
	        		</div>
	        		<div class="row mb-5 text-center">
	        			<div class="col faqDiv pointer">
	        				<span class="material-symbols-outlined mb-2">comment</span>
	        				<p>문의게시판</p>
	        			</div>
	        			<div class="col notice-div pointer">
	        				<span class="material-symbols-outlined mb-2">campaign</span>
	        				<p>공지사항</p>
	        			</div>
	        			<div class="col myinfo-div pointer">
	        				<span class="material-symbols-outlined mb-2">person</span>
	        				<p>내 정보</p>
	        			</div>
	        		</div>
	        		<div>
	        			<div class="row mb-4 reviewDiv pointer">
	        				<div class="col">
		        				리뷰 작성/관리
	        				</div>
	        				<div class="col text-end">
		        				${cnt.reviewCnt} 개 >
	        				</div>
	        			</div>
	        			<div class="row mb-4 myPlanDiv pointer">
	        				<div class="col">
		        				신청한 요금제
	        				</div>
	        				<div class="col text-end">
		        				${cnt.myPlanCnt} 개 >
	        				</div>
	        			</div>
	        			<div class="row mb-4 likeDiv pointer">
	        				<div class="col">
		        				찜한 요금제
	        				</div>
	        				<div class="col text-end">
		        				${cnt.likeCnt} 개 >
	        				</div>
	        			</div>
	        			<div class="row mb-4 recentDiv pointer">
	        				<div class="col">
		        				최근 본 요금제
	        				</div>
	        				<div class="col text-end">
		        				${cnt.recentCnt} 개 >
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
  <script src="<%= request.getContextPath() %>/resources/js/main/mypage.js"></script>
  
  
</body>
</html>