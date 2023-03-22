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

	<title>회원가입</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    
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

	<jsp:include page="../header.jsp"/>
	
	<section>
	  <div class="container">
	    <div class="input-form-backgroud row">
	      <div class="input-form col-md-12 mx-auto">
	        <h4 class="mb-3">회원가입</h4>
	        <form class="validation-form" novalidate>
	        
	        	<!-- 유형 -->
	        	<div class="container text-center">
		            <div class="row">
			          <div class="col input-group mb-3">
						  <div class="input-group-text">
						    <input class="form-check-input mt-0" type="radio" value="사용자" name="userTypeRdo" id="userType" checked>
						  </div>
						  <input type="text" class="form-control" value="사용자" readonly>
					  </div>
					  <div class="col input-group mb-3">
						  <div class="input-group-text">
						    <input class="form-check-input mt-0" type="radio" value="통신사" name="userTypeRdo" id="userType">
						  </div>
						  <input type="text" class="form-control" value="통신사" readonly>
					  </div>
		            </div>
		        </div>
	        
	          <div class="mb-3">
	              <label for="userName">이름</label>
	              <input type="text" class="form-control" id="userName" placeholder="이름" required>
	              <div class="invalid-feedback">이름을 입력해주세요.</div>
	          </div>
			
			<div class="container">
	            <div class="row">
		          <div class="col-8 mb-3">
		            <label for="userEmail">이메일</label>
		            <input type="email" class="form-control" id="userEmail" placeholder="you@example.com" required>
		            <div class="invalid-feedback">이메일을 입력해주세요.</div>
		          </div>
		          <div class="col-2 mb-3">
		            <button class="btn btn-primary btn-sm btn-block" type="button">인증번호받기</button>
		          </div>
	            </div>
	        </div>
	
	          <div class="mb-3">
	            <label for="emailNum">인증번호</label>
	            <input type="text" class="form-control" id="emailNum" placeholder="인증번호" required>
	            <div class="invalid-feedback">인증번호를 입력하세요</div>
	          </div>
	          
	          <div class="mb-3">
	            <label for="id">아이디</label>
	            <input type="text" class="form-control" id="id" placeholder="아이디" required>
	            <div class="invalid-feedback">아이디를 입력하세요</div>
	          </div>
	          
	          <div class="mb-3">
	            <label for="pw">비밀번호</label>
	            <input type="password" class="form-control" id="pw" placeholder="비밀번호" required>
	            <div class="invalid-feedback">비밀번호를 입력하세요</div>
	          </div>
	          
	          <div class="mb-3">
	            <label for="pwCheck">비밀번호 확인</label>
	            <input type="password" class="form-control" id="pwCheck" placeholder="비밀번호 확인" required>
	            <div class="invalid-feedback">비밀번호를 입력하세요</div>
	          </div>
	          
	          <!-- 성별 -->
	          
	          <div class="mb-3">
	            <label for="userSsn">주민등록번호</label>
	            <input type="text" class="form-control" id="userSsn" placeholder="- 제외한 주민등록번호" required>
	            <div class="invalid-feedback">주민등록번호를 입력하세요</div>
	          </div>
	          
	          <div class="mb-3">
	            <label for="userPhone">전화번호</label>
	            <input type="text" class="form-control" id="userPhone" placeholder="전화번호" required>
	            <div class="invalid-feedback">전화번호를 입력하세요</div>
	          </div>
	          
	          <button class="btn btn-primary btn-lg btn-block" type="submit">가입</button>
	        </form>
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