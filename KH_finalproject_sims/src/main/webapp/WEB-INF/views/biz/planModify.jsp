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
<link rel="stylesheet" href="${path}/resources/css/biz/planModify.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

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



	<div class="container" style="margin-left: 269px;">
			<h2 class="tit">요금제 수정하기</h2>
			<hr class="line">
	</div>

<div class="container" style="margin-top: -4%";>
	<form action="modifyPlan" method="post" style="width: 155%">
	<input type="hidden" name="planNo" value="${planDetail.planNo }">
	<table class="table modiPlanTb" style="width: 65%">
		<tr>
			<th>
				<span>요금제명</span>
			</th>
			<td><input type="text" name="planName"  class="form-control" value="${planDetail.planName }"></td>
			<th>
				<span>통신사명</span>
			</th>
			<td >${planDetail.bizName}</td> <!-- 통신사명은 변경 불가 -->
		</tr>
		<tr>
			<th>
				<span>통신망</span>
			</th>
			<td>
				<select name="netNo" class="form-select">
				  <option value="1" ${planDetail.netNo eq 1 ? 'selected' : ''}>KT</option>
				  <option value="2" ${planDetail.netNo eq 2 ? 'selected' : ''}>SKT</option>
				  <option value="3" ${planDetail.netNo eq 3 ? 'selected' : ''}>LGU+</option>
				</select>
			</td>
			
			<th>
				<span>통신세대</span>
			</th>
			<td>
				<select name="genNo" class="form-select">
				  <option value="1" ${planDetail.genNo eq 1 ? 'selected' : ''}>5G</option>
				  <option value="2" ${planDetail.genNo eq 2 ? 'selected' : ''}>LTE</option>
				  <option value="3" ${planDetail.genNo eq 3 ? 'selected' : ''}>3G</option>
				  <option value="4" ${planDetail.genNo eq 4 ? 'selected' : ''}>LTE/3G</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>
				<span>기본료(원)</span>
			</th>
			<td><input type="text" name="planPrice" class="form-control" value="${planDetail.planPrice }"></td>
			<th>
				<span>기본음성(분)</span>
			</th>
			<td><input type="text" name="planVoice" class="form-control" value="${planDetail.planVoice }"></td>
		</tr>
		<tr>
			<th>
				<span>기본문자(건)</span>
			</th>
			<td><input type="text" name="planMessage" class="form-control" value="${planDetail.planMessage }"></td>
			<th>
				<span>기본데이터(mb)</span>
			</th>
			<td><input type="text" name="planData" class="form-control" value="${planDetail.planData }"></td>
		</tr>
		<tr>
			<th>
				<span>초과음성단가(초)</span>
			</th>
			<td><input type="text" name="planVoiceOver" class="form-control" value="${planDetail.planVoiceOver }"></td>
			<th>
				<span>초과문자단가(건)</span>
			</th>
			<td><input type="text" name="planMessageOver" class="form-control" value="${planDetail.planMessageOver }"></td>
			<th>
				<span>초과데이터단가(mb)</span>
			</th>
			<td><input type="text" name="planDataOver" class="form-control"  value="${planDetail.planDataOver }"></td>
		</tr>
	</table>
	
	
		<div class="btnGroup">
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/biz/planList'" class="btn">목록으로</button>
	    	<button type="submit"  class="btn">수정완료</button>
	    </div>
	</form>
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
  
</body>
</html>