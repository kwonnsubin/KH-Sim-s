<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<link rel="stylesheet" href="${path}/resources/css/biz/myPage.css"/>
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
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
    <!-- google icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
    <!-- 구글차트 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
	    google.charts.load('current', {packages: ['corechart', 'line']});
	    google.charts.setOnLoadCallback(drawBasic);
	    
	    function drawBasic(){
	    	$.ajax({
    			  url : "${pageContext.request.contextPath}/biz/chart.aj"
	    		, type : "post"
	    		, dataType : "json"
	    		, success : function(json){
	    			console.log("json :"+json); /* [object Object],[object Object] */
	    			console.log(json); /* [object Object],[object Object] */
	    			
	    			var data = new google.visualization.DataTable();
	    				data.addColumn('string','일자');
	    				data.addColumn('number','가입자 수');
	    				for(var i=0; i < json.length; i++){
	    					data.addRow([json[i].orderDate, json[i].orderCnt]);
	    				}
	    				console.log("data : "+ data); /* [object Object] */

	    				var options = {
	    				        hAxis: {
	    				          /* title: 'x축 명' */
	    				        },
	    				        vAxis: {
	    				          title: '(명)'
	    				       	, format: '#'
	    				        }
	    				      };

	    				      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

	    				      chart.draw(data, options);
	    		}
	    	});
	    }
	    
    </script>
    
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>

	<div class="container" style="display:flex; margin:-103px 0 -200px 0; padding:150px 0 380px 0;">
		<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
	
		<div class="container">
			<div class="container d-flex content">
				<div class="container">
				컨테이너 1
					<div class="text-center" style="margin-top: 125px!important;">
						<img src="${path}${imagePath}" class="mx-auto" style="width: 70% !important"/>
					</div> 
				
				</div>
				
				<div class="container" style="display: grid; grid-template-columns: repeat(2, 1fr); grid-template-rows: repeat(2, 1fr);">
				컨테이너 2
					<div class="cntMentBox" style="grid-column: 1 / 2; grid-row: 1 / 2;">
						오늘 등록된 리뷰 수는 ${todayReviewCnt }개입니다. 
					</div>
					<div class="cntMentBox" style="grid-column: 2 / 2; grid-row: 1 / 2;">
						총 리뷰 수는 ${totalReviewCnt }개입니다. 
					</div>
					<div class="cntMentBox" style="grid-column: 1 / 2; grid-row: 2 / 2;">
						오늘 가입한 고객의 수는 ${todayApplyCnt }명입니다. 
					</div>
					<div class="cntMentBox" style="grid-column: 2 / 2; grid-row: 2 / 2;">
						총 가입자 수는 ${totalApplyCnt }명입니다. 
					</div>
					<div class="cntMentBox">
						총 등록한 요금제 수는 ${totalPlanCnt }개입니다. 
					</div>
				
				</div>
			</div>
			
			<div class="container">
				<div id="chart_div"></div>
			</div>
			
			<div class="container" style="border: solid; height: 400px">
			상위 5개 요금제 정보 -요금제 번호, 요금제명, 기본료, 등록일자
			</div>
			
			<div class="container" style="border: solid; height: 400px">
			최근 리뷰
				<div class="review-wrapper">
					<c:forEach var="recentReview" items="${recentReview}">
					    <div class="review-box">
					        <div class="review-header">
					            <div class="review-header-item">${recentReview.userId}</div>
					        </div>
					        <div class="review-content">
								<!-- 텍스트가 25자 이상인 경우 자름 -->
								<c:choose>
								  <c:when test="${fn:length(recentReview.reviewContent) > 25}">
								    ${fn:substring(recentReview.reviewContent, 0, 25)}&middot; &middot; &middot;
								  </c:when>
								  <c:otherwise>
								    ${recentReview.reviewContent}
								  </c:otherwise>
								</c:choose>	
					        </div>
					        <div class="review-footer">
					            <div class="review-footer-item">
					                <div class="form-control-plaintext">
					                    <c:forEach var="i" begin="1" end="5">
					                        <i class="fa${(recentReview.reviewStar)/2 >= i ? '-solid fa-star' : ((recentReview.reviewStar)/2 >= (i - 0.5) ? '-star-half-stroke fa-regular' : '-regular fa-star')}" style="color: #ffdd00;"></i>
					                    </c:forEach>
					                </div>
					            </div>
					            
					               <div class="review-footer-item">${recentReview.reviewDate}</div>
					           
					        </div>
					    </div>
					</c:forEach>
				</div>	
			</div>
		</div>	
			
	</div>




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