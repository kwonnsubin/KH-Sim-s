<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
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
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/plans.css"/>
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>

	<jsp:include page="../../header.jsp"/>
	<section>
		<div class="container-fluid d-flex justify-content-center filter-div">
	       	<div class="row align-self-center border-0 rounded-3">
	       		<div class="col m-3 filter-area">
	       			<p>데이터</p>
	       			<p class="fs-4">전체</p>
	       		</div>
	       		<div class="col m-3 filter-area">
	       			<p>통화량</p>
	       			<p class="fs-4">전체</p>
	       		</div>
	       		<div class="col m-3 filter-area">
	       			<p>가격</p>
	       			<p class="fs-4">전체</p>
	       		</div>
	       	</div>
       	</div>
 		<div class="container-fluid d-flex justify-content-center">
			<div class="row my-3 mt-4 choose-div">
				<div class="col-2 text-center">
	        		<div class="select-div">
					  <select class="select text-start" id="floatingSelect" aria-label="select">
					    <option value="선택순" selected>선택순</option>
					    <option value="별점순">별점순</option>
					    <option value="추천순">추천순</option>
					  </select>
					</div>
				</div>
				<div class="col-2 text-center">
					<button type="button" class="btn btn-light btn-outline-secondary modalBtn" data-bs-toggle="modal" data-bs-target="#filter-modal">
						필터
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="filter-modal" tabindex="-1" aria-labelledby="filter-modal" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header-div">
									<div class="row m-3 mb-1">
										<div class="col text-start">
											<h5 class="modal-title" id="filter-modal" style="font-weight: bold">필터</h5>
										</div>
										<div class="col text-end">
											<button type="button" class="btn-close text-end" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
									</div>
									<div class="btn-div text-start mx-3">
										<button data-target="#planData">데이터</button>
										<button data-target="#planVoice">통화량</button>
										<button data-target="#planMessage">문자량</button>
										<button data-target="#netName">통신망</button>
										<button data-target="#genName">통신기술</button>
										<button data-target="#bizName">통신사</button>
									</div>
									<hr style="border:0;border-top:1px solid #555;margin:0;height:1px;" />
								</div>
								<div class="modal-body overflow-auto">
					        		<div class="filter-list text-start">
					        			<div id="planData">
					        				<div>
						        				<p>데이터</p>
					        				</div>
					        				<div>
					        					
					        				</div>
					        			</div>
					        			<div id="planVoice">
					        				<p>통화량</p>
					        			</div>
					        			<div id="planMessage">
					        				<p>문자량</p>
					        			</div>
					        			<div id="netName">
					        				<p>통신망</p>
					        			</div>
					        			<div id="genName">
					        				<p>통신기술</p>
					        			</div>
					        			<div id="bizName">
					        				<p>통신사</p>
					        			</div>
					        		</div>
					      		</div>
					      		<div class="modal-footer">
					        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        		<button type="button" class="btn btn-primary">Save changes</button>
					      		</div>
				    		</div>
					  	</div>
					</div>
				</div>
			</div>
	    </div>
	    <div class="container-fluid d-flex justify-content-center mt-3">
	    	<div class="row list-par-div">
	    		<div class="col-8">
	    			<div>
	    				<p class="ms-3">총 ${cnt}개</p>
	    			</div>
	    			<c:forEach var="list" items="${planList}">
	    			<div class="row mt-3 list-div">
	    				<div class="col-8">
	    					<p>${list.bizName}</p>
	    					<p>${list.planName}</p>
	    					<p>
	    					<c:if test="${list.planData lt 1000}">
	    					${list.planData}MB 
	    					</c:if>
	    					<c:if test="${list.planData gt 1000}">
	    					<fmt:formatNumber var="data" type="number" maxFractionDigits="1" value="${list.planData / 1000}" />
	    					${data}G
	    					</c:if>
	    					+ ${list.planVoice}분 + ${list.planMessage}건</p>
	    				</div>
	    				<div class="col-4 text-end">
	    					<p>${list.planPrice}원</p>
	    					<button type="button" class="btn btn-primary btn-sm">자세히 보기</button>
	    				</div>
	    			</div>
	    			</c:forEach>
	    		</div>
	    		<div class="col-4">
	    			<div class="input-div">
	    				<input type="text" class="form-control" placeholder="검색어">
	    				<span class="material-symbols-outlined search-icon">search</span>
	    			</div>
	    			<div class="row my-4">
        				<div class="col">
	        				최근 본 요금제
        				</div>
        				<div class="col text-end">
	        				더보기
        				</div>
        			</div>
        			<div class="mt-3 recent-list">
	    				<div>
	    					<p>요금제 이름</p>
	    					<p>요금제 가격</p>
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
  <script src="<%= request.getContextPath() %>/resources/js/main/plans.js"></script>
  
  
</body>
</html>