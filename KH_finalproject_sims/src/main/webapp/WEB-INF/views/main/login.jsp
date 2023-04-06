<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		<div class="container-fluid d-flex justify-content-center" style="width: 80%; margin-top: 100px;">
			<div class="col-md-6">
				<h2>로그인</h2>
				<c:url value="/login" var="loginUrl" />
				<form:form name="f" action="${loginUrl}" method="POST">
					<c:if test="${param.error != null}">
						<p>아이디와 비밀번호가 잘못되었습니다.</p>
					</c:if>
				  <!-- ID input -->
				  <div class="form-outline mb-4">
				    <input type="text" id="id" name="id" class="form-control" placeholder="아이디" />
				  </div>
				
				  <!-- Password input -->
				  <div class="form-outline mb-4">
				    <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호" />
				  </div>
				
				  <!-- Submit button -->
				  <div class="d-flex justify-content-center">
				  	<button type="submit" class="btn btn-primary btn-block mb-4">로그인</button>
				  </div>
				</form:form>
			</div>
		</div>
		
		<div class="container px-2 text-center" style="width:60%;">
			<div class="row gx-2">
				<div class="col">
					<div class="p-3">
						<a href="<%=request.getContextPath()%>/findid">아이디 찾기</a> / 
				    	<a href="<%=request.getContextPath()%>/findpw">비밀번호 찾기</a>
					</div>
				</div>
				<div class="col">
					<div class="p-3">
						<a href="<%=request.getContextPath()%>/contract">회원가입</a>
					</div>
				</div>
				<div class="col">
					<div class="p-3">
						<a href="#">카카오로그인</a>
					</div>
				</div>
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