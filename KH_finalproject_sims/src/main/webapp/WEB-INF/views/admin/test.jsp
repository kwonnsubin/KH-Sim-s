<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
</head>
<body>
<jsp:include page="./include/header.jsp" />
<div class="pcoded-main-container">
	<div class="pcoded-wrapper container">
		<div class="pcoded-content">
			<div class="pcoded-inner-content">
				<div class="pcoded-inner-content">
					<div class="main-body">
						<div class="page-wrapper">
							<div class="page-header">
								<div class="page-block">
									<div class="row align-items-center">
										<div class="col-md-12">
											<div class="page-header-title">
												<h5 class="m-b-10">공지사항
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 상세</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</h5>
											</div>
											<ul class="breadcrumb">
												<li class="breadcrumb-item"><a href=""><i class="feather icon-home"></i></a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>신고 관리</a></li>
												<li class="breadcrumb-item"><a href=""><i class="breadcrumb-item"></i>신고관리
													<c:choose>
														<c:when test="${cmd eq 'read' }"> 상세</c:when>
														<c:otherwise> 수정</c:otherwise>
													</c:choose>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<form action="<%=request.getContextPath()%>/adminNotice/saveNoticeModify" method="post">
								<div class="col-md-12">
									<div class="simsBtn m-b-15">
										<input class="btn btn-primary right m-l-10" type="button" onclick="location.href='<%=request.getContextPath()%>/adminNotice/deleteNotice?ntcNo=${noticeDetail.ntcNo}'" value="삭제">
										<c:choose>
											<c:when test="${cmd eq 'read' }">
												<input class="btn btn-primary right" type="button" onclick="location.href='<%=request.getContextPath()%>/adminNotice/selectNoticeModify/${noticeDetail.ntcNo}'" value="수정">
											</c:when>
											<c:otherwise>
												<input class="btn btn-primary right" type="submit" value="저장">
											</c:otherwise>
										</c:choose>
										<input type="hidden" value="${username }" name="adminId">
										<input type="hidden" value="${noticeDetail.ntcNo }" name="ntcNo">
									</div>
								</div>
								<div class="card text-center">
									<div class="card-body">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
	                                       			<input type="text" class="form-control" name="ntcTitle" <c:if test="${cmd eq 'read' }">readonly</c:if> value="${noticeDetail.ntcTitle }">
	                                   			</div>
											</div>
											<!-- <div class="row"> -->
												<div class="col-sm-12">
													<form>
					                                    <div class="form-group row">
					                                    	<label for="bizId" class="col-sm-2 col-form-label left">통신사</label>
					                                        <div class="col-sm-3">
					                                            <input type="text" readonly class="form-control-plaintext" name="bizId" value="${detail.bizId }">
					                                        </div>
					                                        <label for="adminId" class="col-sm-2 col-form-label left">작성자</label>
					                                        <div class="col-sm-3">
					                                            <input type="text" readonly class="form-control-plaintext" name="adminId" value="${detail.userId }">
					                                        </div>
					                                        <label for="staticEmail" class="col-sm-2 col-form-label">신고일</label>
					                                        <div class="col-sm-3">
					                                            <input type="text" readonly class="form-control-plaintext" value="<fmt:formatDate value="${detail.reportDate }" pattern="yyyy.MM.dd"/>">
					                                        </div>
					                                        <label for="reportStatus" class="col-sm-2 col-form-label left">신고일</label>
					                                        <div class="col-sm-3">
					                                            <input type="text" readonly class="form-control-plaintext" name="reportStatus" value="${detail.reportStatus }">
					                                        </div>

					                                    </div>
					                                </form>
				                                </div>
			                                <!-- </div> -->
											<div class="col-sm-12">
												<div class="form-group">
			                                        <textarea class="form-control" name="ntcContent" rows="20" <c:if test="${cmd eq 'read' }">readonly</c:if>>${detail.reviewContent }</textarea>
			                                    </div>
											</div>
										</div>
									</div>
								</div>	
							</form>
						</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="./include/footer.jsp" />
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
</body>
</html>