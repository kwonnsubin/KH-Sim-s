<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>

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
	    			console.log(json); 
	    			
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
		
		
		<%
		  Date date = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm 기준");
		  String currentTime = sdf.format(date);
		%>
		
		
		<div class="container" style="margin-left: 142px; width: 81%;">
			<div class="container">
			 <p><%=currentTime%></p>
			</div>
			
			<div class="container d-flex content">
			
				<div class="container logo-img">
					<div class="text-center">
						<img src="${path}${imagePath}" class="mx-auto" style="width: 70% !important"/>
					</div> 
				</div>
				
				<div class="container" style="display: grid; grid-template-columns: repeat(2, 1fr); grid-template-rows: repeat(2, 1fr);">
					<div class="cntMentBox" style="grid-column: 1 / 2; grid-row: 1 / 2;">
						<div class="cntMentBox-header">
							<div class="material-symbols-outlined" >
							rate_review
							</div>
						</div>
						<div class="cntMentBox-content">
						오늘 등록된 리뷰 수는 <span>${todayReviewCnt }</span>개입니다.
						</div>
					</div>
					
					<div class="cntMentBox" style="grid-column: 2 / 2; grid-row: 1 / 2;">
						<div class="cntMentBox-header">
							<div class="material-symbols-outlined" >
							rate_review
							</div>
						</div>
						<div class="cntMentBox-content">
						총 리뷰 수는 <span>${totalReviewCnt }</span>개입니다. 
						</div>
					</div>
					
					<div class="cntMentBox" style="grid-column: 1 / 2; grid-row: 2 / 2;">
						<div class="cntMentBox-header">
							<span class="material-symbols-outlined">
							group_add
							</span>
						</div>
						<div class="cntMentBox-content">
						오늘 가입한 고객의 수는 <span>${todayApplyCnt }</span>명입니다. 
						</div>
					</div>
					<div class="cntMentBox" style="grid-column: 2 / 2; grid-row: 2 / 2;">
						<div class="cntMentBox-header">
							<span class="material-symbols-outlined">
							group_add
							</span>
						</div>
						<div class="cntMentBox-content">
						총 가입자 수는 <span>${totalApplyCnt }</span>명입니다. 
						</div>
					</div>
					<div class="cntMentBox" style="width: 195%;">
						<div class="cntMentBox-header">
							<span class="material-symbols-outlined">
							order_approve
							</span>
						</div>
						<div class="cntMentBox-content">
						총 등록한 요금제 수는 <span>${totalPlanCnt }</span>개입니다.
						</div> 
					</div>
					
					
				
				</div>
			</div>
			
			<div class="container" style="margin-top: 9%;">
				<div>
					<span class="mini-title">최근 7일간 가입자 수</span>
				</div>
				<div id="chart_div" style="height: 500px;"></div>
			</div>
			
			<div class="container" style="height: 400px">
					
				<div>
					<span class="mini-title">인기있는 요금제</span>
				</div>	
				<table class="table topPlanInfo table-hover">
					<thead>
						<tr>
							<th>요금제 번호</th>
							<th>요금제 이름</th>
							<th>기본료</th>
							<th>등록일자</th>
							<th>누적 가입자수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pl" items="${topPlanList }">
						<tr>
							<td>${pl.planNo }</td>
							<td><a href="${pageContext.request.contextPath }/biz/planDetail?planNo=${pl.planNo }">
								${pl.planName }</a></td>
							<td>${pl.planPrice }</td>
							<td>${pl.planDate }</td>
							<td>${pl.planCnt }</td>
						</tr>
						</c:forEach>
					</tbody>
				
				</table>
			
			</div>
			
			<div class="container" style="margin-top: 9%;">
				<div>
					<span class="mini-title">최근 리뷰</span>
				</div>
				
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
					<div class="review-box" style="display: flex; align-items: center;"> <!-- 더보기 박스 -->
						
						<a class="material-symbols-outlined more-icon" onclick="location.href='${pageContext.request.contextPath}/biz/reviewList'"
						 		style="font-size: 220px; color: darkgray;  margin: auto; line-height: 0 !important;">
								read_more
						</a>
					</div>
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