<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

	<title>Sims</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/login.css"/>
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-fluid d-flex justify-content-center" style="width: 800px; margin-top: 100px;">
			<div class="col-md-6">
				<div class="text-center mb-5">
					<h2 style="color: #979797">로그인</h2>
				</div>
				<c:url value="/login" var="loginUrl" />
				<form:form name="f" action="${loginUrl}" method="POST">
					<c:if test="${param.error != null}">
						<p>입력한 아이디와 비밀번호로 가입된 계정이 없습니다.</p>
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
				  	<button type="submit" class="btn btn-primary btn-block mb-2" style="width: 100%; background-color: white; border: 1px solid #4B8EF1; border-radius: 20px; color: #4B8EF1;">로그인</button>
				  </div>
				  
				  <div class="d-flex justify-content-center mt-3">
				  	<div class="col-lg-12 text-center">
					    <img alt="카카오로그인" src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_wide.png" style="max-height:50px; width:300px; cursor:pointer;" onclick="loginWithKakao()">
					</div>
				  </div>
				</form:form>
			</div>
		</div>
		
		<div class="container px-2 text-center" style="width:60%;">
			<div class="row row-cols-auto justify-content-md-center">
				<div class="col">	
					<div class="p-5">
						<a class="mx-3" style="font-size:14px" href="<%=request.getContextPath()%>/findid">아이디 찾기</a>
						<div class="vr" style="width:1px; height: 20px; background-color: black; margin-bottom: -4px;"></div>
				    	<a class="mx-3" style="font-size:14px" href="<%=request.getContextPath()%>/findpw">비밀번호 찾기</a>
				    	<div class="vr" style="width:1px; height: 20px; background-color: black; margin-bottom: -4px;"></div>
				    	<a class="mx-3" style="font-size:14px" href="<%=request.getContextPath()%>/contract">회원가입</a>
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
  
  <spring:eval expression="@apikey['apikey.kakaoJavaScript']" var="kakaoJs"/>
  <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
	<script type="text/javascript">
	    $(document).ready(function(){
	        Kakao.init("<c:out value='${kakaoJs}' />");
	        Kakao.isInitialized();
	    });
	    
	    // uri 제거한 url
	    function getContextPath() {
	    	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	    	return location.href.substring(0, location.href.indexOf('/', hostIndex + 1));
	    }
	    var cPath = getContextPath();
	
	    function loginWithKakao() {
	        Kakao.Auth.authorize({ 
	        redirectUri: cPath + '/kakaoLogin'
	        }); 
	        // 등록한 리다이렉트uri 입력
	    }
	</script>
</body>
</html>