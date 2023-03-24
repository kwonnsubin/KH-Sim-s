<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
</head>
<body>
	<jsp:include page="../../header.jsp"/>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-10 p-2" style="float: none; margin-top: 100px;">
					<h5 class="py-2 fw-bolder">알뜰폰 궁금한 점 무엇이든 물어보세요</h5>
					<!-- ***** 검색창 TODO ***** -->
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
			<div class="row">
				<div class="col-lg-12 p-2">
					<table class="table table-hover table-group-divider mt-3 mb-3">
						<thead class="table-light text-center">
							<tr>
								<th class="text-center">번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<c:forEach items="${qnalist}" var="qna">
							<tbody>
								<tr>
									<td class="text-center">${qna.aqNo}</td>
									<td class="text-center">
									<a href="<%=request.getContextPath()%>/faq/qnaread/${qna.aqNo}">${qna.aqTitle}</a>
									</td>
									<td class="text-center">${qna.aqDate}</td>
									<td class="text-center">${qna.aqViews}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
			<button type="button">내 질문/답변</button>
			<button type="button" onclick="location.href='qnawrite'">질문하기</button>
			<!-- ***** 일반 질문 end ***** -->
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

</body>
</html>