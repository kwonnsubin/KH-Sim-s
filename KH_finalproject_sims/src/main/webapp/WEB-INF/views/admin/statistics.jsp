<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 통계조회</title>
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
	                            <h5 class="m-b-10">통계 조회</h5>
	                        </div>
	                        <ul class="breadcrumb">
	                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/admin/dashboard"><i class="feather icon-home"></i></a></li>
	                            <li class="breadcrumb-item"><a href="">통계 조회</a></li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </div>
			<div class="row align-items-center">
				<!-- 차트 -->
				<!-- 일별 총 가입자 수 변화 -->
				<div class="col-md-6">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>일별 가입자 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="dailyTotalUserWriteCount_chart_div"></div>
	                    	<script>
	                    	$.ajax({
	                    	    url: "<%=request.getContextPath()%>/admin/dailyTotalUserWriteCount",
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
	    	                                height: 300,
	    	                                type: 'line',
	    	                                zoom: {
	    	                                  enabled: false
	    	                                }
	    	                              },
	    	                              dataLabels: {
	    	                                enabled: false
	    	                              },
	    	                              stroke: {
	    	                                curve: 'straight'
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
	            <!--   월별 총 가입자 수 -->
				<div class="col-md-6">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>월별 가입자 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="monthlyPlanOrderCount_chart_div"></div>
	                    	<script>
	                    	$.ajax({
	                    	    url: "<%=request.getContextPath()%>/admin/monthlyPlanOrderCount",
	                    	    type: "POST",
	                    	    dataType: "json", 
	                    	    success: function(data) {
	                    	        
	                    	        var chartData = [];
	                    	        var chartCategories = [];

	                    	        for (var i = 0; i < data.length; i++) {
	                    	          chartData.push(data[i].cnt);
	                    	        }
	                    	        
	                    	        for (var j = 0; j < data.length; j++) {
	                    	        	chartCategories.push(data[j].orderMonth);
		                    	        }

	    					        var options = {
	    							          series: [{
	    							            name: "Desktops",
	    							            data: chartData
	    							        }],
	    							          chart: {
	    							          height: 300,
	    							          type: 'line',
	    							          zoom: {
	    							            enabled: false
	    							          }
	    							        },
	    							        dataLabels: {
	    							          enabled: false
	    							        },
	    							        stroke: {
	    							          curve: 'straight'
	    							        },
	    							        grid: {
	    							          row: {
	    							            colors: ['#f3f3f3', 'transparent'],
	    							            opacity: 0.5
	    							          },
	    							        },
	    							        xaxis: {
	    							          categories: chartCategories,
	    							        }
	    							        };

	    					        var chart = new ApexCharts(document.querySelector("#monthlyPlanOrderCount_chart_div"), options);
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
	            <!-- 일별 성별 가입자 수 변화 -->
				<div class="col-md-8">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>성별 가입자 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="genderPlanOrderCount_chart_div"></div>
	                    	<script>
	                    	$.ajax({
	                    	    url: "<%=request.getContextPath()%>/admin/dailyGenderUserWriteCount",
	                    	    type: "POST",
	                    	    dataType: "json", 
	                    	    success: function(data) {
	                    	        
	                    	        var chartData1 = [];
	                    	        var chartData2 = [];
	                    	        var chartCategories = [];

	                    	        for (var i = 0; i < data.length; i++) {
	                    	          chartData1.push(data[i].maleCnt);
	                    	        }
	                    	        
	                    	        for (var i = 0; i < data.length; i++) {
		                    	          chartData2.push(data[i].femaleCnt);
		                    	    }
	                    	        
	                    	        for (var j = 0; j < data.length; j++) {
	                    	        	chartCategories.push(data[j].userWrDate);
		                    	    }       	     

	    					        var options = {
	    							          series: [{
	    							          name: '남',
	    							          data: chartData1
	    							        }, {
	    							          name: '여',
	    							          data: chartData2
	    							        }],
	    							          chart: {
	    							              height: 225,
	    							              type: 'line',
	    							              zoom: {
	    							                enabled: false
	    							              }
	    							            },
	    							        dataLabels: {
	    							          enabled: false
	    							        },
	    							        stroke: {
	    							          curve: 'straight'
	    							        },
	    							        xaxis: {
	    							          categories: chartCategories
	    							        }
	    						        };

	    					        var chart = new ApexCharts(document.querySelector("#genderPlanOrderCount_chart_div"), options);
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
	           <!-- 성별 비율 -->
				<div class="col-md-4">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>성별 비율</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="genderRatioByTotalUserRatio_chart"></div>
							<script>
	                    	$.ajax({
	                    	    url: "<%=request.getContextPath()%>/admin/genderRatioByTotalUserRatio",
	                    	    type: "POST",
	                    	    dataType: "json", 
	                    	    success: function(data) {   
	                    	    	
							        var options = {
									          series: [data.maleRatio, data.femaleRatio],
									          chart: {
									          width: 360,
									          height: 239.70000000000002,
									          type: 'pie',
									        },
									        labels: ['남', '여'],
									        responsive: [{
									          breakpoint: 480,
									          options: {
									            chart: {
									              width: 200
									            },
									            legend: {
									              position: 'bottom'
									            }
									          }
									        }]
									        };

							        var chart = new ApexCharts(document.querySelector("#genderRatioByTotalUserRatio_chart"), options);
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
	            <!-- 연령별 총 가입자 수 -->
				<div class="col-md-8">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>연령별 총 가입자 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="ageGroupPlanOrderCount_chart_div"></div>
	                    	<script>
	                    	$.ajax({
	                    	    url: "<%=request.getContextPath()%>/admin/ageGroupPlanOrderCount",
	                    	    type: "POST",
	                    	    dataType: "json", 
	                    	    success: function(data) {    
	                    	    	
	                    	        var chartData = [];
	                    	        var chartCategories = [];

	                    	        for (var i = 0; i < data.length; i++) {
	                    	          chartData.push(data[i].cnt);
	                    	        }
	                    	        
	                    	        for (var j = 0; j < data.length; j++) {
	                    	        	chartCategories.push(data[j].ageGroup);
		                    	        }
	                    	    	
	    	                        var options = {
	    	                                series: [{
	    	                                data: chartData
	    	                              }],
	    	                                chart: {
	    	                                height: 225,
	    	                                type: 'bar',
	    	                                events: {
	    	                                  click: function(chart, w, e) {
	    	                                  }
	    	                                }
	    	                              },
	    	                              plotOptions: {
	    	                                bar: {
	    	                                  columnWidth: '45%',
	    	                                  distributed: true,
	    	                                }
	    	                              },
	    	                              dataLabels: {
	    	                                enabled: false
	    	                              },
	    	                              legend: {
	    	                                show: false
	    	                              },
	    	                              xaxis: {
	    	                                categories: chartCategories,
	    	                                labels: {
	    	                                  style: {
	    	                                    fontSize: '12px'
	    	                                  }
	    	                                }
	    	                              }
	    	                              };

		                              var chart = new ApexCharts(document.querySelector("#ageGroupPlanOrderCount_chart_div"), options);
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
	            <!-- 연령별 비율  -->
				<div class="col-md-4">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>연령별 비율</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="ageGroupByTotalUserRatio_chart"></div>
	                    	<script>
	                    	$.ajax({
	                    	    url: "<%=request.getContextPath()%>/admin/ageGroupByTotalUserRatio",
	                    	    type: "POST",
	                    	    dataType: "json", 
	                    	    success: function(data) {    
	                    	    	
	                    	        var chartSeries = [];
	                    	        var chartLabels = [];

	                    	        for (var i = 0; i < data.length; i++) {
	                    	        	chartSeries.push(data[i].ageGroupRatio);
	                    	        }
	                    	        
	                    	        for (var j = 0; j < data.length; j++) {
	                    	        	chartLabels.push(data[j].ageGroup);
		                    	        }
	                    	    	
							        var options = {
									          series: chartSeries,
									          chart: {
									          width: 360,
									          type: 'pie',
									        },
									        labels: chartLabels,
									        responsive: [{
									          breakpoint: 480,
									          options: {
									            chart: {
									              width: 200
									            },
									            legend: {
									              position: 'bottom'
									            }
									          }
									        }]
									        };

							        var chart = new ApexCharts(document.querySelector("#ageGroupByTotalUserRatio_chart"), options);
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
 				<!-- 가입자 많은 요금제 -->
				<div class="col-md-6">
				<div class="card">
                    <div class="card-header">
                        <h5>요금제 가입자 순</h5>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table text-center" style="height: 400px;">
                                <thead>
                                    <tr>
                                    	<th>순위</th>
                                        <th>요금제명</th>
                                        <th>통신사명</th>
                                        <th>가입자수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${orderByRegistration}" var="orderByRegistration">
                                    <tr>
                                    	<td>${orderByRegistration.planLanking}</td>
                                        <td>${orderByRegistration.planName}</td>
                                        <td>${orderByRegistration.bizName}</td>
                                        <td>${orderByRegistration.cnt}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
				</div>
	            <!-- 연령별 인기 요금제 -->
				<div class="col-md-6">
				<div class="card" id="ageGroupPlans">
                    <div class="card-header">
                        <h5>연령별 인기요금제</h5>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table text-center" style="height: 400px;">
                                <thead>
                                    <tr>
                                        <th>연령대</th>
                                        <th>요금제명</th>
                                        <th>가입자수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ageGroupPlans}" var="ageGroupPlan">
                                    <tr>
                                        <td>${ageGroupPlan.ageGroup}</td>
                                        <td>${ageGroupPlan.planName}</td>
                                        <td>${ageGroupPlan.cnt}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
				</div>	
				<!-- 별점순 통신사 -->
				<div class="col-md-12">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>통신사 순위</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="starRating_chart_div"></div>
	                    	<script>
	                    	$.ajax({
	                    	    url: "<%=request.getContextPath()%>/admin/starRating",
	                    	    type: "POST",
	                    	    dataType: "json", 
	                    	    success: function(data) {    
	                    	    	
	                    	        var chartData = [];
	                    	        var chartCategories = [];

	                    	        for (var i = 0; i < data.length; i++) {
	                    	        	chartData.push(data[i].bizReviewStar);
	                    	        }
	                    	        
	                    	        for (var j = 0; j < data.length; j++) {
	                    	        	chartCategories.push(data[j].bizName);
		                    	        }
	                    	    	
	    	                        var options = {
	    	                                series: [{
	    	                                data: chartData,
	    	                              }],
	    	                                chart: {
	    	                                type: 'bar',
	    	                                height: 350
	    	                              },
	    	                              plotOptions: {
	    	                                bar: {
	    	                                  borderRadius: 4,
	    	                                  horizontal: true,
	    	                                }
	    	                              },
	    	                              dataLabels: {
	    	                                  enabled: true,
	    	                                  style: {
	    	                                    fontSize: '12px',
	    	                                    colors: ['#fff']
	    	                                  }
	    	                                },
	    	                              xaxis: {
	    	                                categories: chartCategories,
	    	                              }
	    	                              };

		                              var chart = new ApexCharts(document.querySelector("#starRating_chart_div"), options);
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
			</div>
		</div>
</div>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
</body>
</html>