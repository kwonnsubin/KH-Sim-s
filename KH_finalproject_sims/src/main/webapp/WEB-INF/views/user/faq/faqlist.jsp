<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
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
	
	<title>자주묻는질문 목록</title>
	
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		
	 <!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/qna.css">
    
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<section>
		<div class="container-sm div-m">
			<div class="row">
				<div class="col-lh-12 my-3">
					<h5 class="py-3 fw-bolder">자주 묻는 질문</h5>
					<c:if test="${not empty faqlist }">
						<c:forEach items="${faqlist}" var="faq">
							<div class="row py-3 div-hover">
								<div class="pb-1">
									<a href="${cpath}/faq/${faq.faqNo}">${faq.faqTitle}</a>
								</div>
							</div>
							<hr>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
	<!-- Scripts -->
	<script src="<%=request.getContextPath()%>/resources/chain/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%=request.getContextPath()%>/resources/chain/assets/js/animation.js"></script>
	<script src="<%=request.getContextPath()%>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%=request.getContextPath()%>/resources/chain/assets/js/popup.js"></script>
	<script src="<%=request.getContextPath()%>/resources/chain/assets/js/custom.js"></script>
	
</body>
</html>