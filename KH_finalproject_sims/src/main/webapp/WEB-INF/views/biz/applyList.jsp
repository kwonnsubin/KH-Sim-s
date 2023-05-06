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
<link rel="stylesheet" href="${path}/resources/css/biz/applyList.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

 	<!-- Date Range Picker -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> 
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
    
    
	<!-- Material Icons 라이브러리 추가 -->
  	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  	
 
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>




<div class="container" style="display:flex; margin:-103px 0 -200px 0; padding:150px 0 380px 0; /* height: 900px; */" >
	<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
	
	
	<div class="content">
		<div class="container" style="margin-left: -11%;">
			<h2 class="tit">가입 신청 현황</h2>
			<hr class="line">
		</div>
	
		<div class="searchTop d-flex">
			<div class="col-md-2" style="width: 7.5% !important;">
				<form action="${path}/biz/applyList" class="listSelect">
						<select class="form-select" style="width: 100px" name="cnt" onchange="submit();">
							<c:forEach var="num" begin="5" end="30" step="5">
								<option value="${num }" ${requestScope.paging.pageLimit eq num ? "selected" : "" }>${num } 개</option>
							</c:forEach>
						</select>
				</form>	
			</div>
		
			<div class="input-group col-md-3" style="padding-right: 60px;">	
			<!-- 검색창에 검색값 유지  -->
			<%
				String keyword = request.getParameter("keyword");
			%>
			<!-- search{s} -->
				<div style="display: flex;">
		
					<select class="form-select" style="display: inline-block; width: 120px" name="searchType" id="searchType">
						<option value="planName">요금제명</option>
						<option value="userId">신청자</option>
					</select>
					<input class="form-control" style="display: inline-block; width: 300px;" type="text"
					 name="keyword" id="keyword" value=${keyword}>
					
			<!-- 분류 {s} -->
				</div>	
			</div>
				
				
			<!-- 기간조회 -->	
			<div class="form-check form-switch">
		    	<input class="form-check-input" type="checkbox" role="switch" role="switch" id="date-checkbox" />기간 조회
		    </div>
			
			<div id="date-container"> 
				<!-- <input type="text" name="dates" value=""  class="form-control"/> -->
			</div>	
				
			
			<%
			    String orderStatus = request.getParameter("orderStatus");
			%>
			<div class="rdGroup col-md-4" >
				<div class="form-check-inline">
				    <input class="form-check-input" type="radio" name="division" id="exampleRadios1" value="0" <% if (orderStatus == null || orderStatus.equals("0") || orderStatus.equals("")) { %>checked<% } %>>
				    <label class="form-check-label" for="exampleRadios1">
				        전체
				    </label>
				</div>
				<div class="form-check-inline">
				    <input class="form-check-input" type="radio" name="division" id="exampleRadios2" value="1" <% if (orderStatus != null && orderStatus.equals("1")) { %>checked<% } %>>
				    <label class="form-check-label" for="exampleRadios2">
				        신청완료
				    </label>
				</div>
				<div class="form-check-inline">
				    <input class="form-check-input" type="radio" name="division" id="exampleRadios3" value="2" <% if (orderStatus != null && orderStatus.equals("2")) { %>checked<% } %>>
				    <label class="form-check-label" for="exampleRadios3">
				        승인완료
				    </label>
				</div>
				<div class="form-check-inline">
				    <input class="form-check-input" type="radio" name="division" id="exampleRadios4" value="3" <% if (orderStatus != null && orderStatus.equals("3")) { %>checked<% } %>>
				    <label class="form-check-label" for="exampleRadios4">
				        승인보류
				    </label>
				</div>
			</div>
					
					<button name="btnSearch" id="btnSearch" class="btn btn-outline-secondary col-md-2">
					<span class="material-symbols-outlined">
					search
					</span>
					</button>
		</div>		
	
	
	
		<div>
			<div class="totalMent">총 ${applyListCnt}개의 결과가 있습니다.</div>
		
		
			<div class="resultMent-box">
			    <div style="display: grid;">
			        <% if (request.getParameter("keyword") != null && !request.getParameter("keyword").isEmpty()) { %>
			            <span class="resultMent">"<%=request.getParameter("keyword")%>"의 검색 결과입니다.</span>
			        <% } %>
			        
			        <% if ((request.getParameter("startDate") != null && !request.getParameter("startDate").isEmpty())
			              && (request.getParameter("endDate") != null && !request.getParameter("endDate").isEmpty())) { %>
			            <span class="resultMent">"<%=request.getParameter("startDate")%> ~ <%=request.getParameter("endDate")%> " 기간의 결과입니다.</span>
			        <% } %>
			    </div>
			</div>
		</div>


	
	
	
	 	<table class="table table-hover table-responsive" id="applyTb" style="width: 144%;  position: relative;">
	            <thead>
	                <tr class="text-center mx-auto" style="background-color: #ecf7fd;">
	                    <th>번호</th>
	                    <th>요금제명</th>
	                    <th>신청번호<br>신청자</th>
	                    <th>가입신청상태</th>
	                    <th>신청일자</th>
	                    <th>관리</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:if test="${empty requestScope.paging.page}">
	            		<tr>
	            			<td colspan="6">가입신청서가 없습니다.</td>
	            		</tr>
	            	</c:if>
	            
	            	<c:if test="${not empty requestScope.paging.page}">
		                <c:forEach var="applyList" items="${requestScope.paging.page}">
		                <tr class="text-center mx-auto">
		                    <td>${applyList.rn }</td>
		                    <td>${applyList.planName }</td>
		                    <td>${applyList.serialNo }<br>${applyList.userId }</td>
		                    <td>
		                    <c:choose>
		                    	<c:when test="${applyList.orderStatus eq 1}">
		                    		신청완료
		                    	</c:when>
		                    	<c:when test="${applyList.orderStatus eq 2}">
		                    		<span class="approve-ment">승인완료</span>
		                    	</c:when>
		                    	<c:otherwise>
									<span class="hold-ment">승인보류</span>
								</c:otherwise>
		                    </c:choose>
		                    </td>
		                    <td>${applyList.orderDate }</td>
		                    <td><button type="button" class="btn detail" data-orderNo="${applyList.orderNo}"
		                    onclick="location.href='<%=request.getContextPath()%>/biz/applydetail?orderNo=${applyList.orderNo}'">
		                    상세보기</button></td>
		                </tr>
		                </c:forEach>   
	                </c:if>          
	            </tbody>
	        </table>
	        
	     <!-- 페이지 번호 -->
	     <c:if test="${not empty requestScope.paging.page}"> <!-- 신청서가 하나도 없으면 페이징X -->
			<ul class="pagination" style="position: absolute;">
				<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
				<c:choose>
					<c:when test="${requestScope.paging.prevPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">prev</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" 
						href="${path}/biz/applyList?p=${requestScope.paging.prevPage }
						&searchType=${searchType }&keyword=${keyword }&orderStatus=${orderStatus}&startDate=${startDate }&endDate=${endDate}">prev</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="pNum" items="${requestScope.paging.pageList }">
					<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link"
					 href="${path}/biz/applyList?p=${pNum }&searchType=${searchType }
					 &keyword=${keyword }&orderStatus=${orderStatus}&startDate=${startDate }&endDate=${endDate}">${pNum }</a></li>
				</c:forEach>
				<c:choose>
					<c:when test="${requestScope.paging.nextPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" 
						href="${path}/biz/applyList?p=${requestScope.paging.nextPage }
						&searchType=${searchType }&keyword=${keyword }&orderStatus=${orderStatus}&startDate=${startDate }&endDate=${endDate}">next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		  </c:if>
	</div>	  

</div>

<!-- <script>
	window.onload = function() {
		  document.getElementById("exampleRadios1").checked = true;
		};
</script>
 -->
<script type="text/javascript">
    $(document).ready(function() {
      // 체크박스 클릭 이벤트 핸들러
      $('#date-checkbox').change(function() {
        if (this.checked) {
          // 체크박스가 선택되었을 때
          var element = 
            '<div>' +
            '<input type="text" name="dates" value="" class="form-control" style="width:108%; margin-left:10%"/>' +
            '</div>';
          $('#date-container').append(element);
          
          // DateRangePicker 적용
          $('input[name="dates"]').daterangepicker();
          
        } else {
          // 체크박스가 선택 해제되었을 때
          $('#date-container').empty();
        }
      });
    });
  </script>
<script type="text/javascript">
	$('input[name="dates"]').daterangepicker();

</script>
<script>
//검색
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
	
		
		var url="${pageContext.request.contextPath}/biz/applyList";
		url = url + "?searchType="+$('#searchType').val();
		url = url + "&keyword="+$('#keyword').val();
		url = url + "&orderStatus="+$("input[name='division']:checked").val();
		
		
		/*기간조회를 체크하지 않은 경우 null, 즉 전체 기간 조회*/
		var startDate = null;
		var endDate = null;
		
		if ($('#date-checkbox').is(':checked')) {
		  startDate = $('input[name="dates"]').data('daterangepicker').startDate.format('YY/MM/DD');
		  endDate = $('input[name="dates"]').data('daterangepicker').endDate.format('YY/MM/DD');
		  
		  url += "&startDate=" + startDate;
		  url += "&endDate=" + endDate;
		}
	
		location.href=url;
		console.log(url);
	});
</script>



<!-- <script> 날짜 옵션 없이 정상 작동
//검색
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url="${pageContext.request.contextPath}/biz/applyList";
		url = url + "?searchType="+$('#searchType').val();
		url = url + "&keyword="+$('#keyword').val();
		url = url + "&orderStatus="+$("input[name='division']:checked").val();
		location.href=url;
		console.log(url);
	});
</script>
 -->




<!-- <script>
//쿠키에 의해 라디오버튼 체크 상태 유지
	$(document).ready(function(){
		 var orderStatus = getCookie("orderStatus");
		  if (orderStatus != "") {
		    $("input[name='division'][value='" + orderStatus + "']").prop('checked', true);
		  } else {
			//쿠키가 없을 경우 첫 번째 라디오 버튼을 선택
			$("input[name='division']:first").prop('checked', true);
		  }
	});

	function getCookie(name) {
	  var value = "; " + document.cookie;
	  var parts = value.split("; " + name + "=");
	  if (parts.length == 2) return parts.pop().split(";").shift();
	  return "";
	}
</script> -->


	<jsp:include page="/WEB-INF/views/footer.jsp"/>
	
	<!-- Scripts -->
	<%-- <script src="<%= request.getContextPath() %>/resources/chain/vendor/jquery/jquery.min.js"></script> --%><!-- daterangepicker에 의한 제이쿼리 중복 -->
	<script src="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/owl-carousel.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/animation.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/imagesloaded.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/popup.js"></script>
	<script src="<%= request.getContextPath() %>/resources/chain/assets/js/custom.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/user/myinfo.js"></script>
  
</body>
</html>