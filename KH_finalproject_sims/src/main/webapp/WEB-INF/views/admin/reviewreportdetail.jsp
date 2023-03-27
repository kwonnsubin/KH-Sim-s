<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 리뷰 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container mb-5 mt-6 w-75">
		<!-- 게시판 상세글 -->
		<button id="delete-btn">삭제</button>
		<button id="reject-btn">반려</button>
		<div class="mb-44">
				<div class="row  bg-light  " style="height:50px;">
					<div class="d-inline col-3  ">
						<div class="d-inline">통신사</div>
						<div class="d-inline">${detail.bizId }</div>
					</div>
					<div class="d-inline col-3  ">
						<div class="d-inline">작성자</div>
						<div class="d-inline">${detail.userId }</div>
					</div>
					<div class="d-inline col ">
						<div class="d-inline">신고일자</div>
						<div class="d-inline">${detail.reportDate }</div>
					</div>
					<div class="d-inline col ">
						<div class="d-inline">처리상태</div>
						<div class="d-inline">${detail.reportStatus }</div>
					</div>
				</div>
				<!-- 신고된 리뷰 내용 -->
				<div class="row  w-auto " style="width:1000px; height:300px;">
					<p class="col">${detail.reviewContent }</p>
				</div>
		</div>
	</div>
</body>

<script>
$(function() {
  $('#reject-btn').click(function() {
    if (confirm("반려하시겠습니까?")) {
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


$(function() {
    $("#delete-btn").click(function() {
        if (confirm("삭제하시겠습니까?")) {
            var reviewNo = ${detail.reviewNo};
            $.ajax({
                url: "<%=request.getContextPath()%>/admin/reviewreportstatus",
                data: {reviewNo: reviewNo, reviewHidden: 1, reportStatus: 2},
                type: "POST",
                success: function() {
                    alert("삭제되었습니다.");	        
                    location.reload(); // 페이지 새로고침
                },
                error: function() {
                    alert("오류가 발생했습니다.");
                }
            });
        }
    });
});
</script>
</html>