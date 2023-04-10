<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${path}/resources/css/biz/main.css"/>
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
    
    
    <!-- Load the Google Charts library -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		// Define the function to draw the chart
		function drawChart() {
			// Define the data table
			var data = new google.visualization.DataTable();
			data.addColumn('date', 'Date');
			data.addColumn('number', 'Kepler-22b mission');
			data.addColumn('string', 'Kepler title');
			data.addColumn('string', 'Kepler text');
			data.addColumn('number', 'Gliese 163 mission');
			data.addColumn('string', 'Gliese title');
			data.addColumn('string', 'Gliese text');
			data.addRows([
				[new Date(2314, 2, 15), 12400, undefined, undefined,
					10645, undefined, undefined],
				[new Date(2314, 2, 16), 24045, 'Lalibertines', 'First encounter',
					12374, undefined, undefined],
				[new Date(2314, 2, 17), 35022, 'Lalibertines', 'They are very tall',
					15766, 'Gallantors', 'First Encounter'],
				[new Date(2314, 2, 18), 12284, 'Lalibertines', 'Attack on our crew!',
					34334, 'Gallantors', 'Statement of shared principles'],
				[new Date(2314, 2, 19), 8476, 'Lalibertines', 'Heavy casualties',
					66467, 'Gallantors', 'Mysteries revealed'],
				[new Date(2314, 2, 20), 0, 'Lalibertines', 'All crew lost',
					79463, 'Gallantors', 'Omniscience achieved']
			]);

			// Define the chart options
			var options = {
				displayAnnotations: true
			};

			// Instantiate and draw the chart, passing in the data and options
			var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}

		// Load the Google Charts library and run the drawChart function when it's ready
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
	</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
	
	차트야 나와라 왜 안나오니..
	
	<!-- Identify where the chart should be drawn. -->
 	<div id="chart_div" style="width: 900px; height: 500px;"></div>

	  
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