<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link rel="stylesheet" href="${path}/resources/css/biz/reviewList.css"/>
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




<div class="container" style="display:flex; margin:-103px 0 -200px 0; padding:150px 0 380px 0;">
	<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>

	<div class="content">
		
		<div class="container">
			<h2 class="tit">통신사 리뷰 현황</h2>
			<hr class="line">
		</div>	
		<!-- 버튼으로 조회 -->
		<%-- <form id="reportStatusForm" action="<%=request.getContextPath()%>/biz/selectByReportStatus" method="get" style="display: flex; justify-content: flex-end; margin-right: 10%;">
		  <div class="btn-group mt-3 mb-3" role="group" aria-label="Basic example">
		  	<button type="button" class="btn btn-outline-primary" id="all">전체</button>
		    <button type="button" class="btn btn-outline-primary" id="inProgress">신고처리중</button>
		    <button type="button" class="btn btn-outline-primary" id="rejected">반려</button>
		    <button type="button" class="btn btn-outline-primary" id="deleted">삭제</button>
		  </div>
		  <input type="hidden" id="reportStatus" name="reportStatus" value=""> <!-- 클릭하면 value에 값이 들어가게 함.  -->
		</form>
 --%>
		
		
		<%
		    String reportStatus = request.getParameter("reportStatus");
		%>
		<form id="reportStatusForm" action="<%=request.getContextPath()%>/biz/selectByReportStatus" method="get" style="display: flex; justify-content: flex-end; margin-right: 10%;">
		  <div class="btn-group mt-3 mb-3" role="group" aria-label="Basic example">
		    <label for="all" class="btn btnStatus btn-outline-primary">
		      <input type="radio" id="all" name="reportStatus" value="0" 
		        <% if (reportStatus == null || reportStatus.equals("0") || reportStatus.equals("")) 
    			{ %>checked<% } %>>전체
		    </label>
		    <label for="inProgress" class="btn btnStatus btn-outline-primary">
		      <input type="radio" id="inProgress" name="reportStatus" value="1" <% if (reportStatus != null && reportStatus.equals("1")) { %>checked<% } %>>
		     	 신고처리중
		    </label>
		    <label for="rejected" class="btn btnStatus btn-outline-primary">
		      <input type="radio" id="rejected" name="reportStatus" value="2" <% if (reportStatus != null && reportStatus.equals("2")) { %>checked<% } %>>
		     	 삭제
		    </label>
		    <label for="deleted" class="btn btnStatus btn-outline-primary">
		      <input type="radio" id="deleted" name="reportStatus" value="3" <% if (reportStatus != null && reportStatus.equals("3")) { %>checked<% } %>>
		      	반려
		    </label>
		  </div>
		</form>
		
		
	
		<div class="d-flex selectBox" >
			<form action="${path}/biz/reviewList">
				<select name="cnt" onchange="submit();" class="form-select" style="width:91px;">
					<c:forEach var="num" begin="5" end="30" step="5">
						<option value="${num }" ${requestScope.paging.pageLimit eq num ? "selected" : "" }>${num } 개</option>
					</c:forEach>
				</select>
			</form>
		
			<div style="margin-right: 1%; padding-top: 1%;">
				<c:if test="${not empty requestScope.paging.page}">
					총 ${reviewCnt }개의 리뷰가 있습니다.
				</c:if>
			</div>
	
		</div>
		
				
		<c:if test="${empty requestScope.paging.page}">
	            		<div class="review-box" style="margin-top: 3%;">
	            			사용자 리뷰가 없습니다
	            		</div>
	    </c:if>
		<c:if test="${not empty requestScope.paging.page}">
			
			<c:forEach var="reviewList" items="${requestScope.paging.page}">
		    <div class="review-box">
		        <div class="review-header">
		            <div class="review-header-item">${reviewList.rn}</div>
		            <div class="review-header-item">${reviewList.userId}</div>
		            <div class="review-header-item">${reviewList.reviewDate}</div>
		            <div class="review-header-item">${reviewList.reportStatus == 1 ? '상태 : 신고처리중' : reviewList.reportStatus == 2 ? '상태 : 삭제완료' : reviewList.reportStatus == 3 ? '상태 : 반려' : '' }</div>
		        </div>
		        <div class="review-content">
		            <%-- <a href="${path }/biz/reviewDetail?reviewNo=${reviewList.reviewNo }" class=""> --%>
		                ${reviewList.reviewContent}
		           <!--  </a> -->
		        </div>
		        <div class="review-footer">
		            <div class="review-footer-item">
		                <div class="form-control-plaintext">
		                    <c:forEach var="i" begin="1" end="5">
		                        <i class="fa${(reviewList.reviewStar)/2 >= i ? '-solid fa-star' : ((reviewList.reviewStar)/2 >= (i - 0.5) ? '-star-half-stroke fa-regular' : '-regular fa-star')}" style="color: #ffdd00;"></i>
		                    </c:forEach>
		                </div>
		            </div>
		            <div class="review-footer-item">
		                <c:choose>
		                    <c:when test="${reviewList.reportStatus == null }">	<!--reportStatus 타입이 integer이기 때문에 ''가 아닌 null 써야 함.   -->
		                        <button type="button" class="reportBtn btn" 
		                                data-bs-toggle="modal" data-bs-target="#reportModal" 
		                                data-bs-whatever="${reviewList.userId}"
		                                data-reviewno="${reviewList.reviewNo}"
		                                data-reportstatus="${reviewList.reportStatus }"
		                                style="background:#e1727d !important; margin-left: 89%;">신고하기</button>
		                    </c:when>
		                    <c:when test="${reviewList.reportStatus == 2 || reviewList.reportStatus == 3  }">
		                        <button class="btn"  disabled style="margin-left: 89%;">신고하기</button>
		                    </c:when>
		                    <c:when test="${reviewList.reportStatus == 1 }">
		                        <button type="button" class="cancleBtn btn"
		                                data-reviewno="${reviewList.reviewNo}"
		                                style="background: #71b77d !important; margin-left: 89%;">신고취소</button>
		                    </c:when>
		                </c:choose>
		            </div>
		        </div>
		    </div>
		</c:forEach>
			
		
			
			<!-- 신고하기 모달 -->
		<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="static">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 신고하기</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div>
		        <form class="modal-body was-validated">
		          <div class="mb-3">
		            <label for="recipient-name" class="col-form-label">신고대상 아이디</label>
		            <input type="text" class="form-control" id="recipient-name" readonly="readonly">
		          </div>
		          <div class="mb-3">
		          	<input type="hidden" id="selectdReviewNo">
		            <label for="message-text" class="col-form-label">신고사유 </label>
		            <textarea class="form-control" id="message-text" placeholder="Required example textarea" required></textarea>
		            <div class="invalid-feedback">
				      신고사유를 입력해주세요. 
				    </div>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary modalReport">신고하기</button>
		      </div>
		    </div>
		  </div>
		</div>
			
			
			  <c:if test="${not empty requestScope.paging.page}"> <!-- 신청서가 하나도 없으면 페이징X -->
				<ul class="pagination" style="padding-left : 40%;">
					<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
					<c:choose>
						<c:when test="${requestScope.paging.prevPage eq -1 }">
							<li class="page-item disabled"><a class="page-link">prev</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${path}/biz/selectByReportStatus?p=${requestScope.paging.prevPage }&reportStatus=${reportStatus}">prev</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="pNum" items="${requestScope.paging.pageList }">
						<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${path}/biz/selectByReportStatus?p=${pNum }&reportStatus=${reportStatus}">${pNum }</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${requestScope.paging.nextPage eq -1 }">
							<li class="page-item disabled"><a class="page-link">next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="${path}/biz/selectByReportStatus?p=${requestScope.paging.nextPage }&reportStatus=${reportStatus}">next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			  </c:if>
		  </c:if>
	  </div>
		
</div>	
<script>
const exampleModal = document.getElementById('reportModal')
exampleModal.addEventListener('show.bs.modal', event => {
  // Button that triggered the modal
  const button = event.relatedTarget
  // Extract info from data-bs-* attributes
  const recipient = button.getAttribute('data-bs-whatever')
  // If necessary, you could initiate an AJAX request here
  // and then do the updating in a callback.
  //
  // Update the modal's content.
  const modalTitle = exampleModal.querySelector('.modal-title')
  const modalBodyInput = exampleModal.querySelector('.modal-body input')

  modalTitle.textContent = `신고하기`
  modalBodyInput.value = recipient
})


$(document).ready(function(){
	$(".reportBtn").click(function(){
		console.log($(this).data("reviewno"));
		$("#selectdReviewNo").val($(this).data("reviewno"));
		console.log($("#selectdReviewNo").val());
		
		
	});
	
	$(".modalReport").click(function(){
		var reviewNo = $("#selectdReviewNo").val();
		var reportReason = $("#message-text").val();
		console.log("신고사유: "+$("#message-text").val());
		
		$.ajax({
			 url : "${pageContext.request.contextPath}/biz/reportReview"
			,type : "post"
			,data : { 
				 reviewNo : reviewNo
				,reportReason : reportReason
				}
			, success :function(result){
				console.log("컨트롤러로 보내기 성공");
				location.reload();
				alert("관리자가 승인 과정이 필요합니다. 조금만 기다려주세요. ");
			}
			, error : function(xhr, status, error){
				alert("신고사유를 입력해주세요.");
			}
 		}); //ajax
		
	});
});
</script>
<script>
$(document).ready(function(){
	$(".cancleBtn").click(function(){
		var reviewNo = $(this).data("reviewno");
		console.log("신고 취소 버튼 누르고 reviewNo :"+reviewNo)
		$.ajax({
			  url: "${pageContext.request.contextPath}/biz/cancleReport"
			, type : "post"
			, data : {reviewNo : reviewNo}
			, success : function(result){
				alert("신고가 취소되었습니다.");
				location.reload();
			}
			, error : function(){
				alert("에러가 발생했습니다. ");
			}
		})
	})
});
</script>

<!-- 분류에 따른 조회 -->
<!-- <script>
$(document).ready(function() {
	  $('input[type=radio][name=inlineRadioOptions]').change(function() {
		  if (this.value !== "0") { // radio_value 값이 0이 아닐 때에만 ajax 요청을 보냄
	    $.ajax({
	      url: "${pageContext.request.contextPath}/biz/selectByReportStatus.aj",
	      type: 'post',
	      data: { radio_value: this.value },
	      dataType:"json",
	      success: function(response) {
	    	  console.log(response);
	        //location.reload();
	        displayFrm(response);
	      },
	      error: function(xhr) {
	    	  alert("에러가 발생했습니다. ");
	      		}
	    	});
		  } 
	  });
	});
</script> -->

<!-- 버튼으로 분류 조회 -->
<!-- <script type="text/javascript">

	$(document).ready(function() {
		$('#all').on("click", function() {
		      // reportStatus 값을 form의 hidden input에 설정하고 form 제출
		      $('#reportStatus').val(0);
		      $('#reportStatusForm').submit();
		    });
		
	    $('#inProgress').on("click", function() {
	      // reportStatus 값을 form의 hidden input에 설정하고 form 제출
	      $('#reportStatus').val(1);
	      $('#reportStatusForm').submit();
	    });
	  
	    $('#deleted').on("click", function() {
	      // reportStatus 값을 form의 hidden input에 설정하고 form 제출
	      $('#reportStatus').val(2);
	      $('#reportStatusForm').submit();
	    });
	
	    $('#rejected').on("click", function() {
	      // reportStatus 값을 form의 hidden input에 설정하고 form 제출
	      $('#reportStatus').val(3);
	      $('#reportStatusForm').submit();
	    });
  });
  
</script> -->

<script type="text/javascript">
  $(document).ready(function() {
    $('input[type=radio][name=reportStatus]').change(function() {
      // 선택한 라디오 버튼의 값을 form의 hidden input에 설정하고 form 제출
      $('#reportStatus').val(this.value);
      $('#reportStatusForm').submit();
    });
  });
</script>


<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
		(() => {
		  'use strict'
		
		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  const forms = document.querySelectorAll('.needs-validation')
		
		  // Loop over them and prevent submission
		  Array.from(forms).forEach(form => {
		    form.addEventListener('submit', event => {
		      if (!form.checkValidity()) {
		        event.preventDefault()
		        event.stopPropagation()
		      }
		
		      form.classList.add('was-validated')
		    }, false)
		  })
		})()
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