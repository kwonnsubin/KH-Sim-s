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
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="stylesheet" href="${path}/resources/css/biz/main.css"/>
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

<!-- 사이드바 -->
<div id="wrap">
	    <nav id="header">
	        <p class="tit">마이페이지</p>
	        <ul class="list">
	            <li>
	                <a href="${path}/biz/infodetail">
	                   	     내 정보 보기
	                       <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                       </span>
	                </a>
	            </li>
	            <li>
	                <a href="${path}/biz/planList">
	                    	요금제 현황
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                </a>
	            </li>
	            <li>
	                <a href="${path}/biz/applyList">
	                    	가입신청 현황 
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                </a>
	            </li>
	            <li>
	                <a href="#">
	                    	리뷰 현황
	                        <span class="material-symbols-outlined">
	                        arrow_forward_ios
	                        </span>
	                </a>
	            </li>
	        </ul>
	    </nav>
</div>

<sec:authorize access="isAuthenticated()">
	<p><sec:authentication property="name"/>의 요금제 목록 </p>
</sec:authorize>

<h2>${bizName.bizName}의 요금제 목록</h2>
	<div>
        <span class="count float-1">총 ${vo} 건</span>
    </div>
    
    
    
    <div>
		<form action="${path}/biz/planList">
			<select name="cnt" onchange="submit();">
				<c:forEach var="num" begin="5" end="30" step="5">
					<option value="${num }" ${requestScope.paging.pageLimit eq num ? "selected" : "" }>${num } 개</option>
				</c:forEach>
			</select>
		</form>
	</div>
    
    <div>
        <table border="solid">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>요금제명</th>
                    <th>등록일</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${empty requestScope.paging.page}">
            		<tr>
            			<td colspan="4">등록된 요금제가 없습니다.</td>
            		</tr>
            	</c:if>
            	<c:if test="${not empty requestScope.paging.page}">
	                <c:forEach var="plan" items="${requestScope.paging.page}">
	                <tr>
	                    <td>${plan.rownum }</td>
	                    <td><a href="<%=request.getContextPath()%>/biz/planDetail?planNo=${plan.planNo }">${plan.planName }</a></td>
	                    <td>${plan.planDate } </td>
	                    <td>
	                    <button>수정</button><!-- 요금제 수정이 필요한가??? -->
	                    <button type="button" class="deleteBtn" data-bs-toggle="modal" data-bs-target="#deleteleModal" data-planno="${plan.planNo}">삭제</button>       
	                    </td>
	                </tr>
	                </c:forEach>   
                </c:if>             
            </tbody>
        </table>
    </div>
    
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
						
    <!-- search{s} -->
    <div>
    	<input type="text" name="keyword" id="keyword">
    	<button name="searchBtn" id="searchBtn">검색</button>
    </div>
    <!-- search{e} -->
    
    <% if (request.getParameter("keyword") != null) { %>
    <span>"<%=request.getParameter("keyword")%>"의 검색 결과입니다.</span>
    <% } %>
    
    <!-- 페이지 번호 -->
    	<c:if test="${not empty requestScope.paging.page}"> <!-- 요금제가 하나도 없으면 페이징X -->
			<ul class="pagination">
				<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
				<c:choose>
					<c:when test="${requestScope.paging.prevPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">prev</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${path}/biz/planList?p=${requestScope.paging.prevPage }">prev</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="pNum" items="${requestScope.paging.pageList }">
					<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${path}/biz/planList?p=${pNum }">${pNum }</a></li>
				</c:forEach>
				<c:choose>
					<c:when test="${requestScope.paging.nextPage eq -1 }">
						<li class="page-item disabled"><a class="page-link">next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${path}/biz/planList?p=${requestScope.paging.nextPage }">next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
    	</c:if>
    
    <div>
    	<button type="button"  onclick="registerBtn(this);">요금제 등록하기</button>
    </div>
    <%-- location.href='<%=request.getContextPath()%>/biz/registerPlan'" --%>
    
    
    
    
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
//planNo 값이 undefined...
/* var planNo ='';
var planNo = $('.deleteBtn').data('planNo');
console.log('함수 호출 전 planNo : '+planNo); //undefined 가 나오네...  */

/* let deleteBtn = document.getElementById('deleteBtn');
let planNo = deleteBtn.getAttribute('data-planNo');
console.log('let으로 변수 설정'+planNo); // 이렇게 하면 어떤 요금제를 선택하든 planNo가 113만 나옴..  */

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

<%-- $(document).ready(function(){
    $('#deleteleModal').on("show.bs.modal", function(e){
        var button = $(e.relatedTarget);
        var planNo = button.data('planNo');
        var modal = $(this);
        console.log(planNo);
        modal.find('#deletePostBtn').on('click', function(){
            $.ajax({
                url: "<%=request.getContextPath()%>/biz/deletePlan",
                type: "POST",
                data: {planNo: planNo},
                success: function(result) {
                    location.reload();
                },
                error: function() {
                    alert("에러가 발생했습니다.");
                }
            });
        }).data('planNo', planNo); // 삭제 버튼에도 planNo 값을 설정
        console.log(planNo);
    });
}); --%>

</script>	
	
	<%-- $(".btn.delete").on("click", deleteClickHandler);
	function deleteClickHandler(){
	  console.log("삭제버튼 누름");
	  var planNo = $('#deleteBtn').data('planNo');
	  $.ajax({
		    url:"<%=request.getContextPath()%>/biz/deletePlan"
		    , data : {planNo : planNo}
		    , success:function(result){
		      location.reload();
		    }
		    ,error:function(){
		      alert("에러가 발생했습니다.");
		    }
		  });
	 
	<%-- /*TODO 삭제*/
	$(".btn.delete").on("click", deleteClickHandler);
	function deleteClickHandler(){
	  console.log("삭제버튼 누름");
	  var planNo = $('#deleteBtn').data()
	 // var planNo = $('#deleteBtn').data('planNo');
	// var planNo = $('#deleteBtn' + ${plan.planNo}).data('planNo');

	  console.log(planNo); //planNo이 113 하나만 나옴. 
	  //TODO planNo를 어떻게 가져와야하나...
	/*   $("#deleteleModal").on("show.bs.modal", function(e){
			var planNo =  $(e.relatedTarget).data("planNo");
			alert(planNo);
	  });
	   */
	  //var planNo = $(this).closest('tr').find('td:eq(0)').text(); 
	  $.ajax({
	    url:"<%=request.getContextPath()%>/biz/deletePlan"
	    , data : {planNo : planNo}
	    , success:function(result){
	      location.reload();
	    },
	    error:function(){
	      alert("에러가 발생했습니다.");
	    }
	  });
	} --%>
 

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