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
						<!-- 검색 -->
						<div class="input-group my-3">
							<select name="searchType" id="searchType" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<input type="text" class="form-control" placeholder="검색해보세요" name="keyword" id="keyword">
							<button name="btnSearch" id="btnSearch" class="btn" type="submit">검색</button>
						</div>
					</div>
					<div>
						<form action="${pageContext.request.contextPath}/faq">
							<select name="cnt" onchange="submit();">
								<c:forEach var="num" begin="5" end="30" step="5">
									<option value="${num }" ${requestScope.paging.pageLimit eq num ? "selected" : "" }>${num }개</option>
								</c:forEach>
							</select>
						</form>
					</div>
					<% if (request.getParameter("keyword") != null && !request.getParameter("keyword").isEmpty()) { %>
					    <span>"<%=request.getParameter("keyword")%>"의 검색 결과입니다.</span>
					<% } %>
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
												<a href="${pageContext.request.contextPath}/faq/faqread/${faq.faqNo}">${faq.faqTitle}</a>
										</div>
									</div>
								</c:if>
								<c:if test="${faq.faqNo ne 1}">
									<div class="carousel-item">
										<img src="https://dummyimage.com/30x10" class="d-block w-100" alt="...">
										<div class="carousel-caption">
											<span>${faq.faqNo}</span> 
											<a href="${pageContext.request.contextPath}/faq/faqread/${faq.faqNo}">${faq.faqTitle}</a>
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
				<c:if test="${not empty requestScope.paging.page}">
					<c:forEach items="${requestScope.paging.page}" var="qna">
						<div class="row my-3">
							<div class="pb-1">
								<a href="${pageContext.request.contextPath}/faq/qna/${qna.aqNo}">${qna.aqTitle}</a>
							</div>
							<div class="small col-1 pe-0">조회 <fmt:formatNumber value="${qna.aqViews}" pattern="###,###"/></div>
							<div class="small col-9">답변 ${qna.aqAnswers }</div>
							<div class="small col-2 text-end"><fmt:formatDate value="${qna.aqDate}" pattern="yyyy.MM.dd HH:mm"/></div>
						</div>
						<hr>
					</c:forEach>
				</c:if>
			</div>
			<!-- 페이지 번호 -->
		     <c:if test="${not empty requestScope.paging.page}"> <!-- 신청서가 하나도 없으면 페이징X -->
				<ul class="pagination">
					<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
					<c:choose>
						<c:when test="${requestScope.paging.prevPage eq -1 }">
							<li class="page-item disabled"><a class="page-link">prev</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/faq?p=${requestScope.paging.prevPage }&searchType=${searchType }&keyword=${keyword }">prev</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="pNum" items="${requestScope.paging.pageList }">
						<li class="page-item ${pNum eq pageNumber ? 'active' : '' }">
						<a class="page-link" href="${pageContext.request.contextPath}/faq?p=${pNum }&searchType=${searchType }&keyword=${keyword }">${pNum }</a>
						</li>
					</c:forEach>
					<c:choose>
						<c:when test="${requestScope.paging.nextPage eq -1 }">
							<li class="page-item disabled"><a class="page-link">next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/faq?p=${requestScope.paging.nextPage }&searchType=${searchType }&keyword=${keyword }">next</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			  </c:if>
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
	
	<script>
	//검색
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			var url="${pageContext.request.contextPath}/faq";
			url = url + "?searchType="+$('#searchType').val();
			url = url + "&keyword="+$('#keyword').val();
			location.href=url;
			console.log(url);
			
		});
	</script>
</body>
</html>