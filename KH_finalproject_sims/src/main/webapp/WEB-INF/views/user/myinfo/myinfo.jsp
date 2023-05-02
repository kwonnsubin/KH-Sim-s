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

	<title>Sims</title>
	
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

      margin-top: 60px;
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
	        <h4 class="mb-3">내 정보</h4>
		        
	        <c:url value="/mypage/myinfo" var="myinfoUrl" />
	        <form:form class="userForm validation-form" name="f" action="${myinfoUrl}" method="post" novalidate="novalidate">
	        
	        <!-- 권한 -->
	        <input type="hidden" name="role" value="ROLE_USER">
	      
	        <div class="mb-3">
	              <label for="userName">이름</label>
	              <input type="text" class="form-control" name="userName" value="${userInfo.userName}" style="background-color:white;" readonly>
	              <div class="invalid-feedback">이름을 입력해주세요.</div>
	        </div>
	        
	        <div class="mb-3">
	              <label for="id">아이디</label>
	              <input type="text" class="form-control" name="id" value="${userInfo.userId}" style="background-color:white;" readonly>
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
	        
	        <!-- 성별 -->
           	<label for="genderDiv">성별</label>
            <div class="row text-center">
	          <div class="col input-group mb-3">
				  <div class="input-group-text">
				  	<c:if test="${userInfo.userGender eq 'F'}">
				    	<input class="form-check-input mt-0" type="radio" value="F" name="userGender" checked>
				    </c:if>
				    <c:if test="${userInfo.userGender ne 'F'}">
				    	<input class="form-check-input mt-0" type="radio" value="F" name="userGender">
				    </c:if>
				  </div>
				  <input type="text" class="form-control" value="여성" readonly style="background-color:white;">
			  </div>
			  <div class="col input-group mb-3">
				  <div class="input-group-text">
				  	<c:if test="${userInfo.userGender eq 'M'}">
				    	<input class="form-check-input mt-0" type="radio" value="M" name="userGender" checked>
				    </c:if>
				    <c:if test="${userInfo.userGender ne 'M'}">
				    	<input class="form-check-input mt-0" type="radio" value="M" name="userGender">
				    </c:if>
				  </div>
				  <input type="text" class="form-control" value="남성" readonly style="background-color:white;">
			  </div>
        	</div>
	        
	        <div class="text-center mt-5">
		       	<button class="btn btn-primary mx-3 subBtn" type="submit" disabled>수정</button>
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