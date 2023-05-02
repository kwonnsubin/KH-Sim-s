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

	<title>Sims</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/header.css"/>
    
    <style>

    .input-form {
      max-width: 680px;

      margin-top: 150px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  	</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
	  <div class="container">
	    <div class="input-form-backgroud row">
	      <div class="input-form col-md-12 mx-auto">
	        <h4 class="mb-3">회원가입</h4>
	        
        	<!-- 유형 -->
		        
	        <c:url value="/kakaoJoin" var="kakaoJoinUrl" />
	        <form:form class="userForm validation-form" name="f" action="${kakaoJoinUrl}" method="post" novalidate="novalidate">
	        
	        <div class="user">
		        <div class="mb-3">
		            <label for="userName">이름</label>
		            <input type="text" class="form-control" name="userName" placeholder="이름" value="${tokenResult.nickname}" readonly>
		            <input type="hidden" name="id" value="${tokenResult.id}">
		            <input type="hidden" name="kakaoToken" value="${kakaoToken}">
		            <div class="invalid-feedback">이름을 입력해주세요.</div>
		        </div>
				
				
	            <div class="row">
		          <div class="col-9 mb-3 text-left">
		            <label for="userEmail">이메일</label>
		            <input type="email" class="form-control" name="userEmail" placeholder="you@example.com" required>
		            <div class="invalid-feedback">이메일을 입력해주세요.</div>
		          </div>
		          <div class="col-3 mb-3 text-center align-self-end">
		            <button class="btn btn-primary btn-sm btn-block" name="emailBtn" type="button" disabled="disabled">본인인증</button>
		          </div>
	            </div>
		
		          <div class="mb-3">
		            <label for="emailCheck">인증번호</label>
		            <input type="text" class="form-control" name="emailCheck" placeholder="인증번호" required>
		            <div class="invalid-feedback">인증번호를 입력하세요</div>
		          </div>
		          
		        <div class="emailCheckDiv" style="display:none;"></div>
		          
		          <!-- 성별 -->
            	<label for="genderDiv">성별</label>
	            <div class="row text-center">
		          <div class="col input-group mb-3">
					  <div class="input-group-text">
					    <input class="form-check-input mt-0" type="radio" value="F" name="userGender">
					  </div>
					  <input type="text" class="form-control" value="여성" readonly style="background-color:white;">
				  </div>
				  <div class="col input-group mb-3">
					  <div class="input-group-text">
					    <input class="form-check-input mt-0" type="radio" value="M" name="userGender">
					  </div>
					  <input type="text" class="form-control" value="남성" readonly style="background-color:white;">
				  </div>
	        	</div>
		          
		          <div class="mb-3">
		            <label for="userSsn">주민등록번호</label>
		            <input type="text" class="form-control" name="userSsn" placeholder="- 포함한 주민등록번호" required>
		            <div class="invalid-feedback">주민등록번호를 입력하세요</div>
		          </div>
		          
		          <div class="mb-3">
		            <label for="userPhone">전화번호</label>
		            <input type="text" class="form-control" name="userPhone" placeholder="- 포함한 전화번호" required>
		            <div class="invalid-feedback">전화번호를 입력하세요</div>
		          </div>
	          </div>
	          
	          <div class="text-end">
		          <button class="btn btn-primary btn-lg btn-block" type="submit" disabled>가입</button>
	          </div>
	        </form:form>
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
  <script src="<%= request.getContextPath() %>/resources/js/main/kakaoJoin.js"></script>
  
  
</body>
</html>