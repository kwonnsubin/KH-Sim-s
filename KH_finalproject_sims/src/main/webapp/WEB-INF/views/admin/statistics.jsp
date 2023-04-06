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
    var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
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
				<!-- 가입자 많은 순 -->
				<div class="col-md-7">
	                <div class="card">
	                    <div class="card-header">
	                        <h5>가입자 많은 순</h5>
	                    </div>
	                    <div class="card-body">
	                    	<div id="chart_div" style="width:799px; height:540px;"></div>
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