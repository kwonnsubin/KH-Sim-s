<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 붙여야 <form method="post"> 작동함 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
<jsp:include page="./include/header.jsp" />
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
	                    <div class="card-body" style="position: relative;">
	                        <div id="line-chart-1" style="min-height: 315px;"><div id="apexchartswe1pwlhl" class="apexcharts-canvas apexchartswe1pwlhl light" style="width: 451px; height: 300px;"><svg id="SvgjsSvg1006" width="451" height="300" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;"><g id="SvgjsG1008" class="apexcharts-inner apexcharts-graphical" transform="translate(55.359375, 56.0009765625)"><defs id="SvgjsDefs1007"><clipPath id="gridRectMaskwe1pwlhl"><rect id="SvgjsRect1014" width="378.96484375" height="206.3470234375" x="-2.5" y="-2.5" rx="0" ry="0" fill="#ffffff" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0"></rect></clipPath><clipPath id="gridRectMarkerMaskwe1pwlhl"><rect id="SvgjsRect1015" width="375.96484375" height="203.3470234375" x="-1" y="-1" rx="0" ry="0" fill="#ffffff" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0"></rect></clipPath></defs><line id="SvgjsLine1013" x1="186.482421875" y1="0" x2="186.482421875" y2="201.3470234375" stroke="#b6b6b6" stroke-dasharray="3" class="apexcharts-xcrosshairs" x="186.482421875" y="0" width="1" height="201.3470234375" fill="#b1b9c4" filter="none" fill-opacity="0.9" stroke-width="1"></line><g id="SvgjsG1022" class="apexcharts-xaxis" transform="translate(0, 0)"><g id="SvgjsG1023" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)"><text id="SvgjsText1024" font-family="Helvetica, Arial, sans-serif" x="0" y="230.3470234375" text-anchor="middle" dominant-baseline="auto" font-size="12px" fill="#373d3f" class="apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1025" style="font-family: Helvetica, Arial, sans-serif;">Jan</tspan><title>Jan</title></text><text id="SvgjsText1026" font-family="Helvetica, Arial, sans-serif" x="46.74560546875" y="230.3470234375" text-anchor="middle" dominant-baseline="auto" font-size="12px" fill="#373d3f" class="apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1027" style="font-family: Helvetica, Arial, sans-serif;">Feb</tspan><title>Feb</title></text><text id="SvgjsText1028" font-family="Helvetica, Arial, sans-serif" x="93.4912109375" y="230.3470234375" text-anchor="middle" dominant-baseline="auto" font-size="12px" fill="#373d3f" class="apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1029" style="font-family: Helvetica, Arial, sans-serif;">Mar</tspan><title>Mar</title></text><text id="SvgjsText1030" font-family="Helvetica, Arial, sans-serif" x="140.23681640625" y="230.3470234375" text-anchor="middle" dominant-baseline="auto" font-size="12px" fill="#373d3f" class="apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1031" style="font-family: Helvetica, Arial, sans-serif;">Apr</tspan><title>Apr</title></text><text id="SvgjsText1032" font-family="Helvetica, Arial, sans-serif" x="186.982421875" y="230.3470234375" text-anchor="middle" dominant-baseline="auto" font-size="12px" fill="#373d3f" class="apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1033" style="font-family: Helvetica, Arial, sans-serif;">May</tspan><title>May</title></text><text id="SvgjsText1034" font-family="Helvetica, Arial, sans-serif" x="233.72802734375" y="230.3470234375" text-anchor="middle" dominant-baseline="auto" font-size="12px" fill="#373d3f" class="apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1035" style="font-family: Helvetica, Arial, sans-serif;">Jun</tspan><title>Jun</title></text><text id="SvgjsText1036" font-family="Helvetica, Arial, sans-serif" x="280.4736328125" y="230.3470234375" text-anchor="middle" dominant-baseline="auto" font-size="12px" fill="#373d3f" class="apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1037" style="font-family: Helvetica, Arial, sans-serif;">Jul</tspan><title>Jul</title></text><text id="SvgjsText1038" font-family="Helvetica, Arial, sans-serif" x="327.21923828125" y="230.3470234375" text-anchor="middle" dominant-baseline="auto" font-size="12px" fill="#373d3f" class="apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1039" style="font-family: Helvetica, Arial, sans-serif;">Aug</tspan><title>Aug</title></text><text id="SvgjsText1040" font-family="Helvetica, Arial, sans-serif" x="373.96484375" y="230.3470234375" text-anchor="middle" dominant-baseline="auto" font-size="12px" fill="#373d3f" class="apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1041" style="font-family: Helvetica, Arial, sans-serif;">Sep</tspan><title>Sep</title></text></g><line id="SvgjsLine1042" x1="0" y1="202.3470234375" x2="373.96484375" y2="202.3470234375" stroke="#78909c" stroke-dasharray="0" stroke-width="1"></line></g><g id="SvgjsG1051" class="apexcharts-grid"><g id="SvgjsG1052" class="apexcharts-gridlines-horizontal"><line id="SvgjsLine1061" x1="0" y1="0" x2="373.96484375" y2="0" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1062" x1="0" y1="40.2694046875" x2="373.96484375" y2="40.2694046875" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1063" x1="0" y1="80.538809375" x2="373.96484375" y2="80.538809375" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1064" x1="0" y1="120.8082140625" x2="373.96484375" y2="120.8082140625" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1065" x1="0" y1="161.07761875" x2="373.96484375" y2="161.07761875" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line><line id="SvgjsLine1066" x1="0" y1="201.3470234375" x2="373.96484375" y2="201.3470234375" stroke="#e0e0e0" stroke-dasharray="0" class="apexcharts-gridline"></line></g><g id="SvgjsG1053" class="apexcharts-gridlines-vertical"></g><line id="SvgjsLine1054" x1="46.74560546875" y1="202.3470234375" x2="46.74560546875" y2="208.3470234375" stroke="#78909c" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1055" x1="93.4912109375" y1="202.3470234375" x2="93.4912109375" y2="208.3470234375" stroke="#78909c" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1056" x1="140.23681640625" y1="202.3470234375" x2="140.23681640625" y2="208.3470234375" stroke="#78909c" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1057" x1="186.982421875" y1="202.3470234375" x2="186.982421875" y2="208.3470234375" stroke="#78909c" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1058" x1="233.72802734375" y1="202.3470234375" x2="233.72802734375" y2="208.3470234375" stroke="#78909c" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1059" x1="280.4736328125" y1="202.3470234375" x2="280.4736328125" y2="208.3470234375" stroke="#78909c" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1060" x1="327.21923828125" y1="202.3470234375" x2="327.21923828125" y2="208.3470234375" stroke="#78909c" stroke-dasharray="0" class="apexcharts-xaxis-tick"></line><rect id="SvgjsRect1067" width="373.96484375" height="40.2694046875" x="0" y="0" rx="0" ry="0" fill="#f3f6ff" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" class="apexcharts-gridRow"></rect><rect id="SvgjsRect1068" width="373.96484375" height="40.2694046875" x="0" y="40.2694046875" rx="0" ry="0" fill="transparent" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" class="apexcharts-gridRow"></rect><rect id="SvgjsRect1069" width="373.96484375" height="40.2694046875" x="0" y="80.538809375" rx="0" ry="0" fill="#f3f6ff" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" class="apexcharts-gridRow"></rect><rect id="SvgjsRect1070" width="373.96484375" height="40.2694046875" x="0" y="120.8082140625" rx="0" ry="0" fill="transparent" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" class="apexcharts-gridRow"></rect><rect id="SvgjsRect1071" width="373.96484375" height="40.2694046875" x="0" y="161.07761875" rx="0" ry="0" fill="#f3f6ff" opacity="0.5" stroke-width="0" stroke="none" stroke-dasharray="0" class="apexcharts-gridRow"></rect><line id="SvgjsLine1073" x1="0" y1="201.3470234375" x2="373.96484375" y2="201.3470234375" stroke="transparent" stroke-dasharray="0"></line><line id="SvgjsLine1072" x1="0" y1="1" x2="0" y2="201.3470234375" stroke="transparent" stroke-dasharray="0"></line></g><g id="SvgjsG1017" class="apexcharts-line-series apexcharts-plot-series"><g id="SvgjsG1018" class="apexcharts-series" seriesName="Desktops" data:longestSeries="true" rel="1" data:realIndex="0"><path id="apexcharts-line-0" d="M0 187.92388854166668L46.74560546875 146.31217036458335L93.4912109375 154.36605130208335L140.23681640625 132.88903546875002L186.982421875 135.57366244791666L233.72802734375 118.12358708333335L280.4736328125 108.72739265625L327.21923828125 79.19649588541668L373.96484375 2.6846269791666657C373.96484375 2.6846269791666657 373.96484375 2.6846269791666657 373.96484375 2.6846269791666657 " fill="none" fill-opacity="1" stroke="rgba(26,188,156,0.85)" stroke-opacity="1" stroke-linecap="butt" stroke-width="5" stroke-dasharray="0" class="apexcharts-line" index="0" clip-path="url(#gridRectMaskwe1pwlhl)" pathTo="M 0 187.92388854166668L 46.74560546875 146.31217036458335L 93.4912109375 154.36605130208335L 140.23681640625 132.88903546875002L 186.982421875 135.57366244791666L 233.72802734375 118.12358708333335L 280.4736328125 108.72739265625L 327.21923828125 79.19649588541668L 373.96484375 2.6846269791666657" pathFrom="M -1 201.3470234375L -1 201.3470234375L 46.74560546875 201.3470234375L 93.4912109375 201.3470234375L 140.23681640625 201.3470234375L 186.982421875 201.3470234375L 233.72802734375 201.3470234375L 280.4736328125 201.3470234375L 327.21923828125 201.3470234375L 373.96484375 201.3470234375"></path><g id="SvgjsG1019" class="apexcharts-series-markers-wrap"><g class="apexcharts-series-markers"><circle id="SvgjsCircle1079" r="0" cx="186.982421875" cy="135.57366244791666" class="apexcharts-marker wxww5fuov no-pointer-events" stroke="#ffffff" fill="#1abc9c" fill-opacity="1" stroke-width="2" stroke-opacity="0.9" default-marker-size="0"></circle></g></g><g id="SvgjsG1020" class="apexcharts-datalabels"></g></g></g><line id="SvgjsLine1074" x1="0" y1="0" x2="373.96484375" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" class="apexcharts-ycrosshairs"></line><line id="SvgjsLine1075" x1="0" y1="0" x2="373.96484375" y2="0" stroke-dasharray="0" stroke-width="0" class="apexcharts-ycrosshairs-hidden"></line><g id="SvgjsG1076" class="apexcharts-yaxis-annotations"></g><g id="SvgjsG1077" class="apexcharts-xaxis-annotations"></g><g id="SvgjsG1078" class="apexcharts-point-annotations"></g></g><text id="SvgjsText1009" font-family="Helvetica, Arial, sans-serif" x="10" y="16" text-anchor="start" dominant-baseline="auto" font-size="14px" fill="#373d3f" class="apexcharts-title-text" style="font-family: Helvetica, Arial, sans-serif; opacity: 1;">Product Trends by Month</text><rect id="SvgjsRect1012" width="0" height="0" x="0" y="0" rx="0" ry="0" fill="#fefefe" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0"></rect><g id="SvgjsG1043" class="apexcharts-yaxis" rel="0" transform="translate(22.359375, 0)"><g id="SvgjsG1044" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1045" font-family="Helvetica, Arial, sans-serif" x="20" y="57.5009765625" text-anchor="end" dominant-baseline="auto" font-size="11px" fill="#373d3f" class="apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">150</text><text id="SvgjsText1046" font-family="Helvetica, Arial, sans-serif" x="20" y="97.87038125000001" text-anchor="end" dominant-baseline="auto" font-size="11px" fill="#373d3f" class="apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">120</text><text id="SvgjsText1047" font-family="Helvetica, Arial, sans-serif" x="20" y="138.23978593750002" text-anchor="end" dominant-baseline="auto" font-size="11px" fill="#373d3f" class="apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">90</text><text id="SvgjsText1048" font-family="Helvetica, Arial, sans-serif" x="20" y="178.60919062500002" text-anchor="end" dominant-baseline="auto" font-size="11px" fill="#373d3f" class="apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">60</text><text id="SvgjsText1049" font-family="Helvetica, Arial, sans-serif" x="20" y="218.97859531250003" text-anchor="end" dominant-baseline="auto" font-size="11px" fill="#373d3f" class="apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">30</text><text id="SvgjsText1050" font-family="Helvetica, Arial, sans-serif" x="20" y="259.348" text-anchor="end" dominant-baseline="auto" font-size="11px" fill="#373d3f" class="apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">0</text></g></g></svg><div class="apexcharts-legend"></div><div class="apexcharts-tooltip light" style="left: 112.312px; top: 187.348px;"><div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">May</div><div class="apexcharts-tooltip-series-group active" style="display: flex;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(26, 188, 156);"></span><div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"><div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-label">Desktops: </span><span class="apexcharts-tooltip-text-value">49</span></div><div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div></div></div></div><div class="apexcharts-xaxistooltip apexcharts-xaxistooltip-bottom light" style="left: 217.615px; top: 259.348px;"><div class="apexcharts-xaxistooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px; min-width: 26.4531px;">May</div></div><div class="apexcharts-toolbar"><div class="apexcharts-menu-icon" title="Menu"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"></path><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"></path></svg></div><div class="apexcharts-menu"><div class="apexcharts-menu-item exportSVG" title="Download SVG">Download SVG</div><div class="apexcharts-menu-item exportPNG" title="Download PNG">Download PNG</div></div></div></div></div>
	                    <div class="resize-triggers"><div class="expand-trigger"><div style="width: 492px; height: 356px;"></div></div><div class="contract-trigger"></div></div></div>
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
		           <div id="chart_div" style="width: 100%; height: 500px;"></div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="./include/footer.jsp" />
</body>
	<!-- 차트 -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2013',  1000,      400],
          ['2014',  1170,      460],
          ['2015',  660,       1120],
          ['2016',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</html>