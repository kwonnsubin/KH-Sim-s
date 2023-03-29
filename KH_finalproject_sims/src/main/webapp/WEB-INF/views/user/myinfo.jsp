<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

	<title>내 정보</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
    
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
	        <h4 class="mb-3">내 정보</h4>
		        
	        <c:url value="/myinfo" var="myinfoUrl" />
	        <form:form class="userForm validation-form" name="f" action="${myinfoUrl}" method="post" novalidate="novalidate">
	        
	        <!-- 권한 -->
	        <input type="hidden" name="role" value="ROLE_USER">
	      
	        <div class="mb-3">
	              <label for="userName">이름</label>
	              <input type="text" class="form-control" name="userName" value="${userInfo.userName}" readonly>
	              <div class="invalid-feedback">이름을 입력해주세요.</div>
	        </div>
	        
	        <div class="mb-3">
	              <label for="id">아이디</label>
	              <input type="text" class="form-control" name="id" value="${userInfo.userId}" readonly>
	              <div class="invalid-feedback">아이디를 입력해주세요.</div>
	        </div>
	        
	        <div class="mb-3">
	            <label for="pw">비밀번호</label>
	            <input type="password" class="form-control" name="pw" placeholder="비밀번호" required>
	            <div class="invalid-feedback">비밀번호를 입력하세요</div>
	        </div>
	          
	        <div class="mb-3">
	            <label for="pwCheck">비밀번호 확인</label>
	            <input type="password" class="form-control" name="pwCheck" placeholder="비밀번호 확인" required>
	            <div class="invalid-feedback">비밀번호를 입력하세요</div>
	        </div>
	          
	        <div class="pwCheckDiv" style="display:none;"></div>
				
			<div class="container">
	            <div class="row">
		          <div class="col-9 mb-3 text-left">
		            <label for="userEmail">이메일</label>
		            <input type="email" class="form-control" name="userEmail" value="${userInfo.userEmail}" required>
		            <div class="invalid-feedback">이메일을 입력해주세요.</div>
		          </div>
		          <div class="col-3 mb-3 text-center align-self-end">
		            <button class="btn btn-primary btn-sm btn-block" name="emailBtn" type="button" disabled="disabled">본인인증</button>
		          </div>
	            </div>
	        </div>
	
	          <div class="mb-3">
	            <label for="emailCheck">인증번호</label>
	            <input type="text" class="form-control" name="emailCheck" placeholder="인증번호" required>
	            <div class="invalid-feedback">인증번호를 입력하세요</div>
	        </div>
		          
	        <div class="emailCheckDiv" style="display:none;"></div>
	        
	        <div class="mb-3">
	            <label for="userPhone">전화번호</label>
	            <input type="text" class="form-control" name="userPhone" value="${userInfo.userPhone}" required>
	            <div class="invalid-feedback">전화번호를 입력하세요</div>
	        </div>
	        
	        <div class="text-center">
		       	<button class="btn btn-primary btn-lg btn-block mx-5 subBtn" type="submit" disabled>수정</button>
		       	<button class="btn btn-primary btn-lg btn-block mx-5 modalInBtn" type="button">탈퇴</button>
        	</div>
	        
	        </form:form>
	      </div>
	    </div>
	    </div>
	    
	    <div class="modal">
	    	<div class="modal_content">
	    		<div class="mb-3 text-center">탈퇴하려면 확인을 눌러주세요.</div>
	    		<div class="mt-3 text-center">
			       	<button class="btn btn-primary btn-sm btn-block mx-1 relBtn" type="button">확인</button>
		    		<button class="btn btn-primary btn-sm btn-block mx-1 modalOutBtn" type="button">취소</button>
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
  <script src="<%= request.getContextPath() %>/resources/js/myinfo.js"></script>
  
  
</body>
</html>