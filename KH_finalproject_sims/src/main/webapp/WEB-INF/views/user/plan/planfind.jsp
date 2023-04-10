<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

	<title>요금제</title>
	
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/planfind.css"/>

</head>
<body>

	<jsp:include page="../../header.jsp"/>
	
	<section>
		<div class="container d-flex justify-content-center">
			<div class="row row-div">
				<div class="col-12">
					<div class="telecom" style="display: none;">
						<div class="my-5">
							<h4>현재 이용중인</h4>
							<h4>통신사를 선택해주세요</h4>
						</div>
						<div class="rdo-button">
							<fieldset>
								<label class="my-3 rdo-label">
							    	<input type="radio" name="telecom" value="1"/>
							    	<span class="px-2">SKT</span>
								</label>
							
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="telecom" value="2" />
							    	<span class="px-2">KT</span>
							  	</label>
							
							 	<label class="my-3 rdo-label">
							    	<input type="radio" name="telecom" value="3" />
							    	<span class="px-2">LGU+</span>
							  	</label>
							
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="telecom" value="4" />
							    	<span class="px-2">알뜰폰</span>
							  	</label>
							</fieldset>
						</div>
					</div>
					
					<div class="data" style="display: none;">
						<div class="my-5">
							<h4>일일 데이터</h4>
							<h4>사용량을 선택해주세요</h4>
						</div>
						<div class="rdo-button">
							<fieldset>
								<label class="my-3 rdo-label">
							    	<input type="radio" name="data" value="1"/>
							    	<span class="px-2">3시간 이상</span>
								</label>
							
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="data" value="2" />
							    	<span class="px-2">1시간 이상</span>
							  	</label>
							
							 	<label class="my-3 rdo-label">
							    	<input type="radio" name="data" value="3" />
							    	<span class="px-2">30분 이상</span>
							  	</label>
							
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="data" value="4" />
							    	<span class="px-2">카톡 인터넷만</span>
							  	</label>
							  	
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="data" value="5" />
							    	<span class="px-2">거의 안해요</span>
							  	</label>
							</fieldset>
						</div>
					</div>
					
					<div class="speed" style="display: none;">
						<div class="my-5">
							<h4>선호하는</h4>
							<h4>데이터 속도를 선택해주세요</h4>
						</div>
						<div class="rdo-button">
							<fieldset>
								<label class="my-3 rdo-label">
							    	<input type="radio" name="speed" value="1"/>
							    	<span class="px-2">5G</span>
								</label>
							
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="speed" value="2" />
							    	<span class="px-2">LTE</span>
							  	</label>
							  	
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="speed" value="3" />
							    	<span class="px-2">3G</span>
							  	</label>
							</fieldset>
						</div>
					</div>
					
					<div class="voice" style="display: none;">
						<div class="my-5">
							<h4>선호하는</h4>
							<h4>데이터 속도를 선택해주세요</h4>
						</div>
						<div class="rdo-button">
							<fieldset>
								<label class="my-3 rdo-label">
							    	<input type="radio" name="voice" value="1"/>
							    	<span class="px-2">3시간 이상</span>
								</label>
							
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="voice" value="2" />
							    	<span class="px-2">1시간 이상</span>
							  	</label>
							  	
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="voice" value="3"/>
							    	<span class="px-2">30분 이상</span>
								</label>
							
							  	<label class="my-3 rdo-label">
							    	<input type="radio" name="voice" value="4" />
							    	<span class="px-2">거의 안해요</span>
							  	</label>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="../../footer.jsp"/>
	
  <!-- Scripts -->
  <script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
  <script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
  <script src="<%= request.getContextPath() %>/resources/js/user/planfind.js"></script>
  
  
</body>
</html>