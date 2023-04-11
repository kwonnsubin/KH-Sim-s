<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	<title>자주묻는질문</title>
	
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
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	<section>
		<div class="container-sm div-m">
			<div class="row">
				<div class="col-lg-12 p-2">
					<h5 class="py-3 fw-bolder">알뜰폰 궁금한 점 무엇이든 물어보세요</h5>
					<div class="row">
						<form action="<%=request.getContextPath()%>/faq/" method="post">
							<div class="input-group my-3">
								<select name="searchOption" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
									<option value="">선택</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select>
								<input type="text" class="form-control" placeholder="검색해보세요" name="searchBox" value="${searchBox }">
								<button class="btn" type="submit">검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- ***** 자주묻는질문 Start ***** -->
			<div class="row">
				<div class="col-lg-12 p-2">
					<h6 class="py-2 fw-bolder">자주 묻는 질문</h6>
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner">
							<c:forEach items="${faqlist}" var="faq">
								<c:if test="${faq.faqNo eq 1}">
									<div class="carousel-item active">
										<img src="https://dummyimage.com/30x10" class="d-block w-100" alt="...">
										<div class="carousel-caption">
											<span>${faq.faqNo}</span> 
												<a href="<%=request.getContextPath()%>/faq/faqread/${faq.faqNo}">${faq.faqTitle}</a>
										</div>
									</div>
								</c:if>
								<c:if test="${faq.faqNo ne 1}">
									<div class="carousel-item">
										<img src="https://dummyimage.com/30x10" class="d-block w-100" alt="...">
										<div class="carousel-caption">
											<span>${faq.faqNo}</span> 
											<a href="<%=request.getContextPath()%>/faq/faqread/${faq.faqNo}">${faq.faqTitle}</a>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
			<!-- ***** 자주묻는질문 end ***** -->
			
			<!-- ***** 일반 질문 Start ***** -->
			<div class="col-lg-12 py-2">
				<c:if test="${not empty qnalist }">
					<c:forEach items="${qnalist }" var="qna">
						<div class="row my-3">
							<div class="pb-1">
								<a href="<%=request.getContextPath()%>/faq/qna/${qna.aqNo}">${qna.aqTitle}</a>
							</div>
							<div class="small col-1 pe-0">조회 <fmt:formatNumber value="${qna.aqViews}" pattern="###,###"/></div>
							<div class="small col-9">답변 ${qna.aqAnswers }</div>
							<div class="small col-2 text-end"><fmt:formatDate value="${qna.aqDate}" pattern="yyyy.MM.dd HH:mm"/></div>
						</div>
						<hr>
					</c:forEach>
				</c:if>
			</div>
			<sec:authorize access="hasRole('ROLE_USER')">
				<button type="button" onclick="location.href='myqna'">내 질문/답변</button>
				<button type="button" onclick="location.href='qna/write'">질문하기</button>
			</sec:authorize>
			<!-- ***** 일반 질문 end ***** -->
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

</body>
</html>