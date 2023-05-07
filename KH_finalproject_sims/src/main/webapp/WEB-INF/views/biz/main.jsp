<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> <!-- 채널톡사용 -->
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
    
<title>${bizName.bizName} | 통계현황</title>
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
    
    
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


	<!-- 요금제별 누적 가입자 수 , 하루 가입자 수 -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
    	  $.ajax({
  	        url: "${pageContext.request.contextPath}/biz/planAcc.Aj",
  	        type: "post",
  	        dataType:"json",
  	        success: function(json) {
  	            console.log(json);
  	            var chartData = [['요금제명', '누적 가입수', { role: 'style' }, '하루 가입수', { role: 'style' }]];
  	        	for (var i = 0; i < json.length; i++) {
	  	            var randomColor1 = getRandomColor(); // 랜덤 색상을 생성하는 함수
	  	            var randomColor2 = getRandomColor(); 
	  	            chartData.push([json[i].planName, json[i].planApplyCnt, randomColor1, json[i].todayApplyCnt ,randomColor2]);
  	        }
	            console.log("차트 데이타 : "+chartData);
	            
	 
	            var options = {
		                title: '요금제별  가입자 수(누적 / 일일)',
		                /* width: '100%',
		                height: '400',  */             
		                legend: { position: 'none' },
		                vAxis:{format: '#'} //y축 값을 소수점 없이 정수로 표현하기 위한 포맷 설정
		                //여기서 color를 정해도 되지만, 그 경우에 요금제가 새로 등록되었을 경우 열의 개수와
		                // 맞지 않아서 오류가능성 있기 때문에 랜덤으로 색상 부여함. 
		               /*  , chartArea:{
		                	left:5,
		                    top: 20,
		                    width:'100%',
		                    height:'350'
		                  } */
		               
		            };
		
		            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
		            chart.draw(google.visualization.arrayToDataTable(chartData), options);
		            
		            // 색상 랜덤으로 부여하기 위한 함수
		            function getRandomColor() {
		            	  var letters = '0123456789ABCDEF';
		            	  var color = '#';
		            	  for (var i = 0; i < 6; i++) {
		            	    color += letters[Math.floor(Math.random() * 16)];
		            	  }
		            	  return color;
		            }
		        },
		        
		        error : function(request,status,error) {
		        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+
		        	error);
  	        }     
  	    });
  	}
    </script>

<!-- 최근 일주일간 해당 통신사 요금제 가입자 열 그래프 -->
<script type="text/javascript">
	  google.charts.load('current', {packages: ['corechart']}); 
	  google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/biz/main",
	        type: "post",
	        dataType:"json",
	        success: function(json) {
	            // JSON 데이터를 받아 처리
	            console.log(json);
	            var chartData = [['일자', '가입수']];
	            for (var i = 0; i < json.length; i++) {
	                chartData.push([json[i].date, json[i].orderCnt]);
	            }  
	            console.log("차트 데이타 : "+chartData);
	
	            var options = {
	                title: '최근 일주일간 요금제 가입자 수',
	                width: '100%',
	                height: '400',              
	                legend: { position: 'none' },
	               /*   chartArea:{
	                    width:'100%',
	                    height:'350'
	                  } */
	                 colors: ['#BFCCB5', '#7C96AB', '#B7B7B7', '#EDC6B1', '#65647C', '#8B7E74', '#C7BCA1']
	               , series: {
					        0: {color: '#BFCCB5'},
					        1: {color: '#7C96AB'},
					        2: {color: '#B7B7B7'},
					        3: {color: '#EDC6B1'},
					        4: {color: '#65647C'},
					        5: {color: '#8B7E74'},
					        6: {color: '#C7BCA1'}
					    } /*인덱스와 데이터 시리즈의 인덱스가 일치하지 않아 색상적용 불가.. */
	            };
	
	            var chart = new google.visualization.BarChart(document.getElementById('chart_div')); 
	            chart.draw(google.visualization.arrayToDataTable(chartData), options); 
	        },
	        error : function(request,status,error) {
	        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+
	        	error);
	        }     
	    });
	}

  </script>

<!-- 원형차트 -->
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

    	  $.ajax({
    		   url : "${pageContext.request.contextPath}/biz/piechart"
    		  ,type : "post"
    		  ,dataType : "json"
    		  ,success : function(json){
    			  console.log(json);
    			  console.log("data : "+data);
    			  
    			  //원형차트는 Array 대신 DataTable 또는 DataView와 함께 호출하라고 에러
    			  //json 데이터를 DataTable 객체로 변환한 다음, 이를 draw() 메소드의 인자로 전달
    			  var data = new google.visualization.DataTable();
    	            data.addColumn('string', '연령대');
    	            data.addColumn('number', '가입수');
    	            for (var i = 0; i < json.length; i++) {
    	                data.addRow([json[i].ageGroup, json[i].ageCnt]);
    	            }
    			  console.log("data : "+data)
    			  
		          var options = {
		               title: '가장 인기있는 요금제(${selectTopPlanName})의 연령대 비율'
		               };
		
		          var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		
		          chart.draw(data, options);
    		  }
    		  ,error : function(request,status,error) {
  	        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+
  	  	        	error);
  	  	        }     
    	  });
      }
    </script>
    
    <!-- 원형 차트2 -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

    	  $.ajax({
    		   url : "${pageContext.request.contextPath}/biz/piechart2.Aj"
    		  ,type : "post"
    		  ,dataType : "json" 
    		  ,success : function(json){
    			  console.log(json);
    			  console.log("data : "+data);

    			  var data = new google.visualization.DataTable();
    	            data.addColumn('string', '성별');
    	            data.addColumn('number', '가입수');
    	            for (var i = 0; i < json.length; i++) {
    	                data.addRow([json[i].gender, json[i].genderCnt]);
    	            }
    			  console.log("data : "+data)
    			  
		          var options = {
		               title: '가장 인기 있는 요금제(${selectTopPlanName})의 성별 비율'
		               };
		
		          var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
		
		          chart.draw(data, options);
    		  }
    		  ,error : function(request,status,error) {
  	        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+
  	  	        	error);
  	  	        }     
    	  });
      }
    </script>

	<!-- 도넛 차트 -->
	<!-- 통신사 전체 이용 연령대 비율 -->
	 <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      
      function drawChart() {
    	  
    	  $.ajax({
   		   url : "${pageContext.request.contextPath}/biz/bizAgeRatio.Aj" 
   		  ,type : "post"
   		  ,dataType : "json" 
   		  ,success : function(json){
   			  console.log(json);
   			  console.log("data : "+data);
   			  
   		
   			  var data = new google.visualization.DataTable();
   	            data.addColumn('string', '연령대');
   	            data.addColumn('number', '가입수');
   	            for (var i = 0; i < json.length; i++) {
   	                data.addRow([json[i].ageGroup, json[i].ageCnt]);
   	            }
   			  console.log("data : "+data)
   			  
		          var options = {
		               title: '통신사 전체 이용 연령대 비율',
		               pieHole: 0.4,
		               };
		
		          var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
		
		          chart.draw(data, options);
   		  }
   		  ,error : function(request,status,error) {
 	        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+
 	  	        	error);
 	  	        }     
   	 	 });
      }
    </script>

	<!-- 통신사 전체 이용 성별 비율 -->
	<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      
      function drawChart() {
    	  
    	  $.ajax({
   		   url : "${pageContext.request.contextPath}/biz/bizGenderRatio.Aj" 
   		  ,type : "post"
   		  ,dataType : "json" 
   		  ,success : function(json){
   			  console.log(json);
   			  console.log("data : "+data);
   			  
   		
   			  var data = new google.visualization.DataTable();
   			 	data.addColumn('string', '성별');
	            data.addColumn('number', '가입수');
	            for (var i = 0; i < json.length; i++) {
	                data.addRow([json[i].gender, json[i].genderCnt]);
	            }
   			  console.log("data : "+data)
   			  
		          var options = {
		               title: '통신사 전체 이용 성별 비율',
		               pieHole: 0.4,
		               };
		
		          var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
		
		          chart.draw(data, options);
   		  }
   		  ,error : function(request,status,error) {
 	        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+
 	  	        	error);
 	  	        }     
   	 	 });
      }
    </script>

</head>
<body>
<spring:eval expression="@apikey['apikey.channelIO']" var="channelIO"/><!-- 채널톡 사용 -->

<jsp:include page="/WEB-INF/views/header.jsp"/>

<div class="container mw-100" style="display:flex; margin:-103px 0 -200px 0; padding:150px 0 380px 0;">
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>

	<div class="container" style="margin-left: 3%;">


		<%
		  Date date = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm 기준");
		  String currentTime = sdf.format(date);
		%>
		
		<div class="container d-flex" style="margin-left: 2%;" >
				<div>
					<h2 class="tit">통계 현황</h2>
					<hr class="line">
				</div>
				
			 <div class="container d-flex justify-content-end" style="align-items: end";>
			 <p><%=currentTime%></p>
			</div>
		</div>
		
		
		<div class="container content" style="width: 104%; margin-top: -3%;">
			<div class="container row-gourp">
				<div class="d-flex">
						<div class="division-box">
							<span>가입자 수</span>
						</div>
						<hr>
				</div>
					
				<div class="row">
					<div class="chart-container col-8 chartbox" id="chart_div2"></div>   
					<div class="chart-container col-4 chartbox" id="chart_div" ></div>
				</div>
			</div>
			  
			
			<div class="container row-gourp">
				<div class="d-flex">
						<div class="division-box">
							<span>가장 인기있는 요금제</span>
						</div>
						<hr>
				</div>
			
				<div class="row">
					<!-- 원형차트 / 가장 인기 있는 요금제 기준-->
				    <div class="col chartbox" id="piechart" style="width: 900px; height: 500px;" ></div> 
				    <div class="col chartbox" id="piechart2" style="width: 900px; height: 500px;"></div>
			    </div>
			    
			 </div>
			 
			 <div class="container row-gourp">   
					 <div class="d-flex">
							<div class="division-box">
								<span>통신사 이용</span>
							</div>
							<hr>
					 </div>
			 
			    <div class="row">
				      <!-- 도넛 차트 / 통신사 전체 기준-->
				    <div class="col chartbox" id="donutchart" style="width: 900px; height: 500px;"></div>
					<div class="col chartbox" id="donutchart2" style="width: 900px; height: 500px;"></div>
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
	  
<script>
	  //create trigger to resizeEnd event     
		$(window).resize(function() {
		    if(this.resizeTO) clearTimeout(this.resizeTO);
		    this.resizeTO = setTimeout(function() {
		        $(this).trigger('resizeEnd');
		    }, 500);
		});
		
		//redraw graph when window resize is completed  
		$(window).on('resizeEnd', function() {
		    drawChart(data); 
		});
</script>

<script> //채널톡
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();

  ChannelIO('boot', {
    "pluginKey": "<c:out value='${channelIO}' />" //properties 파일에 키
  });
</script>

</body>
</html>