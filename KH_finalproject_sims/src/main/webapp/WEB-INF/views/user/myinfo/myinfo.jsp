<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- %@ page session="false" % -->
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
    
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<c:if test="${empty kakaoToken}">
		<div class="container info-pw-div">
			<div class="input-form-backgroud row">
	      		<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3">비밀번호 확인</h4>
					<h6>정보 확인을 위해 비밀번호를 입력해주세요</h6>
					<div class="row">
						<div class="col-9">
			            	<input type="password" class="form-control mt-3 info-pw" placeholder="비밀번호">
						</div>
						<div class="col-3 text-center align-self-end">
							<button class="btn btn-primary btn-sm btn-block info-pw-btn" type="button" style="padding-top:0px; padding-bottom: 0px; height: 38px;">확인</button>
						</div>
						<div class="info-pw-alert" style="color:red; font-size:14px; display:none;">비밀번호가 다릅니다.</div>
					</div>
				</div>
			</div>
		</div>
		</c:if>
		
	  <c:if test="${not empty kakaoToken}">
	  	<div class="container myinfo-div">
	  </c:if>
	  <c:if test="${empty kakaoToken}">
	  	<div class="container myinfo-div" style="display: none;">
	  </c:if>
	    <div class="input-form-backgroud row">
	      <div class="input-form col-md-12 mx-auto">
	        <h4 class="mb-3">내 정보</h4>
		        
	        <c:url value="/mypage/myinfo" var="myinfoUrl" />
	        <form:form class="userForm validation-form" name="f" action="${myinfoUrl}" method="post" novalidate="novalidate">
	        
	        <!-- 권한 -->
	        <input type="hidden" name="role" value="ROLE_USER">
	      
	        <div class="mb-3">
	              <label for="userName">이름</label>
	              <input type="text" class="form-control" name="userName" value="${userInfo.userName}" style="background-color:white; cursor:default;" readonly>
	              <div class="invalid-feedback">이름을 입력해주세요.</div>
	        </div>
	        
	        <div class="mb-3">
	              <label for="id">아이디</label>
	              <input type="text" class="form-control" name="id" value="${userInfo.userId}" style="background-color:white; cursor:default;" readonly>
	              <div class="invalid-feedback">아이디를 입력해주세요.</div>
	        </div>
	        
	        <c:if test="${empty kakaoToken}">
	        <div>
		        <div class="mb-3">
		            <label for="pw" data-tooltip="영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8-16자리 암호를 작성해주세요">비밀번호 <i class="fa-solid fa-circle-question" style="color: #538cee;"></i></label>
		            <input type="password" class="form-control inputPw" name="pw" placeholder="비밀번호">
		            <div class="invalid-feedback">비밀번호를 입력하세요</div>
		        </div>
		        
		        <div class="passwdCheck" style="display:none; font-size: 14px;"><p style='color: red;'>양식에 맞게 작성해주세요.</p></div>
		          
		        <div class="mb-3">
		            <label for="pwCheck">비밀번호 확인</label>
		            <input type="password" class="form-control" name="pwCheck" placeholder="비밀번호 확인">
		            <div class="invalid-feedback">비밀번호를 입력하세요</div>
		        </div>
		          
		        <div class="pwCheckDiv" style="display:none; font-size: 14px;"></div>
	        </div>
	        </c:if>
				
            <div class="row">
	          <div class="col-9 mb-3 text-left">
	            <label for="userEmail">이메일</label>
	            <input type="email" class="form-control" name="userEmail" value="${userInfo.userEmail}" required>
	            <div class="invalid-feedback">이메일을 입력해주세요.</div>
	          </div>
	          <div class="col-3 mb-3 text-center align-self-end">
	            <button class="btn btn-primary btn-sm btn-block" name="emailBtn" type="button" style="padding-top:0px; padding-bottom: 0px; height: 38px;">본인인증</button>
	          </div>
            </div>
	
	        <div class="mb-3">
	            <label for="emailCheck">인증번호</label>
	            <input type="text" class="form-control" name="emailCheck" placeholder="인증번호">
	            <div class="invalid-feedback">인증번호를 입력하세요</div>
	        </div>
		          
	        <div class="emailCheckDiv" style="display:none; font-size: 14px;"></div>
	        
	        <div class="mb-3">
	            <label for="userPhone">전화번호</label>
	            <input type="text" class="form-control" name="userPhone" value="${userInfo.userPhone}" maxlength="13" pattern="[0-9\-]*" oninput="checkInput(event)" onkeyup="autoHyphenPhone(this)" required>
	            <div class="invalid-feedback">전화번호를 입력하세요</div>
	            <div class="error-message mt-2" style="display:none; color: red; font-size: 14px;">숫자만 입력 가능합니다.</div>
	        </div>
	        
	        <!-- 성별 -->
           	<label for="genderDiv">성별</label>
            <div class="row text-center">
	          <div class="col input-group mb-3">
				  <div class="input-group-text">
				  	<c:if test="${userInfo.userGender eq 'F'}">
				    	<input class="form-check-input mt-0 radioCheck" type="radio" value="F" name="userGender" checked>
				    </c:if>
				    <c:if test="${userInfo.userGender ne 'F'}">
				    	<input class="form-check-input mt-0 radioCheck" type="radio" value="F" name="userGender">
				    </c:if>
				  </div>
				  <input type="text" class="form-control genderInput1" value="여성" readonly style="background-color:white; cursor:default; outline:none;">
			  </div>
			  <div class="col input-group mb-3">
				  <div class="input-group-text">
				  	<c:if test="${userInfo.userGender eq 'M'}">
				  		<input class="form-check-input mt-0 radioCheck" type="radio" value="M" name="userGender" checked>
				  	</c:if>
				  	<c:if test="${userInfo.userGender ne 'M'}">
				    	<input class="form-check-input mt-0 radioCheck" type="radio" value="M" name="userGender">
			    	</c:if>
				  </div>
				  <input type="text" class="form-control genderInput2" value="남성" readonly style="background-color:white; cursor:default; outline:none;">
			  </div>
        	</div>
	        
	        <div class="text-center mt-5">
		       	<button class="btn btn-primary mx-3 subBtn" type="submit">수정</button>
		       	<button type="button" class="btn btn-primary mx-3" data-bs-toggle="modal" data-bs-target="#relModal">탈퇴</button>
        	</div>
	        
	        </form:form>
	      </div>
	    </div>
	    </div>
	    
	    <div class="modal fade" id="relModal" tabindex="-1" aria-labelledby="relModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="relModalLabel">계정 탈퇴</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">탈퇴하려면 확인을 눌러주세요.</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary relBtn">확인</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
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
  <script src="<%= request.getContextPath() %>/resources/js/user/myinfo.js"></script>
  
  
</body>
</html>