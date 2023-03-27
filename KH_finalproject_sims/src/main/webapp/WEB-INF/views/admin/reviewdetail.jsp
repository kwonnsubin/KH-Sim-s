<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세 내용</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container mb-5 mt-6 w-75">
		<!-- 게시판 상세글 -->
		<button id="delete-btn">삭제</button>
		<div class="mb-44">
				<div class="row  bg-light  " style="height:50px;">
					<div class="d-inline col-3  ">
						<div class="d-inline">사용자</div>
						<div class="d-inline">${reviewdetail.bizId }</div>
					</div>
					<div class="d-inline col-3  ">
						<div class="d-inline">작성일</div>
						<div class="d-inline">${reviewdetail.reviewDate }</div>
					</div>
					<div class="d-inline col ">
						<div class="d-inline">리뷰내용</div>
						<div class="d-inline">${reviewdetail.reviewContent }</div>
					</div>
					<div class="d-inline col ">
						<div class="d-inline">별점</div>
						<div class="d-inline">${reviewdetail.reviewStar }</div>
					</div>
				</div>
				<!-- 신고된 리뷰 내용 -->
				<div class="row  w-auto " style="width:1000px; height:300px;">
					<p class="col">${reviewdetail.reviewContent }</p>
				</div>
		</div>
	</div>
</body>
<script>
$(function() {
	  $('#delete-btn').click(function() {
	    if (confirm("삭제하시겠습니까?")) {
			var reviewNo = ${detail.reviewNo};    	
		    $.ajax({
			      type: 'POST',
			      url: '<%=request.getContextPath()%>/admin/reviewreportstatus',
			      data: {reviewNo: reviewNo, reviewHidden: 0, reportStatus: 3},
			      success: function(result) {
						alert('반려 처리되었습니다.');
				        location.reload(); // 페이지 새로고침
			      },
			      error: function() {
			        alert('오류가 발생하였습니다.');
			      }
		   	 });
	    	}
	 	 });
	});

</script>
</html>