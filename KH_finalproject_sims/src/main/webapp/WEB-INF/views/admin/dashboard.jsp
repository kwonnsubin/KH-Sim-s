<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="kh.finalproject.sims.biz.model.vo.BizPlanMngtVo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<!-- charts cdn -->
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
<div class="pcoded-main-container">
		<div class="pcoded-content">
			<div class="page-header">
	            <div class="page-block">
	                <div class="row align-items-center">
	                    <div class="col-md-12">
	                        <div class="page-header-title">
	                            <h5 class="m-b-10">Dashboard</h5>
	                        </div>
	                        <ul class="breadcrumb">
	                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/dashboard"><i class="feather icon-home"></i></a></li>
	                            <li class="breadcrumb-item"><a href="#!">Dashboard</a></li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </div>
			<div class="row align-items-center">
				<!-- 차트 -->
				<!-- 일별 총 가입자 수 변화 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>일별 가입자 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="dailyTotalUserWriteCount_chart_div"></div>
	                    	<script>
	  	                    	$.ajax({
		                    	    url: "<%=request.getContextPath()%>/admin/dashBoardDailyTotalUserWriteCount",
		                    	    type: "POST",
		                    	    dataType: "json", 
		                    	    success: function(data) {
		                    	        
		                    	        var chartData = [];
		                    	        var chartCategories = [];

		                    	        for (var i = 0; i < data.length; i++) {
		                    	          chartData.push(data[i].cnt);
		                    	        }
		                    	        
		                    	        for (var j = 0; j < data.length; j++) {
		                    	        	chartCategories.push(data[j].userWrDate);
			                    	    }

		    	                        var options = {
		    	                                series: [{
		    	                                  name: "Today",
		    	                               	  data: chartData
		    	                              }],
			  	                              chart: {
			  		                                height: 640,
			  		                                type: 'line',
			  		                                type: 'area',
			  		                                zoom: {
			  		                                  enabled: false
			  		                                }
		    	                              },
		    	                              dataLabels: {
		    	                                enabled: false
		    	                              },
		    	                              stroke: {
		    	                            	  curve: 'smooth'
		    	                              },
		    	                              grid: {
		    	                                row: {
		    	                                  colors: ['#f3f3f3', 'transparent'],
		    	                                  opacity: 0.5
		    	                                },
		    	                              },
		    	                              xaxis: {
		    	                                categories: chartCategories
		    	                              }
		    	                              };

		                    	        var chart = new ApexCharts(document.querySelector("#dailyTotalUserWriteCount_chart_div"), options);
		                    	        chart.render();
		                    	    },
		                    	    error: function() {
		                    	        console.error("error");
		                    	    }
		                    	});
	                    	</script>
						</div>
					 </div>
	            </div>
	            <!-- 리스트  -->
				<!-- 리뷰 리스트 -->
				<div class="col-xl-5 col-md-5">
	                <div class="card table-card">
			            <div class="card-header">
				            <div class="row"> 
				            	<div class="col-6">
			                        <h5>리뷰</h5>										            	
				            	</div>
				            	<div class="col-6 text-right">
		                        	<a href="<%=request.getContextPath()%>/admin/review/list"><i class="fa-solid fa-list text-dark text-dark"></i></a>								            	
				            	</div>
				            </div>
	                    </div>
	                    <div class="card-body p-0">
	                        <div class="table-responsive">
	                            <table class="table table-hover mb-0">
	                               <c:forEach items="${bizReviewList}" var="bizReview">
		                                <tbody>
		                                    <tr>
		                                        <td>
											        <c:choose>
											          <c:when test="${fn:length(bizReview.reviewContent) > 23}">
											            <a href="<%=request.getContextPath()%>/admin/review/detail/${bizReview.reviewNo }" class="text-dark">${fn:substring(bizReview.reviewContent, 0, 23)}...</a>
											          </c:when>
											          <c:otherwise>
											            <a href="<%=request.getContextPath()%>/admin/review/detail/${bizReview.reviewNo }" class="text-dark">${bizReview.reviewContent}</a>
											          </c:otherwise>
											        </c:choose>  
		                                        </td>
		                                        <td  class="text-right">${bizReview.reviewDate}</td>
		                                    </tr>
		                                </tbody>
	                                </c:forEach>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	    			 <!-- 질문/답변 리스트  -->
	                <div class="card table-card">
						<div class="card-header">
				            <div class="row"> 
				            	<div class="col-6">
			                        <h5>질문/답변</h5>										            	
				            	</div>
				            	<div class="col-6 text-right">
		                        	<a href="<%=request.getContextPath()%>/admin/qna/list"><i class="fa-solid fa-list text-dark"></i></a>									            	
				            	</div>
				            </div>
	                    </div>
	                    <div class="card-body p-0">
	                        <div class="table-responsive">
	                            <table class="table table-hover mb-0">
	                               <c:forEach items="${qnaList}" var="qna">
		                                <tbody>
		                                    <tr>
		                                        <td>
											        <c:choose>
											          <c:when test="${fn:length(qna.aqTitle) > 23}">
											            <a href="<%=request.getContextPath()%>/admin/qna/detail/${qna.aqNo }" class="text-dark">${fn:substring(qna.aqTitle, 0, 23)}...</a>
											          </c:when>
											          <c:otherwise>
											           <a href="<%=request.getContextPath()%>/admin/qna/detail/${qna.aqNo }" class="text-dark"> ${qna.aqTitle}</a>
											          </c:otherwise>
											        </c:choose>  
		                                        </td>
		                                        <td  class="text-right">${qna.aqDate}</td>
		                                    </tr>
		                                </tbody>
	                                </c:forEach>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	          		<!-- 신고 리스트  -->  
	                <div class="card table-card">
						<div class="card-header">
				            <div class="row"> 
				            	<div class="col-6">
			                        <h5>신고</h5>										            	
				            	</div>
				            	<div class="col-6 text-right ">
		                        	<a href="<%=request.getContextPath()%>/admin/reviewreport/detail"><i class="fa-solid fa-list text-dark"></i></a>										            	
				            	</div>
				            </div>
	                    </div>
	                    <div class="card-body p-0">
	                        <div class="table-responsive">
	                            <table class="table table-hover mb-0">
	                               <c:forEach items="${reviewReportList}" var="reviewReport">
		                                <tbody>
		                                    <tr>
		                                        <td>
											        <c:choose>
											          <c:when test="${fn:length(reviewReport.reviewContent) > 23}">
											           <a href="<%=request.getContextPath()%>/admin/reviewreport/detail/${reviewReport.reviewNo }" class="text-dark">${fn:substring(reviewReport.reviewContent, 0, 23)}...</a>
											          </c:when>
											          <c:otherwise>
											           <a href="<%=request.getContextPath()%>/admin/reviewreport/detail/${reviewReport.reviewNo }" class="text-dark">${reviewReport.reviewContent}</a>
											          </c:otherwise>
											        </c:choose>  
		                                        </td>
		                                        <td  class="text-right">${reviewReport.reviewDate}</td>
		                                    </tr>
		                                </tbody>
	                                </c:forEach>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	            </div> 
				<!-- 오늘의 수 -->
				<!-- 가입자 수 -->
				<div class="col-xl-4 col-md-4">
					<div class="card">
                           <div class="card-body" style="position: relative;">
                               <h5 class="pb-4"><i class="fa-solid fa-user mr-3"></i>가입자 수</h5>
                               <h2>${planOrderCount}<span class="text-muted m-l-5 f-14">명</span></h2>
                           <div class="resize-triggers"><div class="expand-trigger"></div><div class="contract-trigger"></div></div></div>
                       </div>
                   </div>
               	<!-- 통신사 신청 수 -->
               	<div class="col-xl-4 col-md-4">
                	<div class="card">
                           <div class="card-body" style="position: relative;">
                               <h5 class="pb-4"><i class="fa-solid fa-shop mr-3"></i>통신사 신청 수</h5>
                               <h2>${bizWriteCount}<span class="text-muted m-l-5 f-14">개</span></h2>
                           <div class="resize-triggers"><div class="expand-trigger"></div><div class="contract-trigger"></div></div></div>
                       </div>
               </div>
                <!-- 총 등록 수 -->
				<div class="col-xl-4 col-md-4">
					<div class="card">
                           <div class="card-body" style="position: relative;">
                               <h5 class="pb-4"><i class="fa-solid fa-shop mr-3"></i>총 등록 수</h5>
                               <h2>${bizTotalCount}<span class="text-muted m-l-5 f-14">개</span></h2>
                           <div class="resize-triggers"><div class="expand-trigger"></div><div class="contract-trigger"></div></div></div>
                       </div>
               </div>
           <!-- 차트 테스트 -->
           <%-- <div id="chart_div" style="width: 100%; height: 500px;"></div>
			${planOrderChartList} --%>
			</div>
		</div>
		
		
		<!-- api 테스트 -->
		 <form:form method="post" id="smsForm">
		    <ul>
		      <li>보낼사람 : <input type="text" name="from"/></li>
		      <li>내용 : <textarea name="text"></textarea></li>
		      <li><input type="button" onclick="sendSMS()" value="전송하기" /></li>
		    </ul>
		  </form:form>
  
		   <script>
		    function sendSMS(pageName){
		
		    	console.log("문자를 전송합니다.");
		    	$("#smsForm").attr("action", "${pageContext.request.contextPath}/send-one");
		    	$("#smsForm").submit();
		    }
		  </script>
</div>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
</body>
</html>