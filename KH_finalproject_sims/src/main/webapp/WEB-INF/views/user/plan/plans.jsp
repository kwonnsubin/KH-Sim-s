<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

	<title>회원가입</title>
	
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
    
  </style>
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
	       		<div class="vr"></div>
	       		<div class="col m-3 filter-area">
	       			<p>통화량</p>
	       			<p class="fs-4">전체</p>
	       		</div>
	       		<div class="vr"></div>
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
				<div class="vr"></div>
				<div class="col-2 text-center">
					<button type="button" class="btn btn-light btn-outline-secondary modalBtn" data-bs-toggle="modal" data-bs-target="#filter-modal">
						필터
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="filter-modal" tabindex="-1" aria-labelledby="filter-modal" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="filter-modal">Modal title</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
					        	...
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
	    		<div class="col-9">
	    			<div>
	    				<p class="ms-3">총 ${cnt}개</p>
	    			</div>
	    			<c:forEach var="list" items="${planList}">
	    			<div class="row mt-3 list-div">
	    				<div class="col-8">
	    					<p>${list.bizName}</p>
	    					<p>${list.planName}</p>
	    					<p>${list.planData}MB + ${list.planVoice}분 + ${list.planMessage}건</p>
	    				</div>
	    				<div class="col-4 text-end">
	    					<p>${list.planPrice}원</p>
	    					<button type="button" class="btn btn-primary btn-sm">자세히 보기</button>
	    				</div>
	    			</div>
	    			</c:forEach>
	    		</div>
	    		<div class="col-3">
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