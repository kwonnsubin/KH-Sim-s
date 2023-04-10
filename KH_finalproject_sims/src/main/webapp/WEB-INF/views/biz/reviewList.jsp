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
<jsp:include page="/WEB-INF/views/biz/nav.jsp"/>

통신사 (자사 ) 리뷰 리스트
	<div>
		<form action="${path}/biz/reviewList">
			<select name="cnt" onchange="submit();">
				<c:forEach var="num" begin="5" end="30" step="5">
					<option value="${num }" ${requestScope.paging.pageLimit eq num ? "selected" : "" }>${num } 개</option>
				</c:forEach>
			</select>
		</form>
	</div>

	<table class="table">
	 	<thead>
	 		<tr>
				<th>번호</th>
				<th>리뷰내용</th>
				<th>별점</th>
				<th>작성자</th>
				<th>작성일자</th>	
				<th>관리</th>
				<th>상태</th>
	 		</tr>
	 	</thead>
	 	<tbody>
	 			<c:if test="${empty requestScope.paging.page}">
            		<tr>
            			<td colspan="6">사용자 리뷰가 없습니다.</td>
            		</tr>
            	</c:if>
	 	
	 			<c:if test="${not empty requestScope.paging.page}">
	 				<c:forEach var="reviewList" items="${requestScope.paging.page}">
	 					<tr>
	 						<td>${reviewList.rn} </td>
	 						<td>${reviewList.reviewContent} </td>

	 						<td>
	 						<div class="form-control-plaintext">
							  <c:forEach var="i" begin="1" end="5">
							    <i class="fa${reviewList.reviewStar >= i ? '-solid' : (reviewdetail.reviewStar >= (i - 0.5) ? '-half-stroke' : '-regular')} fa-star" style="color: #ffdd00;"></i>
							  </c:forEach>
							</div>
							</td>
 
	 						<td>${reviewList.userId} </td>
	 						<td>${reviewList.reviewDate} </td>
	 						
	 						<c:choose>
	 						<c:when test="${reviewList.reportStatus == '' }">
	 						<td><button type="button" class="reportBtn" 
	 						data-bs-toggle="modal" data-bs-target="#reportModal" 
	 						data-bs-whatever="${reviewList.userId}"
	 						data-reviewno="${reviewList.reviewNo}"
	 						data-reportstatus="${reviewList.reportStatus }">신고하기</button></td>
	 						</c:when>
	 						<c:when test="${reviewList.reportStatus == 2 || reviewList.reportStatus == 3  }">
	 							<td><button disabled>신고하기</button></td>
	 						</c:when>
	 						<c:when test="${reviewList.reportStatus == 1 }">
	 							<td><button type="button" class="cancleBtn"
	 							data-reviewno="${reviewList.reviewNo}">신고취소</button></td>
	 						</c:when>
	 						</c:choose>
	 						<td>${reviewList.reportStatus == 1 ? '신고처리중' : reviewList.reportStatus == 2 ? '삭제완료' : reviewList.reportStatus == 3 ? '반려' : ''  }</td>
	 					</tr>
	 				</c:forEach>
	 			</c:if>
	 	</tbody>
	</table>
	
	<!-- 신고하기 모달 -->
<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰 신고하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">신고대상 아이디</label>
            <input type="text" class="form-control" id="recipient-name" readonly="readonly">
          </div>
          <div class="mb-3">
          	<input type="hidden" id="selectdReviewNo">
            <label for="message-text" class="col-form-label">신고사유 </label>
            <textarea class="form-control" id="message-text"></textarea>
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
	
	 <!-- 페이지 번호 -->
     <c:if test="${not empty requestScope.paging.page}"> <!-- 신청서가 하나도 없으면 페이징X -->
		<ul class="pagination">
			<c:set var="pageNumber" value="${empty param.p ? 1 : param.p }" />
			<c:choose>
				<c:when test="${requestScope.paging.prevPage eq -1 }">
					<li class="page-item disabled"><a class="page-link">prev</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${path}/biz/reviewList?p=${requestScope.paging.prevPage }">prev</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="pNum" items="${requestScope.paging.pageList }">
				<li class="page-item ${pNum eq pageNumber ? 'active' : '' }"><a class="page-link" href="${path}/biz/reviewList?p=${pNum }">${pNum }</a></li>
			</c:forEach>
			<c:choose>
				<c:when test="${requestScope.paging.nextPage eq -1 }">
					<li class="page-item disabled"><a class="page-link">next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${path}/biz/reviewList?p=${requestScope.paging.nextPage }">next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	  </c:if>

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
				alert("에러가 발생했습니다.");
				// 이미 신고된 리뷰일 경우 에러 창 뜨게 됨. reviewNo가 pk 걸려있어서.. 
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