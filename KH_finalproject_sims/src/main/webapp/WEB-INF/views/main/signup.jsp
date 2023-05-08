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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

	<title>Sims</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main/signup.css"/>
    
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
        	<div class="container text-center">
	            <div class="row">
		          <div class="col input-group mb-3">
					  <div class="input-group-text">
					    <input class="form-check-input mt-0" type="radio" value="ROLE_USER" name="role" checked="checked">
					  </div>
					  <input type="text" class="form-control" value="사용자" style="cursor:default;" readonly>
				  </div>
				  <div class="col input-group mb-3">
					  <div class="input-group-text">
					    <input class="form-check-input mt-0" type="radio" value="ROLE_BIZ" name="role">
					  </div>
					  <input type="text" class="form-control" value="통신사" style="cursor:default;" readonly>
				  </div>
	            </div>
	        </div>
		        
	        <c:url value="/signup" var="signupUrl" />
	        <form:form class="userForm validation-form" name="f" action="${signupUrl}" method="post" novalidate="novalidate">
	        
	        <!-- 유저 정보 -->
	        <input type="hidden" name="role" value="ROLE_USER">
	        
	        <div class="user">
		        <div class="mb-3">
		            <label for="userName">이름</label>
		            <input type="text" class="form-control" name="userName" placeholder="이름" required>
		            <div class="invalid-feedback">이름을 입력해주세요.</div>
		        </div>
				
				
	            <div class="row">
		          <div class="col-9 mb-3 text-left">
		            <label for="userEmail">이메일</label>
		            <input type="email" class="form-control" name="userEmail" placeholder="you@example.com" required>
		            <div class="invalid-feedback">이메일을 입력해주세요.</div>
		          </div>
		          <div class="col-3 mb-3 text-center align-self-end">
		            <button class="btn btn-primary btn-sm btn-block" name="emailBtn" type="button" style="padding-top:0px; padding-bottom: 0px; height: 38px;" disabled="disabled">본인인증</button>
		          </div>
	            </div>
		
		          <div class="mb-3">
		            <label for="emailCheck">인증번호</label>
		            <input type="text" class="form-control" name="emailCheck" placeholder="인증번호" required>
		            <div class="invalid-feedback">인증번호를 입력하세요</div>
		          </div>
		          
		        <div class="emailCheckDiv" style="display:none;"></div>
		          
		        <div class="row">
			    	<div class="col-9 mb-3 text-left">
			            <label for="id" data-tooltip="6-20자리 아이디를 작성해주세요">아이디 <i class="fa-solid fa-circle-question" style="color: #538cee;"></i></label>
			            <input type="text" class="form-control inputId" name="id" placeholder="아이디" required>
			       		<div class="invalid-feedback">아이디를 입력해주세요.</div>
			        </div>
		        	<div class="col-3 mb-3 text-center align-self-end">
		            	<button class="btn btn-primary btn-sm btn-block" name="idBtn" type="button" style="padding-top:0px; padding-bottom: 0px; height: 38px;" disabled="disabled">중복확인</button>
		          	</div>
		        </div>
		        
		        <div class="idCheckDiv" style="display:none; font-size: 14px;"></div>
		          
		          <div class="mb-3">
		            <label for="pw" data-tooltip="영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8-16자리 암호를 작성해주세요">비밀번호 <i class="fa-solid fa-circle-question" style="color: #538cee;"></i></label>
		            <input type="password" class="form-control inputPw" name="pw" placeholder="비밀번호" required>
		            <div class="invalid-feedback">비밀번호를 입력하세요</div>
		          </div>
		          
		          <div class="passwdCheck" style="display:none; font-size: 14px;"><p style='color: red;'>양식에 맞게 작성해주세요.</p></div>
		          
		          <div class="mb-3">
		            <label for="pwCheck">비밀번호 확인</label>
		            <input type="password" class="form-control" name="pwCheck" placeholder="비밀번호 확인" required>
		            <div class="invalid-feedback">비밀번호를 입력하세요</div>
		          </div>
		          
		          <div class="pwCheckDiv" style="display:none; font-size: 14px;"></div>
		          
		          <!-- 성별 -->
            	<label for="genderDiv">성별</label>
	            <div class="row text-center">
		          <div class="col input-group mb-3">
					  <div class="input-group-text">
					    <input class="form-check-input mt-0 radioCheck" type="radio" value="F" name="userGender" checked>
					  </div>
					  <input type="text" class="form-control genderInput1" value="여성" readonly style="background-color:white; cursor:default; outline:none;">
				  </div>
				  <div class="col input-group mb-3">
					  <div class="input-group-text">
					    <input class="form-check-input mt-0 radioCheck" type="radio" value="M" name="userGender">
					  </div>
					  <input type="text" class="form-control genderInput2" value="남성" readonly style="background-color:white; cursor:default; outline:none;">
				  </div>
	        	</div>
		          
		          <div class="mb-3">
		            <label for="userSsn">주민등록번호</label>
		            <input type="text" class="form-control" name="userSsn" placeholder="주민등록번호" maxlength="14" pattern="[0-9\-]*" oninput="checkInput(event)" onkeyup="autoHyphenSsn(this)" required>
		          	<div class="invalid-feedback">주민등록번호를 입력하세요</div>
			        <div class="error-message mt-2" style="display:none; color: red; font-size: 14px;">숫자만 입력 가능합니다.</div>
		          </div>
		          
		          <div class="mb-3">
		            <label for="userPhone">전화번호</label>
		            <input type="text" class="form-control userPhone" name="userPhone" placeholder="전화번호" maxlength="13" pattern="[0-9\-]*" oninput="checkInput(event)" onkeyup="autoHyphenPhone(this)" required>
		            <div class="invalid-feedback">전화번호를 입력하세요</div>
		            <div class="error-message mt-2" style="display:none; color: red; font-size: 14px;">숫자만 입력 가능합니다.</div>
		          </div>
	          </div>
	          
	          <div class="text-end">
	          	<button class="btn btn-primary btn-lg btn-block" type="submit" disabled>가입</button>
	          </div>
	        </form:form>
	        
	        <form:form class="bizForm validation-form" name="f" action="${signupUrl}" style="display:none" method="post" novalidate="novalidate">
	          <!-- 통신사 정보 -->
	          <input type="hidden" name="role" value="ROLE_BIZ">
	          
	          <div class="biz">
		          <div class="mb-3">
		              <label for="bizName">법인명</label>
		              <input type="text" class="form-control" name="bizName" placeholder="법인명" required>
		              <div class="invalid-feedback">법인명을 입력해주세요.</div>
		          </div>
				
		          <div class="mb-3">
		            <label for="bizSsn">법인등록번호</label>
		            <input type="text" class="form-control" name="bizSsn" placeholder="법인등록번호" maxlength="14" onkeyup="autoHyphenSsn(this)" required>
		            <div class="invalid-feedback">법인등록번호를 입력해주세요.</div>
		          </div>
		
		          <div class="mb-3">
		            <label for="bizCrn">사업자등록번호</label>
		            <input type="text" class="form-control" name="bizCrn" placeholder="사업자등록번호" maxlength="12" onkeyup="autoHyphenCrn(this)" required>
		            <div class="invalid-feedback">사업자등록번호를 입력하세요</div>
		          </div>
		          
	            <div class="row">
		          <div class="col-9 mb-3 text-left">
		            <label for="id" data-tooltip="영문, 숫자만 사용해주세요">아이디 <i class="fa-solid fa-circle-question" style="color: #538cee;"></i></label>
		            <input type="text" class="form-control" name="id" placeholder="아이디" required>
		            <div class="invalid-feedback">아이디를 입력해주세요.</div>
		          </div>
		          <div class="col-3 mb-3 text-center align-self-end">
		            <button class="btn btn-primary btn-sm btn-block" name="idBtn" type="button" disabled="disabled">중복확인</button>
		          </div>
	            </div>
		        
		        <div class="idCheckDiv" style="display:none; font-size: 14px;"></div>
		          
		          <div class="mb-3">
		            <label for="pw" data-tooltip="영문, 특수문자, 숫자만 사용해주세요">비밀번호 <i class="fa-solid fa-circle-question" style="color: #538cee;"></i></label>
		            <input type="password" class="form-control" name="pw" placeholder="비밀번호" required>
		            <div class="invalid-feedback">비밀번호를 입력하세요</div>
		          </div>
		          
		          <div class="mb-3">
		            <label for="pwCheck">비밀번호 확인</label>
		            <input type="password" class="form-control" name="pwCheck" placeholder="비밀번호 확인" required>
		            <div class="invalid-feedback">비밀번호를 입력하세요</div>
		          </div>
		          
		          <div class="pwCheckDiv" style="display:none; font-size: 14px;"></div>
		          
		          <div class="mb-3">
		            <label for="bizEmail">이메일</label>
		            <input type="text" class="form-control" name="bizEmail" placeholder="이메일" required>
		            <div class="invalid-feedback">이메일을 입력하세요</div>
		          </div>
		          
		          <div class="mb-3">
		            <label for="bizPhone">연락처</label>
		            <input type="text" class="form-control" name="bizPhone" placeholder="연락처" maxlength="13" required>
		            <div class="invalid-feedback">연락처를 입력하세요</div>
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
  <script src="<%= request.getContextPath() %>/resources/js/main/signup.js"></script>
  
  
</body>
</html>