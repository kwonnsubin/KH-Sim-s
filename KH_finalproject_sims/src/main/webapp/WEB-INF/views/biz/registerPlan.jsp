<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
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

<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/biz/registerPlan.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
    
    <!-- google icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>


	<div class="container" style="display:flex; margin:-103px 0 -200px 0; padding:150px 0 380px 0;">
		<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
		
		<div class="content">
			<div class="container" style="margin-left: 6px;">
				<h2 class="tit">요금제 등록하기</h2>
				<hr class="line">
			</div>
		
			<form action="registerPlan" method="post" class="needs-validation regiForm" novalidate>
		        <!-- 테이블 적용 s-->
		        <table class="table" style="width:120%; height:453px;" id="regiPlanTb">
				<tr>
					<th>
						<span>요금제명</span>
					</th>
					<td><input type="text" name="planName"  class="form-control" required>
					<div class="invalid-feedback">
				      요금제명을 입력해주세요. 
				    </div>
				    </td>
					
					<th>
						<span>통신사명</span>
					</th>
					<td><input type="hidden" name="bizName"  value="${vo.bizName}" >${vo.bizName}</td> <!-- 통신사명은 변경 불가 -->
				</tr>
				<tr>
					<th>
						<span>통신망</span>
					</th>
					<td>
						<select name="netNo" class="form-select" required>
						  <option value="1">SKT</option>
		               	  <option value="2">KT</option>
		                  <option value="3">LGU+</option>
						</select>
					</td>
					
					<th>
						<span>통신세대</span>
					</th>
					<td>
						<select name="genNo" class="form-select" required>
						    <option value="1">5G</option>
		                	<option value="2">LTE</option>
		                    <option value="3">3G</option>
		                    <option value="4">LTE/3G</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						<span>기본료(원)</span>
					</th>
					<td><input type="text" name="planPrice" class="form-control" required>
					<div class="invalid-feedback">
				      값을 입력해주세요. 
				    </div></td>
					<th>
						<span>기본음성(분)</span>
					</th>
					<td><input type="text" name="planVoice" class="form-control" required>
					<div class="invalid-feedback">
				      값을 입력해주세요. 
				    </div>
					</td>
				</tr>
				<tr>
					<th>
						<span>기본문자(건)</span>
					</th>
					<td><input type="text" name="planMessage" class="form-control" required >
					<div class="invalid-feedback">
				      값을 입력해주세요. 
				    </div></td>
					<th>
						<span>기본데이터(mb)</span>
					</th>
					<td><input type="text" name="planData" class="form-control" required>
					<div class="invalid-feedback">
				      값을 입력해주세요. 
				    </div></td>
				</tr>
				<tr>
					<th>
						<span>초과음성단가(초)</span>
					</th>
					<td><input type="text" name="planVoiceOver" class="form-control" required>
					<div class="invalid-feedback">
				      값을 입력해주세요. 
				    </div></td>
					<th>
						<span>초과문자단가(건)</span>
					</th>
					<td><input type="text" name="planMessageOver" class="form-control" required>
					<div class="invalid-feedback">
				      값을 입력해주세요. 
				    </div></td>
					<th>
						<span>초과데이터단가(mb)</span>
					</th>
					<td><input type="text" name="planDataOver" class="form-control" required>
					<div class="invalid-feedback">
				      값을 입력해주세요. 
				    </div></td>
				</tr>
			</table>
		        
		        <!-- 테이블 적용 e -->
		        
		        <div class="btnGroup">
			        <button type="button" onclick="goList()" class="btn">취소</button>
			        <button type="submit" class="btn">등록</button>
			        <%-- location.href='${pageContext.request.contextPath}/biz/planList' --%>
		        </div>
		    </form>
		    
    <!-- 등록이 되면 등록이 되었다는 창이 뜨게 하고 요금제 목록 창으로  -->
    	</div>
    </div>	
 
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<script>
	function goList() {
	  location.href='${pageContext.request.contextPath}/biz/planList';
	}
	</script>    
	
	<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
		(() => {
		  'use strict'
		
		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  const forms = document.querySelectorAll('.needs-validation')
		
		  // Loop over them and prevent submission
		  Array.from(forms).forEach(form => {
		    form.addEventListener('submit', event => {
		      if (!form.checkValidity()) {
		        event.preventDefault()
		        event.stopPropagation()
		      }
		
		      form.classList.add('was-validated')
		    }, false)
		  })
		})()
	</script>
	
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