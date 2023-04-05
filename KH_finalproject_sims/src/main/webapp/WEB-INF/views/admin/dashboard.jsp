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
<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

  // Load the Visualization API and the corechart package.
  google.charts.load('current', {'packages':['corechart']}); // 특정  차트 유형의 패키지를 로드 (버전,차트유형)

  // Set a callback to run when the Google Visualization API is loaded.
  google.charts.setOnLoadCallback(drawChart); // drawChart 자바스크립트 호출

  // Callback that creates and populates a data table,
  // instantiates the pie chart, passes in the data and
  // draws it.
  function drawChart() {

    // Create the data table.
    var data = new google.visualization.DataTable();
    
     var data = google.visualization.arrayToDataTable([
        ['Element', 'Density', { role: 'style' }, { role: 'annotation' } ],
        ['${planOrderChartList[0].planName}', ${planOrderChartList[0].cnt}, '#FF8000', '${planOrderChartList[0].bizName}' ],
        ['${planOrderChartList[1].planName}', ${planOrderChartList[1].cnt}, '#B404AE', '${planOrderChartList[1].bizName}' ],
        ['${planOrderChartList[2].planName}', ${planOrderChartList[2].cnt}, '#5858FA', '${planOrderChartList[2].bizName}' ],
        ['${planOrderChartList[3].planName}', ${planOrderChartList[3].cnt}, '#0080FF', '${planOrderChartList[3].bizName}' ],
        ['${planOrderChartList[4].planName}', ${planOrderChartList[4].cnt}, '#0489B1', '${planOrderChartList[4].bizName}' ],
     ]); 
     

    // Set chart options
    var options = {'title':'요금제별 가입 신청 수',
                   'legend':'none',
                   'chartArea': {'width': '80%', 'height': '80%'}
                   };

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
<div class="pcoded-main-container">
	<div class="pcoded-wrapper container">
		<div class="pcoded-content">
			<div class="row align-items-center">
				<!-- 차트 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>요금제별 가입신청 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="chart_div" style="width:799px; height:540px;"></div>
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
											            <a href="<%=request.getContextPath()%>/admin/reviewdetail/${bizReview.reviewNo }" class="text-dark">${fn:substring(bizReview.reviewContent, 0, 23)}...</a>
											          </c:when>
											          <c:otherwise>
											            <a href="<%=request.getContextPath()%>/admin/reviewdetail/${bizReview.reviewNo }" class="text-dark">${bizReview.reviewContent}</a>
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
		                        	<a href="<%=request.getContextPath()%>/admin/reviewreportdetail"><i class="fa-solid fa-list text-dark"></i></a>										            	
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
											           <a href="<%=request.getContextPath()%>/admin/reviewreportdetail/${reviewReport.reviewNo }" class="text-dark">${fn:substring(reviewReport.reviewContent, 0, 23)}...</a>
											          </c:when>
											          <c:otherwise>
											           <a href="<%=request.getContextPath()%>/admin/reviewreportdetail/${reviewReport.reviewNo }" class="text-dark">${reviewReport.reviewContent}</a>
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
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
</body>
</html>