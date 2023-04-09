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

	<!-- Bootstrap core CSS -->
    <link href="<%= request.getContextPath() %>/resources/chain/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/animated.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/chain/assets/css/owl.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/user/myinfo.css"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>
요금제 가입 신청 목록
	<div>
		<form action="${path}/biz/applyList">
			<select name="cnt" onchange="submit();">
				<c:forEach var="num" begin="5" end="30" step="5">
					<option value="${num }" ${requestScope.paging.pageLimit eq num ? "selected" : "" }>${num } 개</option>
				</c:forEach>
			</select>
		</form>
	</div>


<!-- search{s} -->
	<div>
		<select name="searchType" id="searchType">
			<option value="planName">요금제명</option>
			<option value="userId">신청자</option>
		</select>
		<input type="text" name="keyword" id="keyword">
		<button name="btnSearch" id="btnSearch">검색</button>
	</div>


 <table class="table">
            <thead>
                <tr>
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
	                <tr>
	                    <td>${applyList.rn }</td>
	                    <td>${applyList.planName }</td>
	                    <td>${applyList.serialNo }<br>${applyList.userId }</td>
	                    <td>
	                    <c:choose>
	                    	<c:when test="${applyList.orderStatus eq 1}">
	                    		신청완료
	                    	</c:when>
	                    	<c:when test="${applyList.orderStatus eq 2}">
	                    		승인완료
	                    	</c:when>
	                    	<c:otherwise>
							승인보류
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
		<ul class="pagination">
			<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
			<c:choose>
				<c:when test="${requestScope.paging.prevPage eq -1 }">
					<li class="page-item disabled"><a class="page-link">prev</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${path}/biz/applyList?p=${requestScope.paging.prevPage }">prev</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="pNum" items="${requestScope.paging.pageList }">
				<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${path}/biz/applyList?p=${pNum }">${pNum }</a></li>
			</c:forEach>
			<c:choose>
				<c:when test="${requestScope.paging.nextPage eq -1 }">
					<li class="page-item disabled"><a class="page-link">next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${path}/biz/applyList?p=${requestScope.paging.nextPage }">next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	  </c:if>


<script>
//검색
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url="${pageContext.request.contextPath}/biz/applyList";
		url = url + "?searchType="+$('#searchType').val();
		url = url + "&keyword="+$('#keyword').val();
		location.href=url;
		console.log(url);
		
	});
</script>

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