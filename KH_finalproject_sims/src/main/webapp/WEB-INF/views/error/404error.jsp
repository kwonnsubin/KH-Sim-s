<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
<link rel="stylesheet" href="${path}/resources/css/error404.css"/>
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
	<%-- <jsp:include page="/WEB-INF/views/header.jsp"/> --%>
	
	<div class="container">
	
		<div class="text-center" style="margin-top: 70px; width: 100%;">
			<img src="${path}/resources/img/error.png" onerror="this.onerror=null; this.src='https://www.dummyimage.com/600x400/000/fff.jpg&text=Please+upload+your+logo';" class="mx-auto"
				style="width: 41% !important" />
		</div>
	
		<div class="error-memt">
			<h3>죄송합니다. 페이지를 찾을 수 없습니다.</h3> <br>
			요청하신 페이지가 사라졌거나 존재하지 않는 주소를 입력하셨습니다. <br>
			궁금한 점이 있으시면 언제든 Sim-s 고객센터를 통해 문의해 주시기 바랍니다.
		</div>
		
		<div class="btnGroup">
			<button class="btn" type="button" onclick="location.href='${pageContext.request.contextPath}'">메인으로</button>
			<button class="btn" type="button" onclick=history.back()>이전 페이지</button>
		</div>
		
	</div>




<%-- 	<jsp:include page="/WEB-INF/views/footer.jsp"/> --%>
	
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