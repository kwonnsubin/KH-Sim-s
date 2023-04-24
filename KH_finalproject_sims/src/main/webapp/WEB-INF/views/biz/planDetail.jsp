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
<link rel="stylesheet" href="${path}/resources/css/biz/planDetail.css"/>
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
    
     <!-- google icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>


	<div class="titleMent">
    	<span class="material-symbols-outlined" style="float: left;">
		more_vert
		</span>
		<span>요금제 정보</span>
    </div>

	<div class="container">
		<table class="table" id="planDetail" style="width: 88%">
			<tr > 
				<th>
					<span>요금제명</span>
				</th>
				<td colspan="2">${planDetail.planName} </td>
				<th>
					<span>통신사명</span>
				</th>
				<td colspan="2">${planDetail.bizName}</td>
			</tr>
			<tr>
				<th>
					<span>통신망</span>
				</th>
				<td colspan="2">
				<c:choose>
					<c:when test="${planDetail.netNo eq 1}">
						KT
					</c:when>
					<c:when test="${planDetail.netNo eq 2}">
						SKT
					</c:when>
					<c:otherwise>
						LGU+
					</c:otherwise>
				</c:choose>
				</td>
				<th>
					<span>통신세대</span>
				</th>
				<td colspan="2">
				<c:choose>
					<c:when test="${planDetail.genNo eq 1}">
						5G
					</c:when>
					<c:when test="${planDetail.genNo eq 2}">
						LTE
					</c:when>
					<c:when test="${planDetail.genNo eq 3}">
						3G
					</c:when>
					<c:otherwise>
						LTE/3G
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					<span>기본료(원)</span>
				</th>
				<td colspan="2">${planDetail.planPrice}</td>
				<th>
					<span>기본음성(분)</span>
				</th>
				<td colspan="2">${planDetail.planVoice}</td>
			</tr>
			<tr>
				<th>
					<span>기본문자(건)</span>
				</th>
				<td colspan="2">${planDetail.planMessage}</td>
				<th>
					<span>기본데이터(mb)</span>
				</th>
				<td colspan="2">${planDetail.planData}</td>
			</tr>
			<tr>
				<th>
					<span>초과음성단가(초)</span>
				</th>
				<td>${planDetail.planVoiceOver}</td>
				<th>
					<span>초과문자단가(건)</span>
				</th>
				<td>${planDetail.planMessageOver}</td>
				<th>
					<span>초과데이터단가(mb)</span>
				</th>
				<td>${planDetail.planDataOver}</td>
			</tr>
			<!-- 수정된 적이 없으면 애초에 수정일자가 보이지 않게..  -->
			<c:if test="${not empty planDetail.planUpdateDate}">
			  <tr>
			    <th><span>수정일자</span></th>
			    <td>${planDetail.planUpdateDate}</td>
			  </tr>
			</c:if>
	
		</table>
	</div>
	
	<div class="btnGroup">
		<button class= "btn" onclick="location.href='${pageContext.request.contextPath}/biz/planList'">목록</button>
		<button class= "btn" onclick="location.href='${pageContext.request.contextPath}/biz/modifyPlan?planNo=${planDetail.planNo }'">수정</button>
	</div>
<!-- <script>
	function goBack() {
	  window.history.back();
	}
</script> -->

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