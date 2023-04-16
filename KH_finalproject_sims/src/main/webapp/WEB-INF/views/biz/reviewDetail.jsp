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
<link rel="stylesheet" href="${path}/resources/css/biz/reviewDetail.css"/>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />



	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
	<!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
    
  <!-- 이 링크 추가해야 모달창 작동함 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
리뷰 상세보기

	
	 <div class="container  reviewbox" style="margin-left: 300px;">
      <div class="row row-cols-3" >
		<div class="col bottonline">${reviewDetail.userId }</div>
        <%-- <div class="col bottonline">${reviewDetail.reviewStar }</div> --%>
        <div class="col bottonline form-control-plaintext">
		  <c:forEach var="i" begin="1" end="5">
		    <i class="fa${reviewDetail.reviewStar >= i ? '-solid' : (reviewDetail.reviewStar >= (i - 0.5) ? '-half-stroke' : '-regular')} fa-star" style="color: #ffdd00;"></i>
		  </c:forEach>
		</div>
		
        <div class="col bottonline">${reviewDetail.reviewDate }</div>
        <div class="col-12" style="height:400px">${reviewDetail.reviewContent }</div>
        
        
      </div>
    </div>
    
   <button type="button" onclick="location.href='<%=request.getContextPath()%>/biz/reviewList'">목록으로</button>

	<table border="solid">
	  <tr>
	    <td>첫번째 행, 첫번째 열</td>
	    <td>첫번째 행, 두번째 열</td>
	  </tr>
	  <tr style="height: 4em;">
	    <td colspan="2">두번째 행, 병합된 셀</td>
	  </tr>
	</table>


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