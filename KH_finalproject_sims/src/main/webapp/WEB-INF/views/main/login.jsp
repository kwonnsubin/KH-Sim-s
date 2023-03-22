<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<title>login</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    
</head>
<body>
	<jsp:include page="../header.jsp"/>
	
	<section>
		<div class="container row" style="float: none; margin:100 auto;">
			<div class="col-md-4" style="float:none; margin:0 auto;">
				<h2>로그인</h2>
				<c:url value="/login" var="loginUrl" />
				<form name="f" action="${loginUrl}" method="POST">
					<c:if test="${param.error != null}">
						<p>아이디와 비밀번호가 잘못되었습니다.</p>
					</c:if>
				  <!-- ID input -->
				  <div class="form-outline mb-4">
				    <input type="email" id="form2Example1" class="form-control" placeholder="아이디" />
				  </div>
				
				  <!-- Password input -->
				  <div class="form-outline mb-4">
				    <input type="password" id="form2Example2" class="form-control" placeholder="비밀번호" />
				  </div>
				
				  <!-- 2 column grid layout for inline styling -->
				  <div class="row mb-4">
				    <div class="col d-flex justify-content-center">
				      <!-- Simple link -->
				      <a href="#!">아이디 / 비밀번호 찾기</a>
				      <a href="#!">회원가입</a>
				      <a href="#!">카카오 로그인</a>
				    </div>
				  </div>
				
				  <!-- Submit button -->
				  <div class="d-flex justify-content-center">
				  	<button type="button" class="btn btn-primary btn-block mb-4">로그인</button>
				  </div>
				</form>
			</div>
		</div>
	</section>
	
	<jsp:include page="../footer.jsp"/>
	
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