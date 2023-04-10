<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/admin/statistics.css"/>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<!-- charts cdn -->
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<!-- <script>
  // Callback that creates and populates a data table,
  // instantiates the pie chart, passes in the data and
  // draws it.
  
/*  function drawChart() {

    // Create the data table.
     var data = google.visualization.arrayToDataTable([
        ['Element', 'Density', { role: 'style' }, { role: 'annotation' } ],
        ['${orderByRegistration[0].planName}', ${orderByRegistration[0].cnt}, '#FF8000', '${orderByRegistration[0].bizName}' ],
        ['${orderByRegistration[1].planName}', ${orderByRegistration[1].cnt}, '#B404AE', '${orderByRegistration[1].bizName}' ],
        ['${orderByRegistration[2].planName}', ${orderByRegistration[2].cnt}, '#5858FA', '${orderByRegistration[2].bizName}' ],
        ['${orderByRegistration[3].planName}', ${orderByRegistration[3].cnt}, '#0080FF', '${orderByRegistration[3].bizName}' ],
        ['${orderByRegistration[4].planName}', ${orderByRegistration[4].cnt}, '#0489B1', '${orderByRegistration[4].bizName}' ],
     ]);
     

    // Set chart options
    var options = {'title':'가입자 많은 순',
                   'legend':'none',
                   'chartArea': {'width': '80%', 'height': '80%'}
                   };

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.BarChart(document.getElementById('chart_chart_div'));
    chart.draw(data, options);
  }

</script> -->
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
<div class="pcoded-main-container">
	<div class="pcoded-wrapper container">
		<div class="pcoded-content">
			<div class="row align-items-center">
				<!-- 차트 -->
 				<!-- 가입자 많은 순 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>요금제 랭킹</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="orderByRegistration_chart_div"></div>
						</div>
					 </div>
	            </div>
	            <!-- 연령대별 인기 요금제 -->
				<div class="col-md-7">
				<div class="card">
                    <div class="card-header">
                        <h5>연령대별 베스트 요금제</h5>
                    </div>
                    <div class="card-body table-border-style">
                        <div class="table-responsive">
                            <table class="table text-center">
                                <thead>
                                    <tr>
                                        <th>연령대</th>
                                        <th>요금제명</th>
                                        <th>가입수</th>
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
				<div class="col-md-10">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>별점순 통신사</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="starRating_chart_div" style="width:799px; height:540px;"></div>
	                    	<script>
	                        var options = {
	                                series: [{
	                                data: [${starRating[0].bizReviewStar}, ${starRating[1].bizReviewStar}, ${starRating[2].bizReviewStar}, ${starRating[3].bizReviewStar}, ${starRating[4].bizReviewStar}]
	                              }],
	                                chart: {
	                                type: 'bar',
	                                height: 380
	                              },
	                              plotOptions: {
	                                bar: {
	                                  barHeight: '100%',
	                                  distributed: true,
	                                  horizontal: true,
	                                  dataLabels: {
	                                    position: 'bottom'
	                                  },
	                                }
	                              },
	                              colors: ['#33b2df', '#546E7A', '#d4526e', '#13d8aa', '#A5978B', '#2b908f', '#f9a3a4', '#90ee7e',
	                                '#f48024', '#69d2e7'
	                              ],
	                              dataLabels: {
	                                enabled: true,
	                                textAnchor: 'start',
	                                style: {
	                                  colors: ['#fff']
	                                },
	                                formatter: function (val, opt) {
	                                  return opt.w.globals.labels[opt.dataPointIndex] + ":  " + val
	                                },
	                                offsetX: 0,
	                                dropShadow: {
	                                  enabled: true
	                                }
	                              },
	                              stroke: {
	                                width: 1,
	                                colors: ['#fff']
	                              },
	                              xaxis: {
	                                categories: ['${starRating[0].bizName}', '${starRating[1].bizName}', '${starRating[2].bizName}', '${starRating[3].bizName}', '${starRating[4].bizName}'
	                                ],
	                              },
	                              yaxis: {
	                                labels: {
	                                  show: false
	                                }
	                              },
	                              tooltip: {
	                                theme: 'dark',
	                                x: {
	                                  show: false
	                                },
	                                y: {
	                                  title: {
	                                    formatter: function () {
	                                      return ''
	                                    }
	                                  }
	                                }
	                              }
	                              };

	                              var chart = new ApexCharts(document.querySelector("#starRating_chart_div"), options);
	                              chart.render();
	                    	</script>
						</div>
					 </div>
	            </div>
	           
	            <!-- 연령대별 총 가입자 수 -->
				<div class="col-md-10">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>연령대별 총 가입자 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="ageGroupPlanOrderCount_chart_div"></div>
	                    	<script>
	                        var options = {
	                                series: [{
	                                data: [${ageGroupPlanOrderCount[0].cnt}, ${ageGroupPlanOrderCount[1].cnt}, ${ageGroupPlanOrderCount[2].cnt}, ${ageGroupPlanOrderCount[3].cnt}, ${ageGroupPlanOrderCount[4].cnt}]
	                              }],
	                                chart: {
	                                height: 350,
	                                type: 'bar',
	                                events: {
	                                  click: function(chart, w, e) {
	                                    // console.log(chart, w, e)
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
	                                categories: [
	                                  "${ageGroupPlanOrderCount[0].ageGroup}",
	                                  "${ageGroupPlanOrderCount[1].ageGroup}",
	                                  "${ageGroupPlanOrderCount[2].ageGroup}",
	                                  "${ageGroupPlanOrderCount[3].ageGroup}",
	                                  "${ageGroupPlanOrderCount[4].ageGroup}"
	                                ],
	                                labels: {
	                                  style: {
	                                    fontSize: '12px'
	                                  }
	                                }
	                              }
	                              };

	                              var chart = new ApexCharts(document.querySelector("#ageGroupPlanOrderCount_chart_div"), options);
	                              chart.render();
	                    	</script>
						</div>
					 </div>
	            </div>
	         	<!-- 일별 총 가입자 수 변화 -->
				<div class="col-md-10">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>일별 가입자 수 변화</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="dailyTotalUserWriteCount_chart_div"></div>
	                    	<script>
	                        var options = {
	                                series: [{
	                                  name: "가입자",
	                                  data: [${dailyTotalUserWriteCount[0].cnt}, ${dailyTotalUserWriteCount[1].cnt}, ${dailyTotalUserWriteCount[2].cnt}, ${dailyTotalUserWriteCount[3].cnt}, ${dailyTotalUserWriteCount[4].cnt}, ${dailyTotalUserWriteCount[5].cnt}, ${dailyTotalUserWriteCount[6].cnt}]
	                              }],
	                                chart: {
	                                height: 350,
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
	                              title: {
	                                text: 'Product Trends by Month',
	                                align: 'left'
	                              },
	                              grid: {
	                                row: {
	                                  colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
	                                  opacity: 0.5
	                                },
	                              },
	                              xaxis: {
	                                categories: ['${dailyTotalUserWriteCount[0].userWrDate}', '${dailyTotalUserWriteCount[1].userWrDate}', '${dailyTotalUserWriteCount[2].userWrDate}', '${dailyTotalUserWriteCount[3].userWrDate}', '${dailyTotalUserWriteCount[4].userWrDate}', '${dailyTotalUserWriteCount[5].userWrDate}', '${dailyTotalUserWriteCount[6].userWrDate}'],
	                              }
	                              };

	                              var chart = new ApexCharts(document.querySelector("#dailyTotalUserWriteCount_chart_div"), options);
	                              chart.render();
	                    	</script>
						</div>
					 </div>
	            </div>
	            <!-- 일별 성별 가입자 수 변화 -->
				<div class="col-md-10">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>일별 성별 가입자 수 변화</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="genderPlanOrderCount_chart_div"></div>
	                    	<script>
					        var options = {
						          series: [{
						          name: '남',
						          data: [${dailyGenderUserWriteCount[0].maleCnt}, ${dailyGenderUserWriteCount[1].maleCnt}, ${dailyGenderUserWriteCount[2].maleCnt}, ${dailyGenderUserWriteCount[3].maleCnt}, ${dailyGenderUserWriteCount[4].maleCnt}, ${dailyGenderUserWriteCount[5].maleCnt}, ${dailyGenderUserWriteCount[6].maleCnt}]
						        }, {
						          name: '여',
						          data: [${dailyGenderUserWriteCount[0].femaleCnt}, ${dailyGenderUserWriteCount[1].femaleCnt}, ${dailyGenderUserWriteCount[2].femaleCnt}, ${dailyGenderUserWriteCount[3].femaleCnt}, ${dailyGenderUserWriteCount[4].femaleCnt}, ${dailyGenderUserWriteCount[5].femaleCnt}, ${dailyGenderUserWriteCount[6].femaleCnt}]
						        }],
						          chart: {
						              height: 350,
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
						          categories: ["${dailyGenderUserWriteCount[0].userWrDate}","${dailyGenderUserWriteCount[1].userWrDate}", "${dailyGenderUserWriteCount[2].userWrDate}", "${dailyGenderUserWriteCount[3].userWrDate}", "${dailyGenderUserWriteCount[4].userWrDate}", "${dailyGenderUserWriteCount[5].userWrDate}", "${dailyGenderUserWriteCount[6].userWrDate}"],
						        }
					        };
					
					        var chart = new ApexCharts(document.querySelector("#genderPlanOrderCount_chart_div"), options);
					        chart.render();
    						</script>
						</div>
					 </div>
	            </div>
	           
	            <!--   월별 총 가입자 수 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>월별 총 가입자 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="monthlyPlanOrderCount_chart_div"></div>
	                    	<script>
						  	  // 월별 총 가입자 수
					        var options = {
					          series: [{
					            name: "Desktops",
					            data: [${monthlyPlanOrderCount[0].cnt}, ${monthlyPlanOrderCount[1].cnt} , ${monthlyPlanOrderCount[2].cnt}, ${monthlyPlanOrderCount[3].cnt}, ${monthlyPlanOrderCount[4].cnt}]
					        }],
					          chart: {
					          height: 350,
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
					        title: {
					          text: 'Product Trends by Month',
					          align: 'left'
					        },
					        grid: {
					          row: {
					            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
					            opacity: 0.5
					          },
					        },
					        xaxis: {
					          categories: ['${monthlyPlanOrderCount[0].orderMonth}', '${monthlyPlanOrderCount[1].orderMonth}', '${monthlyPlanOrderCount[2].orderMonth}', '${monthlyPlanOrderCount[3].orderMonth}', '${monthlyPlanOrderCount[4].orderMonth}'],
					        }
					        };
					
					        var chart = new ApexCharts(document.querySelector("#monthlyPlanOrderCount_chart_div"), options);
					        chart.render();
					    </script>
						</div>
					 </div>
	            </div>
	            
	       <!-- 가입자 수 대비 성별 비율 -->
				<div class="col-md-5">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>가입자 수 대비 성별 비율</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="genderRatioByTotalUserRatio_chart"></div>
							<script>
							        var options = {
							          series: [${genderRatioByTotalUserRatio.maleRatio}, ${genderRatioByTotalUserRatio.femaleRatio}],
							          chart: {
							          width: 380,
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
							</script>
						</div>
					 </div>
	            </div>
	            <!-- 가입자 수 대비 연령대 비율  -->
				<div class="col-md-5">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>가입자 수 대비 연령대 비율</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="chart"></div>
	                    	<script>
							        var options = {
							          series: [ ${ageGroupByTotalUserRatio[0].ageGroupRatio}, ${ageGroupByTotalUserRatio[1].ageGroupRatio},  ${ageGroupByTotalUserRatio[2].ageGroupRatio},  ${ageGroupByTotalUserRatio[3].ageGroupRatio},  ${ageGroupByTotalUserRatio[4].ageGroupRatio},  ${ageGroupByTotalUserRatio[5].ageGroupRatio}],
							          chart: {
							          width: 380,
							          type: 'pie',
							        },
							        labels: ['${ageGroupByTotalUserRatio[0].ageGroup}', '${ageGroupByTotalUserRatio[1].ageGroup}', '${ageGroupByTotalUserRatio[2].ageGroup}', '${ageGroupByTotalUserRatio[3].ageGroup}', '${ageGroupByTotalUserRatio[4].ageGroup}', '${ageGroupByTotalUserRatio[5].ageGroup}'],
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
							
							        var chart = new ApexCharts(document.querySelector("#chart"), options);
							        chart.render();
							</script>
						</div>
					 </div>
	            </div>
	            

			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/admin/include/footer.jsp" />
</body>
</html>