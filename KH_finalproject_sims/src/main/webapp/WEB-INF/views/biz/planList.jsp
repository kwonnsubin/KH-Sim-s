<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
<link rel="stylesheet" href="${path}/resources/css/biz/planList.css"/>
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
    
	<!-- Material Icons 라이브러리 추가 -->
  	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>

<sec:authorize access="isAuthenticated()">
	<p><sec:authentication property="name"/>의 요금제 목록 </p>
</sec:authorize>

<h2>${bizName.bizName}의 요금제 목록</h2>


	<div class="searchTop">
	
	
		
			<form action="${path}/biz/planList" class="listSelect">
				<select class="form-select" style="width: 100px" name="cnt" onchange="submit();">
					<c:forEach var="num" begin="5" end="30" step="5">
						<option value="${num }" ${requestScope.paging.pageLimit eq num ? "selected" : "" }>${num } 개</option>
					</c:forEach>
				</select>
			</form>
		
		
		
				
	    <!-- search{s} -->
	    <div class="input-group" style="width: auto; height: 20%; padding-right: 60px; margin-left: -10%;">
	    
		    <div style="display: flex;">
		    	<input class="form-control" style="display: inline-block; width: 300px;" type="text" name="keyword" id="keyword">
		    	<button name="searchBtn" class="btn btn-outline-primary" id="searchBtn">
		    	<span class="material-symbols-outlined">
				search
				</span>
				</button>
				
			</div>	
	    </div>
	    <!-- search{e} -->
	
	    
	   
    
    </div>
    
	<div>
        <span class="count float-1 totalMent" >총 ${vo} 건의 결과가 있습니다.</span>
    </div>
    
     <div class="regBtn">
    	<button type="button"  onclick="registerBtn(this);">요금제 등록하기</button>
    </div>
    
    <% if (request.getParameter("keyword") != null && !request.getParameter("keyword").isEmpty()) { %>
    <span>"<%=request.getParameter("keyword")%>"의 검색 결과입니다.</span>
	<% } %>
    
        <table class="table table-hover" id="planTb" style="width: 80%;  position: relative;">
            <thead>
                <tr class="text-center mx-auto" style="background-color: #f7f7f7;">
                    <th>번호</th>
                    <th>요금제명</th>
                    <th>등록일</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody >
            	<c:if test="${empty requestScope.paging.page}">
            		<tr>
            			<td colspan="4">등록된 요금제가 없습니다.</td>
            		</tr>
            	</c:if>
            	<c:if test="${not empty requestScope.paging.page}">
	                <c:forEach var="plan" items="${requestScope.paging.page}">
	                <tr class="text-center mx-auto">
	                    <td>${plan.rn }</td>
	                    <td><a href="<%=request.getContextPath()%>/biz/planDetail?planNo=${plan.planNo }">${plan.planName }</a></td>
	                    <td>${plan.planDate } </td>
	                    <td>
	                    <button type="button" onclick="location.href=
	                    '${pageContext.request.contextPath}/biz/modifyPlan?planNo=${plan.planNo }'">수정</button>
	                    <button type="button" class="deleteBtn" data-bs-toggle="modal" 
	                    data-bs-target="#deleteleModal" data-planno="${plan.planNo}">삭제</button>       
	                    </td>
	                </tr>
	                </c:forEach>   
                </c:if>             
            </tbody>
        </table>
 
    
     <!-- Modal -->
	<div class="modal fade" id="deleteleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">요금제 삭제</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	    	요금제를 정말로 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	      	<input type="hidden" id="selectedPlanNo">
	        <button type="button" class="btn modalDelete btn-secondary" id="deletePostBtn">삭제</button>
	        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    


    
    <!-- 페이지 번호 -->
    	<c:if test="${not empty requestScope.paging.page}"> <!-- 요금제가 하나도 없으면 페이징X -->
			<ul class="pagination" style="position: absolute;">
				<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
				<c:choose>
					<c:when test="${requestScope.paging.prevPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">prev</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
						 href="${path}/biz/planList?p=${requestScope.paging.prevPage }&keyword=${keyword }">prev</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="pNum" items="${requestScope.paging.pageList }">
					<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" 
					href="${path}/biz/planList?p=${pNum }&keyword=${keyword }">${pNum }</a></li>
				</c:forEach>
				<c:choose>
					<c:when test="${requestScope.paging.nextPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
						 href="${path}/biz/planList?p=${requestScope.paging.nextPage }&keyword=${keyword }">next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
    	</c:if>
    
  
    
    
<script>
	function registerBtn(){
		location.href="<%=request.getContextPath()%>/biz/registerPlan";
	}
</script>  

<script>
	$(document).on('click','#searchBtn', function(e){
		e.preventDefault();
		var url ="<%=request.getContextPath()%>/biz/planList";
		url = url + "?keyword="+$('#keyword').val();
		location.href=url;
		console.log(url);
	});
</script>

<script>

$(document).ready(function() {
	
$(".deleteBtn").click(function(){
	console.log($("#selectedPlanNo").val());
	console.log($(this).data("planno"));
	$("#selectedPlanNo").val($(this).data("planno"));
});
$('.btn.modalDelete').click(function() {
	  console.log("모달창의 삭제 버튼을 누름");
	  console.log('에이작스 전 planNo : '+ $("#selectedPlanNo").val());
//	  var planNo = $('.deleteBtn').data('planNo');
	  var planNo = $("#selectedPlanNo").val();
	  $.ajax({
	      url: "${pageContext.request.contextPath}/biz/deletePlan"
	    , type: "post"
	    , data: {planNo: planNo}
	    , success: function(result) {
	    	console.log('성공했을 때'+planNo);
	    	location.reload();
	    	}
	    , error: function(xhr, status, error) {
	    	
	    	alert("에러가 발생했습니다. 왜?????????????");
	    	console.log('에이작스 후 planNo : '+planNo);
	    }
	  });
	});
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