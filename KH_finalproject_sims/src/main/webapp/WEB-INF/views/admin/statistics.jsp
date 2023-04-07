<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<!--Load the AJAX API-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  // Load the Visualization API and the corechart package.
  google.charts.load('current', {'packages':['corechart', 'bar']}); // 특정  차트 유형의 패키지를 로드 (버전,차트유형)

  // Set a callback to run when the Google Visualization API is loaded.
  google.charts.setOnLoadCallback(drawChart); // drawChart 자바스크립트 호출
  google.charts.setOnLoadCallback(drawChartt); // drawChart 자바스크립트 호출
  google.charts.setOnLoadCallback(starRating); // drawChart 자바스크립트 호출
  google.charts.setOnLoadCallback(monthlyPlanOrderCount); // 월별 가입자 수
  google.charts.setOnLoadCallback(ageGroupPlanOrderCount); // 연령대별 총 가입자 수
  google.charts.setOnLoadCallback(dailyUserWriteCount); // 일별 가입자 수
  

  // Callback that creates and populates a data table,
  // instantiates the pie chart, passes in the data and
  // draws it.
  function drawChart() {

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
  
	// 연령대별 요금제 랭킹
  function drawChartt() {
	    // Create the data table.
		  var data = google.visualization.arrayToDataTable([
		      ['Element', 'Density', { role: 'style' }, { role: 'annotation' } ],
		      ['${ageGroupPlans[0].ageGroup}', ${ageGroupPlans[0].cnt}, '#FF8000', '${ageGroupPlans[0].planName}' ],
		      ['${ageGroupPlans[1].ageGroup}', ${ageGroupPlans[1].cnt}, '#B404AE', '${ageGroupPlans[1].planName}' ],
		      ['${ageGroupPlans[2].ageGroup}', ${ageGroupPlans[2].cnt}, '#5858FA', '${ageGroupPlans[2].planName}' ],
		      ['${ageGroupPlans[3].ageGroup}', ${ageGroupPlans[3].cnt}, '#0080FF', '${ageGroupPlans[3].planName}' ],
		      ['${ageGroupPlans[4].ageGroup}', ${ageGroupPlans[4].cnt}, '#0489B1', '${ageGroupPlans[4].planName}' ],
		   ]); 
	   
	    // Set chart options
	    var options = {'title':'연령대별 인기 요금제',
	                   'legend':'none',
	                   'chartArea': {'width': '80%', 'height': '80%'}
	                   };

	    // Instantiate and draw our chart, passing in some options.
	    var chart = new google.visualization.BarChart(document.getElementById('chartt_chart_div'));
	    chart.draw(data, options);
	  }
  

	  // 별점순 통신사 랭킹
	  function starRating() {
		    // Create the data table.
			  var data = google.visualization.arrayToDataTable([
			      ['Element', 'Density', { role: 'style' }, { role: 'annotation' } ],
			      ['1위', ${starRating[0].bizReviewStar}, '#FF8000', '${starRating[0].bizName}' ],
			      ['2위', ${starRating[1].bizReviewStar}, '#B404AE', '${starRating[1].bizName}' ],
			      ['3위', ${starRating[2].bizReviewStar}, '#5858FA', '${starRating[2].bizName}' ],
			      ['4위', ${starRating[3].bizReviewStar}, '#0080FF', '${starRating[3].bizName}' ],
			      ['5위', ${starRating[4].bizReviewStar}, '#0489B1', '${starRating[4].bizName}' ],
			   ]); 
		   
		    // Set chart options
		    var options = {'title':'별점순 통신사',
		                   'legend':'none',
		                   'chartArea': {'width': '80%', 'height': '80%'}
		                   };
	
		    // Instantiate and draw our chart, passing in some options.
		    var chart = new google.visualization.BarChart(document.getElementById('starRating_chart_div'));
		    chart.draw(data, options);
		  }
	  
	  
	  
	  // 월별 총 가입자 수
	  function monthlyPlanOrderCount() {
		    // Create the data table.
			  var data = google.visualization.arrayToDataTable([
			      ['Element', 'Density', { role: 'style' }, { role: 'annotation' } ],
			      ['${monthlyPlanOrderCount[0].orderMonth}', ${monthlyPlanOrderCount[0].cnt}, '#FF8000', '1' ],
			      ['${monthlyPlanOrderCount[1].orderMonth}', ${monthlyPlanOrderCount[1].cnt}, '#B404AE', '1' ],
			      ['${monthlyPlanOrderCount[2].orderMonth}', ${monthlyPlanOrderCount[2].cnt}, '#5858FA', '1' ],
			      ['${monthlyPlanOrderCount[3].orderMonth}', ${monthlyPlanOrderCount[3].cnt}, '#0080FF', '1' ],
			      ['${monthlyPlanOrderCount[4].orderMonth}', ${monthlyPlanOrderCount[4].cnt}, '#0489B1', '1' ],
			   ]); 
		   
		    // Set chart options
		    var options = {'title':'월별 가입자 수',
		                   'legend':'none',
		                   'chartArea': {'width': '80%', 'height': '80%'}
		                   };
	
		    // Instantiate and draw our chart, passing in some options.
		    var chart = new google.visualization.BarChart(document.getElementById('monthlyPlanOrderCount_chart_div'));
		    chart.draw(data, options);
		  }
	  
	  
	  // 연령대별 총 가입자 수 
	  function ageGroupPlanOrderCount() {
		    // Create the data table.
			  var data = google.visualization.arrayToDataTable([
			      ['Element', 'Density', { role: 'style' }, { role: 'annotation' } ],
			      ['${ageGroupPlanOrderCount[0].ageGroup}', ${ageGroupPlanOrderCount[0].cnt}, '#FF8000', '1' ],
			      ['${ageGroupPlanOrderCount[1].ageGroup}', ${ageGroupPlanOrderCount[1].cnt}, '#B404AE', '1' ],
			      ['${ageGroupPlanOrderCount[2].ageGroup}', ${ageGroupPlanOrderCount[2].cnt}, '#5858FA', '1' ],
			      ['${ageGroupPlanOrderCount[3].ageGroup}', ${ageGroupPlanOrderCount[3].cnt}, '#0080FF', '1' ],
			      ['${ageGroupPlanOrderCount[4].ageGroup}', ${ageGroupPlanOrderCount[4].cnt}, '#0489B1', '1' ],
			   ]); 
		   
		    // Set chart options
		    var options = {'title':'연령대별 총 가입자 수',
		                   'legend':'none',
		                   'chartArea': {'width': '80%', 'height': '80%'}
		                   };
	
		    // Instantiate and draw our chart, passing in some options.
		    var chart = new google.visualization.BarChart(document.getElementById('ageGroupPlanOrderCount_chart_div'));
		    chart.draw(data, options);
		  }
	  
	  
	  // 일별 가입자 수
	  function dailyUserWriteCount() {
		    // Create the data table.
	        var data = google.visualization.arrayToDataTable([
	            ['Year', 'Sales', 'Expenses', 'Profit'],
	            ['${dailyUserWriteCount[0].userWrDate}', ${dailyUserWriteCount[0].cnt}, 5, 5],
	            ['${dailyUserWriteCount[1].userWrDate}', ${dailyUserWriteCount[1].cnt}, 5, 5]
	            //['${dailyUserWriteCount[2].userWrDate}', ${dailyUserWriteCount[2].cnt}, 1120, 300],
	            //['${dailyUserWriteCount[3].userWrDate}', ${dailyUserWriteCount[3].cnt}, 1120, 300],
	            //['${dailyUserWriteCount[4].userWrDate}', ${dailyUserWriteCount[4].cnt}, 1120, 300],
	            //['${dailyUserWriteCount[5].userWrDate}', ${dailyUserWriteCount[5].cnt}, 1120, 300],
	            //['${dailyUserWriteCount[6].userWrDate}', ${dailyUserWriteCount[6].cnt}, 540, 350]
	          ]);

	          var options = {
	            chart: {
	              title: '일별 가입자 수 변화',
	              subtitle: 'Sales, Expenses, and Profit: 2014-2017',
	            }
	          };

	          var chart = new google.charts.Bar(document.getElementById('dailyUserWriteCount_chart_div'));
	          chart.draw(data, google.charts.Bar.convertOptions(options));
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
				<!-- 가입자 많은 순 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>가입자 많은 순</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="chart_chart_div" style="width:799px; height:540px;"></div>
						</div>
					 </div>
	            </div>
	            <!-- 연령대별 인기 요금제 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>연령대별 인기 요금제</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="chartt_chart_div" style="width:799px; height:540px;"></div>
						</div>
					 </div>
	            </div>
	            <!-- 별점순 통신사 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>별점순 통신사</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="starRating_chart_div" style="width:799px; height:540px;"></div>
						</div>
					 </div>
	            </div>
	            <!-- 월별 가입자 수 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>월별 가입자 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="monthlyPlanOrderCount_chart_div" style="width:799px; height:540px;"></div>
						</div>
					 </div>
	            </div>
	            <!-- 연령대별 총 가입자 수 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>연령대별 총 가입자 수</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="ageGroupPlanOrderCount_chart_div" style="width:799px; height:540px;"></div>
						</div>
					 </div>
	            </div>
	         	<!-- 일별 가입자 수 변화 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>일별 가입자 수 변화</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="dailyUserWriteCount_chart_div" style="width:799px; height:540px;"></div>
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